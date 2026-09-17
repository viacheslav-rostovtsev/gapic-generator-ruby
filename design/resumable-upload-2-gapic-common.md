# `::Gapic::ResumableUpload` — the upload coordinator

The gapic-common half of resumable upload support in generated clients. The generator half is in [resumable-upload-2-generator.md](resumable-upload-2-generator.md).

This revision collapses a layer. `Gapic::Rest::ResumableUpload::Session` is **deleted** and the handle becomes the single coordinator above `Driver`. The rest of the protocol implementation — `Driver`, `Core`, `Rules`, the config and data types, the errors — is untouched apart from two small additive changes on `Driver` (§9).

## 1. Why `Session` goes

`Session` does four things: it partitions constructor-shared arguments from per-run ones and builds the config `Data`; it resolves the resume argument forms; it enforces one run per object; and it exposes mutex-guarded readers that delegate to `Driver`.

The handle, as designed, already does three of them. It has its own mutex-guarded lifecycle flag, its own three resume forms, and its own readers — and it has to, because each run gets a fresh `Session`, so the session's own single-run guard can never fire for a handle misuse. A layer whose invariant must be re-implemented one level up is not carrying its weight.

`bound?` is the visible symptom. It exists only because `Driver` is single-use and `Session` chose to encode that as object identity: a session is spent once it has executed or learned an upload URL. A reusable handle solves the same problem by building a fresh `Driver` per run, at which point `bound?` describes nothing a caller can act on.

So the layering becomes:

```
::Gapic::ResumableUpload   public; one per generated method call, reusable across runs
        │  builds StartUploadConfig / ResumeUploadConfig, then one Driver per run
        ▼
Driver → Core → Rules      @private, unchanged
```

**This narrows the audience to generated clients, deliberately.** `Session` was usable directly, with a plain `client_stub` and a raw-body return. The handle takes procs and decodes into a protobuf type, because that is what a generated method has to hand it. Code that drives the protocol directly today — the Ads acceptance repo, gapic-common's own integration tests — adapts by wrapping its stub in a lambda. The feature is unreleased, so no published contract breaks.

## 2. Construction

```ruby
::Gapic::ResumableUpload.new client_stub_proc:,
                             initial_request_proc:,
                             response_type:,
                             initial_headers: {},
                             start_retry_policy: nil,
                             error_handler: nil,
                             method_name: nil
```

The constructor is `@private`; instances come from generated client methods.

| Argument | Type | Purpose |
|---|---|---|
| `client_stub_proc` | `Proc` → `Gapic::Rest::ClientStub` | called at the top of every run; may raise if the client cannot do REST |
| `initial_request_proc` | `Proc` → `[String, String]` | returns `[url, body]` for initiation; called by `#start` only |
| `response_type` | `Class` | protobuf message class used to decode the final body |
| `initial_headers` | `Hash` | forwarded as the initiation headers |
| `start_retry_policy` | `Hash`, `RetryPolicy`, `nil` | forwarded into `StartUploadConfig` |
| `error_handler` | `Proc` → `Exception`, `nil` | wraps run failures, see §7 |
| `method_name` | `String`, `nil` | RPC name used in log entries |

**Procs only; there is no value form.** Both are deferred deliberately. `client_stub_proc` lets a client that cannot perform REST calls still hand back a working object and fail only when an upload is actually attempted. `initial_request_proc` means the initiation URL and body are computed on `#start` and never on `#resume`, so a handle built without a request message is still fully functional for resuming. A caller holding a concrete stub writes `client_stub_proc: -> { stub }`; adding a second, value-shaped constructor path to save those characters would double the argument validation for no gain.

`initial_headers` accepts the symbol-keyed metadata hash that generated clients carry; the handle stringifies keys and values before building `StartUploadConfig`, which rejects the five reserved `X-Goog-Upload-*` names case-insensitively.

**No `logger` argument.** `Driver#initialize` already falls back to `client_stub.logger` when none is passed, and a generated client always has a stub with a configured logger. The handle passes no logger and lets that fallback run.

## 3. Runs

```ruby
def start  stream:, content_type: nil, upload_size: nil, chunk_size: nil,
           upload_timeout: nil, on_progress: nil

def resume stream:, resume_handle: nil, content_type: nil, upload_size: nil,
           upload_timeout: nil, on_progress: nil
```

Everything `Session` used to take in its constructor and share across a run — stream, `upload_size`, `content_type`, the upload budget, `on_progress` — is now a per-run keyword, because the object outlives the run. The stream is the first argument and is a keyword; there is no positional form. Both methods are synchronous and return the decoded response message.

Two arguments are deliberately absent from both signatures. **`control_plane_retry_policy` and `data_plane_retry_policy` are not exposed by the handle at all**: generated clients have nothing to derive them from, the protocol defaults are what every real caller wants, and a test that needs to drive chunk-level retry behaviour constructs a `Driver` directly, which is the seam this design keeps open. **`chunk_size` is a `#start` argument only** — a resumed run takes its chunk size from the `ResumeHandle`, because the server reports its granularity during initiation and a resumed run skips initiation.

Order of operations in each run, before any byte is read from the stream:

1. Take the lifecycle guard: raise `SessionStateError` if a run is already in flight.
2. `#resume` only: reject a stream that is not positioned at byte 0 (`stream.pos.zero?`, when the stream responds to `pos`), then resolve the `ResumeHandle` — the argument if given, otherwise the retained driver's.
3. `client_stub_proc.call` — raises here if REST is unavailable.
4. `#start` only: `initial_request_proc.call` → `[url, body]`.
5. Build `StartUploadConfig` or `ResumeUploadConfig` directly — no `Driver` factory methods are added — then `Driver.new client_stub:, config:`, and retain it.
6. Run it; decode and return, or wrap and raise.

Step 6 clears the lifecycle flag in an `ensure`, not on the success and failure paths separately. Every exit — a clean return, a protocol error, an `on_progress` callback raising, a `Timeout`, a `Thread#kill` — must leave `running?` false and the driver retained, or the handle is permanently unusable for exactly the callers who most need to resume. `Session` had this bug once already: it set `@running` before constructing the `Driver`, so a config `ArgumentError` left the session running forever.

Config construction is the one piece of `Session` that survives verbatim: the same shared members, the same two `Data` classes, the same `ArgumentError`s out of their constructors for reserved headers or a non-positive `chunk_size`. Those validations stay where they are.

The handle is reusable: one handle, many runs, one `Driver` per run. A second run started while one is in flight raises `Gapic::Rest::ResumableUpload::SessionStateError` — the error name survives the class, because what it names is the server-side upload session, not a Ruby object. Unlike a `Session`, a handle that has completed a run may legitimately start another one; that is the point of reuse, and it is the caller's business whether a second `#start` means a second upload. Every optional keyword is passed through untouched — in particular `upload_timeout` is only forwarded when the caller sets it, otherwise `Driver`'s own resolution applies (`upload_size / 1 MB per second`, floored at one hour; one hour flat when the size is unknown).

### `upload_timeout`, not `timeout`

The keyword that carries the whole-upload budget is named `upload_timeout` on both run methods, even though the config member behind it is `timeout`. Generated clients already have a `timeout` in scope on every call — the per-RPC one from `CallOptions`, which in an upload governs the initiation request alone and reaches the handle through `start_retry_policy` (§7). Two numbers, three orders of magnitude apart, silently substitutable for one another, is the kind of bug that only shows up on the slow uploads nobody tests. The names now say which is which.

The naming is not the whole defence; the documentation has to state the split from both sides. The handle's YARD for `upload_timeout:` says it bounds the entire run — every request, every retry, every byte — and that the per-call `timeout` a generated client passes covers only the request that creates the upload session. The generated method's `@param options` block says the same thing from the other end and points here; the generator design carries the exact wording.

### Resume forms

| Call | Behaviour |
|---|---|
| `resume stream: io` | takes the retained driver's `resume_handle` |
| `resume stream: io, resume_handle: h` | takes an explicit `ResumeHandle`, which is what the protocol's own errors carry and what a caller persists between processes |

Both forms resolve to a `ResumeHandle`, and the bare form raises `ArgumentError` when the retained driver has none. That one rule covers three situations: a handle that has never run, a run that finished successfully, and a run that failed in a way the protocol considers unresumable (rejected, cancelled).

**There is no explicit `upload_url:` / `chunk_size:` form.** A raw URL and chunk size are exactly the two fields of a `ResumeHandle`, so the third form bought nothing but a second argument-validation path and the ability to aim a resume at a finalized upload, whose behaviour is undefined and server-dependent. A caller who has the two values in a database row constructs the handle: `ResumeHandle.new upload_url: row[:url], chunk_size: row[:chunk_size]`. Dropping the form is also what lets the handle's reader set shrink to three (§4) and keeps `Driver` at a single additive change (§9).

The stream must be positioned at byte 0 of the whole object; the driver fast-forwards to the server's offset itself, by seeking or by reading and discarding.

## 4. Readers

All read from the retained driver under the handle's mutex, and are safe to call from another thread mid-run, returning a best-effort snapshot. All are `nil`/`false` before the first run.

| Reader | Source |
|---|---|
| `#resume_handle` | `Driver#resume_handle` — carries the upload URL and the resolved chunk size; `nil` for finalized uploads |
| `#resumable?` | `!resume_handle.nil?` |
| `#running?` | the handle's own lifecycle flag |

`#upload_url` and `#chunk_size` are **not** exposed. Both are fields of the `ResumeHandle` this set already returns, and once the explicit resume form is gone, nothing a caller can do with them separately is anything but a worse way of resuming. Dropping them also removes the one reason to add a `#chunk_size` reader to `Driver`, leaving `method_name` as the entire driver-side change (§9).

## 5. Response decoding

```ruby
return body if @response_type.nil?
@response_type.decode_json body.to_s, ignore_unknown_fields: true
```

Decoding is identical to what a generated REST service stub does with a unary response. An empty or absent final body decodes to an empty message (`decode_json ""` returns an empty message); malformed JSON raises `Google::Protobuf::ParseError`. The `to_s` is only there because a bodiless `200` surfaces as `nil` out of `Driver#run`.

**`response_type: nil` returns the raw body**, exactly as `Driver#run` produced it — a `String`, or `nil` when the final response carried none. This is `@private` behaviour and is documented as such: every generated call site passes a real message class, and the escape hatch exists so that gapic-common's own tests can assert on what the server actually sent without the gem needing a protobuf message class of its own to decode into. It is one branch, and it is cheaper than the alternative of routing the protocol tests through `Google::Protobuf::Struct`, which would make every assertion about the wire response an assertion about Struct's JSON mapping instead.

## 6. Error handling

`error_handler` is a lambda that **returns** the exception to raise. It must not raise; the handle needs the value back in order to post-process it.

```ruby
rescue ::StandardError => e
  raise e unless @error_handler
  wrapped = @error_handler.call e
  raise e if wrapped.nil? || wrapped.equal?(e)
  if e.is_a?(Gapic::Rest::ResumableUpload::HasResumeHandle) &&
     !wrapped.is_a?(Gapic::Rest::ResumableUpload::HasResumeHandle)
    wrapped.extend Gapic::Rest::ResumableUpload::HasResumeHandle
    wrapped.instance_variable_set :@resume_handle, e.resume_handle
  end
  raise wrapped
```

The re-`extend` is the load-bearing part. Library-specific error types (for example a `Google::Cloud::Error` built by a cloud client) would otherwise erase the fact that the upload is resumable. `HasResumeHandle` is a plain module with `attr_reader :resume_handle`, so extending the instance and setting the ivar makes both `rescue Gapic::Rest::ResumableUpload::HasResumeHandle` and `#resume_handle` work on the wrapped error.

A handle constructed without an `error_handler` propagates protocol errors unchanged. Either way the handle's own `#resume_handle` reader still reports the retained driver's, so a caller can recover without touching the exception.

## 7. `start_retry_policy_for`

```ruby
::Gapic::Rest::ResumableUpload.start_retry_policy_for options   # options: Gapic::CallOptions
                                                                # => Hash
```

A **`@private`** module function on `Gapic::Rest::ResumableUpload`, called by generated clients and by nothing else. Marking it private settles the placement question that hanging it off the handle was previously answering: since it appears in no published documentation, the argument for keeping the public surface to a single constant no longer applies, and the remaining consideration is cohesion. It produces an override Hash for the initiation retry policy, so it belongs beside `RetryPolicies::START_DEFAULTS`, which defines what it is overriding.

Converts the per-call options that generated clients already assemble into the initiation retry policy.

* **Returns a Hash, never a policy object.** The protocol implementation treats a `RetryPolicy` object as a wholesale replacement and a Hash as a per-key override. Initiation's default policy carries a predicate that treats a response missing `X-Goog-Upload-Status` as retriable gateway noise; handing it an object would silently drop that.
* **Always sets `timeout:`** from `options.timeout`. This becomes the local deadline of the initiation request only. Without it, initiation inherits `Gapic::Common::RetryPolicy::DEFAULT_TIMEOUT` (3600 s), because `Gapic::CallOptions::RetryPolicy` never populates `@timeout` even though it subclasses `Gapic::Common::RetryPolicy`.
* **Copies backoff settings and retry codes only where the caller set them.** An empty `retry_codes` list counts as unset, so the initiation defaults survive a policy that only customises, say, `initial_delay`.
* **Raises `ArgumentError` for a Proc** (or any other non-`Gapic::Common::RetryPolicy` callable) retry policy. A per-error predicate has no coherent meaning across the three retry planes of an upload, and silently ignoring it would be worse.

The whole-upload budget is deliberately not derived here. It stays at the driver's default and is overridable per run via `upload_timeout:` (§3).

## 8. Retry policy placement

The three planes are unchanged in behaviour, but only one of them is reachable through the handle.

| Policy | Governs | Reachable via | Notes |
|---|---|---|---|
| `start_retry_policy` | initiation | the handle's **constructor** | derived from the generated method's `CallOptions` by §7 |
| `control_plane_retry_policy` | `query`, `cancel` | **not exposed** | protocol default only; set it by constructing a `Driver` directly |
| `data_plane_retry_policy` | `upload`, `finalize` | **not exposed** | same |

`Session` accepted all three, which made sense when it was the protocol's public face. The handle is a client-library coordinator: a generated method has no source for a chunk-level retry policy, and offering the knob anyway would mean carrying validation and documentation for an argument nothing generates. The capability is not lost, only relocated — `Driver.new client_stub:, config:` takes a fully populated config, and that is how the protocol tests exercise these planes.

The published documentation for what the three planes do, including the table of defaults and the differing treatment of a missing `X-Goog-Upload-Status` header, moves from the `Session` class doc onto the handle, with the two unexposed planes described as defaults rather than as arguments.

## 9. Changes to `Driver`

One additive change, and nothing else in `Driver`, `Core` or `Rules`.

**`method_name`.** An upload's log entries should identify the RPC that started it. Generated clients pass the method name they already use for logging on every other call (`"create_you_tube_video_upload"`), the handle forwards it to `Driver`, and `Driver` interpolates it into the per-request logging name it currently hardcodes at five sites:

```ruby
# today
method_name: "ResumableUpload.start"
# with the RPC name threaded through
method_name: "#{@method_name || 'ResumableUpload'}.start"
```

One new optional keyword, five interpolated strings. A `Driver` built without a `method_name` logs exactly as it does today. Because `Session` is gone, the keyword is threaded in one place rather than two.

The existing `#upload_url` and `#resume_handle` readers are enough for everything the handle needs: `#resume_handle` backs the handle's reader and both resume forms, and `#upload_url` stays where it is, used by the driver's own logging. No `#chunk_size` reader is added — with the explicit resume form gone, the resolved chunk size is only ever wanted as part of a `ResumeHandle`, which already carries it.

## 10. Deletions

| Item | Disposition |
|---|---|
| `lib/gapic/rest/resumable_upload/session.rb` | deleted |
| `require` in `lib/gapic/rest/resumable_upload.rb` | deleted |
| `Session#bound?` and the two-state model | deleted; `#running?` is the whole lifecycle a caller can observe |
| `SessionStateError` | **kept**, in place, renaming nothing; its YARD doc drops the reference to the deleted class |
| `Progress`, `ResumeHandle`, `HasResumeHandle`, the other errors | unchanged |

With `Session` gone, the `Gapic::Rest::ResumableUpload` namespace contains no public entry point at all — everything in it is `@private` except the data types and errors. Its module documentation has to say, in as many words, that the entry point is `::Gapic::ResumableUpload`.

## 11. Packaging and release order

The handle is a new file, `lib/gapic/resumable_upload.rb`, required from `lib/gapic/rest.rb` next to the existing `require "gapic/rest/resumable_upload"`. It is not under `gapic/rest/` because it is not part of the protocol implementation: it is the coordinator built on top of it, and its constant is `::Gapic::ResumableUpload`. Requiring it from `gapic/rest.rb` means any generated client that already does `require "gapic/rest"` — which the generated upload stub does on construction — gets it for free, with no extra require in generated code.

Release order is forced, and it is one way only:

1. Ship this document's changes in a `gapic-common` release: the handle, the `Session` deletion, and the two `Driver` additions. Since the feature is unreleased, the deletion is invisible from the outside and this is a minor version bump.
2. Only then raise the generated-gemspec dependency floor in the generator (`GemPresenter#dependencies`, currently `"gapic-common" => "~> 1.3"`) to that release.
3. Then land the generator change and its goldens.

Step 2 rewrites every golden gemspec in the repository, so it cannot be split from step 3 in practice — but it also cannot precede step 1, because generated clients would then declare a floor that does not exist on rubygems.

## 12. Non-goals

* The handle adds nothing to `on_progress`. The callback is passed straight through; whatever semantics its return value acquires (pausing, cancelling) are defined by the protocol implementation, not here.
* No upload-size inference from the stream. If the caller wants `upload_size`, they pass it.
* No `#cancel`. The cancellation decision is not ready to ship, and collapsing the layer does not change that: when it lands, it lands on the handle rather than on a `Session`. One placement consequence to note now — the sentinel constants that `on_progress` will return to pause or cancel a run belong on the `Gapic::Rest::ResumableUpload` module, not on any coordinator class, since there is no longer a `Session` to hang them off.
* No changes to `Progress`, to the phase list, to the config `Data` types, or to the driver's request construction.

## 13. Tests

The `Session` test files are ported, not deleted — the behaviour they cover still exists, one layer up.

* `test/gapic/rest/resumable_upload/session_test.rb` → `resumable_upload_test.rb`, driving the handle. The `build_session` / `start_session` helper pair, which partitions overrides with `START_ONLY_KEYS`, collapses: the handle's constructor and run arguments are already partitioned the way the helper was faking.
* `integration/resumable_upload/resume_test.rb` → the handle, using both resume forms against a live showcase server.
* **Tests that need protocol detail keep driving `Driver` directly** — the control- and data-plane retry policies, unseekable streams, buffer realignment, deadline behaviour. The handle deliberately does not expose those seams, and `Driver.new client_stub:, config:, core:` remains the injection point it is today.

New or reworked coverage on the handle:

* Both procs are called in the right order and only when they should be: `initial_request_proc` on `#start`, never on `#resume`; `client_stub_proc` on both, before anything reads the stream.
* A raising `client_stub_proc` surfaces before the stream is touched.
* Config construction: a start run produces a `StartUploadConfig` carrying the initiation URL, body, headers and start policy; a resume run produces a `ResumeUploadConfig` carrying the handle's URL and chunk size; `upload_timeout` lands on `config.timeout` and is omitted when unset.
* Lifecycle: a second concurrent run raises `SessionStateError`; a completed handle can start again and builds a second driver; the flag is released after a failed run, after an `on_progress` callback raises, and after a config `ArgumentError`.
* Resume: both forms; the byte-0 precondition; the bare form reading the retained driver after a failure; the bare form raising `ArgumentError` with no previous run, after a success, and after an unresumable failure.
* Decoding: populated body, empty body, `nil` body, malformed body, and `response_type: nil` returning the raw body.
* Error wrapping: wrapped error is raised, is rescuable as `HasResumeHandle`, and reports the original `#resume_handle`; a handler returning `nil` re-raises the original; an error with no resume handle is not decorated.
* `start_retry_policy_for`: timeout injection, selective copying, empty retry codes, Proc rejection.
* `Driver`: `method_name` appears in log entries and defaults to `ResumableUpload.*` without it.

## 14. Documentation pass

`Session`'s class comment is the current home of most of the feature's published narrative. It has to be relocated and rewritten, not simply moved:

* The **two-state model** and the recovery-by-constructing-a-new-session example are obsolete. The replacement narrative is the reusable handle: one object, `#start`, then `#resume` on the same object after a failure.
* The **retry policy** section, the **defaults** section and the **where arguments live** section move onto the handle, rewritten for the reduced surface in §8: one policy is an argument, two are defaults.
* The **two timeouts** get explicit treatment wherever either appears: `upload_timeout:` on both run methods, the `timeout:` key inside a `start_retry_policy` Hash, and the class overview. Each says which requests it bounds and names the other.
* `.yardopts` keeps `--no-private`; the published surface becomes `::Gapic::ResumableUpload`, `Progress`, `ResumeHandle`, `HasResumeHandle` and the error classes.
* In-repo design docs must follow: `design/resumable_upload/implementation-guide.md` §1.5 is the `Session` contract and is currently out for review, and `design/resumable_upload/integration-test-plan.md` describes session-based tests. Both need the same collapse applied.
* `README.md` and `CHANGELOG.md` remain deferred to release time.
