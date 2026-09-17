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
def start  stream:, content_type: nil, upload_size: nil, chunk_size: nil, timeout: nil,
           on_progress: nil, control_plane_retry_policy: nil, data_plane_retry_policy: nil

def resume stream:, upload_url: nil, chunk_size: nil, resume_handle: nil, **same_options
```

Everything `Session` used to take in its constructor and share across a run — stream, `upload_size`, `content_type`, `timeout`, the control- and data-plane retry policies, `on_progress` — is now a per-run keyword, because the object outlives the run. The stream is the first argument and is a keyword; there is no positional form. Both methods are synchronous and return the decoded response message.

Order of operations in each run, before any byte is read from the stream:

1. Take the lifecycle guard: raise `SessionStateError` if a run is already in flight.
2. `#resume` only: reject a stream that is not positioned at byte 0 (`stream.pos.zero?`, when the stream responds to `pos`), and resolve the resume arguments to `[upload_url, chunk_size]`.
3. `client_stub_proc.call` — raises here if REST is unavailable.
4. `#start` only: `initial_request_proc.call` → `[url, body]`.
5. Build `StartUploadConfig` or `ResumeUploadConfig` directly — no `Driver` factory methods are added — then `Driver.new client_stub:, config:`, and retain it.
6. Run it; decode and return, or wrap and raise. Release the lifecycle flag on both paths.

Config construction is the one piece of `Session` that survives verbatim: the same shared members, the same two `Data` classes, the same `ArgumentError`s out of their constructors for reserved headers, a non-positive `chunk_size` or a malformed retry policy. Those validations stay where they are.

The handle is reusable: one handle, many runs, one `Driver` per run. A second run started while one is in flight raises `Gapic::Rest::ResumableUpload::SessionStateError` — the error name survives the class, because what it names is the server-side upload session, not a Ruby object. Unlike a `Session`, a handle that has completed a run may legitimately start another one; that is the point of reuse, and it is the caller's business whether a second `#start` means a second upload. Every optional keyword is passed through untouched — in particular the whole-upload `timeout` is only forwarded when the caller sets it, otherwise `Driver`'s own resolution applies (`upload_size / 1 MB per second`, floored at one hour; one hour flat when the size is unknown).

### Resume forms

| Call | Behaviour |
|---|---|
| `resume stream: io` | reuses `upload_url` and `chunk_size` from this handle's retained driver |
| `resume stream: io, upload_url: u, chunk_size: c` | explicit, for a fresh process |
| `resume stream: io, resume_handle: h` | takes both from a `ResumeHandle`, which is what the protocol's own errors carry |

Mixing `resume_handle:` with `upload_url:`/`chunk_size:` raises `ArgumentError`, as does `upload_url:` without `chunk_size:` and vice versa. So does a bare `resume` on a handle with no previous run. The bare form reads the retained driver's `upload_url` and resolved `chunk_size` rather than its `resume_handle`, which is `nil` once the upload is finalized; resuming a finalized upload remains undefined behaviour, decided by the server's response to the query. The stream must be positioned at byte 0 of the whole object; the driver fast-forwards to the server's offset itself, by seeking or by reading and discarding.

## 4. Readers

All read from the retained driver under the handle's mutex, and are safe to call from another thread mid-run, returning a best-effort snapshot. All are `nil`/`false` before the first run.

| Reader | Source |
|---|---|
| `#upload_url` | `Driver#upload_url` (raw state URL, established or not) |
| `#chunk_size` | `Driver#chunk_size` (§9) — the resolved value, after the server's granularity has been applied |
| `#resume_handle` | `Driver#resume_handle` — `nil` for finalized uploads |
| `#resumable?` | `!resume_handle.nil?` |
| `#running?` | the handle's own lifecycle flag |

## 5. Response decoding

```ruby
response_type.decode_json body.to_s, ignore_unknown_fields: true
```

Unconditional, identical to what a generated REST service stub does with a unary response. An empty or absent final body decodes to an empty message (`decode_json ""` returns an empty message); malformed JSON raises `Google::Protobuf::ParseError`. The `to_s` is only there because a bodiless `200` surfaces as `nil` out of `Driver#run`.

> [!IMPORTANT]
> **Open decision: is `response_type` mandatory?** A single audience argues yes — every generated method has one. But gapic-common's own integration tests currently assert on the raw body, and the gem carries no protobuf message class to decode into. Either they decode into `Google::Protobuf::Struct` (available via the `google-protobuf` dependency, decodes any JSON object), or the handle treats `response_type: nil` as "return the raw body". The second is one line and keeps the protocol tests honest about what the server actually sent; it is also the only concession to the second audience. Recommendation: allow `nil`, document it as `@private` behaviour for the gem's own tests, and keep every generated call site passing a real type.

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
::Gapic::ResumableUpload.start_retry_policy_for options   # options: Gapic::CallOptions
                                                          # => Hash
```

A class method on the handle, not on the `Gapic::Rest::ResumableUpload` protocol namespace. It exists to serve generated clients, it is meaningless without `Gapic::CallOptions`, and the protocol implementation has no business knowing about call options.

Converts the per-call options that generated clients already assemble into the initiation retry policy.

* **Returns a Hash, never a policy object.** The protocol implementation treats a `RetryPolicy` object as a wholesale replacement and a Hash as a per-key override. Initiation's default policy carries a predicate that treats a response missing `X-Goog-Upload-Status` as retriable gateway noise; handing it an object would silently drop that.
* **Always sets `timeout:`** from `options.timeout`. This becomes the local deadline of the initiation request only. Without it, initiation inherits `Gapic::Common::RetryPolicy::DEFAULT_TIMEOUT` (3600 s), because `Gapic::CallOptions::RetryPolicy` never populates `@timeout` even though it subclasses `Gapic::Common::RetryPolicy`.
* **Copies backoff settings and retry codes only where the caller set them.** An empty `retry_codes` list counts as unset, so the initiation defaults survive a policy that only customises, say, `initial_delay`.
* **Raises `ArgumentError` for a Proc** (or any other non-`Gapic::Common::RetryPolicy` callable) retry policy. A per-error predicate has no coherent meaning across the three retry planes of an upload, and silently ignoring it would be worse.

The whole-upload deadline is deliberately not derived here. It stays at the driver's default and is overridable per run via `timeout:`.

## 8. Retry policy placement

The three planes are unchanged in behaviour, but the collapse moves where a caller names them. `Session` took the control- and data-plane policies on its constructor and `start_retry_policy` on `#start`; the handle inverts that.

| Policy | Governs | Given to | Why there |
|---|---|---|---|
| `start_retry_policy` | initiation | the **constructor** | derived from the generated method's `CallOptions` (§7), which the run does not see |
| `control_plane_retry_policy` | `query`, `cancel` | each **run** | belongs to the caller performing the upload |
| `data_plane_retry_policy` | `upload`, `finalize` | each **run** | same |

The published documentation for what the three planes do, including the table of defaults and the differing treatment of a missing `X-Goog-Upload-Status` header, moves from the `Session` class doc onto the handle.

## 9. Changes to `Driver`

Two additive changes, both one-liners, and nothing else in `Driver`, `Core` or `Rules`:

**`method_name`.** An upload's log entries should identify the RPC that started it. Generated clients pass the method name they already use for logging on every other call (`"create_you_tube_video_upload"`), the handle forwards it to `Driver`, and `Driver` interpolates it into the per-request logging name it currently hardcodes at five sites:

```ruby
# today
method_name: "ResumableUpload.start"
# with the RPC name threaded through
method_name: "#{@method_name || 'ResumableUpload'}.start"
```

One new optional keyword, five interpolated strings. A `Driver` built without a `method_name` logs exactly as it does today. Because `Session` is gone, the keyword is threaded in one place rather than two.

**`#chunk_size`.** A one-line reader, `@core.state.chunk_size`, sitting beside the existing `#upload_url` and `#resume_handle`. The handle needs the resolved chunk size for its own reader and for the bare-`resume` form; without this it would reach through the `@private` `core` accessor into `state` from another namespace.

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
* No `#cancel`. The cancellation decision is not ready to ship, and collapsing the layer does not change that: when it lands, it lands on the handle rather than on a `Session`.
* No changes to `Progress`, to the phase list, to the config `Data` types, or to the driver's request construction.

## 13. Tests

The `Session` test files are ported, not deleted — the behaviour they cover still exists, one layer up.

* `test/gapic/rest/resumable_upload/session_test.rb` → `resumable_upload_test.rb`, driving the handle. The `build_session` / `start_session` helper pair, which partitions overrides with `START_ONLY_KEYS`, collapses: the handle's constructor and run arguments are already partitioned the way the helper was faking.
* `integration/resumable_upload/resume_test.rb` → the handle, using the three resume forms against a live showcase server.
* **Tests that need protocol detail keep driving `Driver` directly** — chunk-level retry policies, unseekable streams, buffer realignment, deadline behaviour. The handle deliberately does not expose those seams, and `Driver.new client_stub:, config:, core:` remains the injection point it is today.

New or reworked coverage on the handle:

* Both procs are called in the right order and only when they should be: `initial_request_proc` on `#start`, never on `#resume`; `client_stub_proc` on both, before anything reads the stream.
* A raising `client_stub_proc` surfaces before the stream is touched.
* Config construction: a start run produces a `StartUploadConfig` carrying the initiation URL, body, headers and start policy; a resume run produces a `ResumeUploadConfig`; per-run keywords land on both.
* Lifecycle: a second concurrent run raises `SessionStateError`; a completed handle can start again and builds a second driver; the flag is released after a failed run.
* Resume: the three forms, the argument errors for the illegal combinations, the byte-0 precondition, and the bare form reading the retained driver after a failure.
* Decoding: populated body, empty body, `nil` body, malformed body.
* Error wrapping: wrapped error is raised, is rescuable as `HasResumeHandle`, and reports the original `#resume_handle`; a handler returning `nil` re-raises the original; an error with no resume handle is not decorated.
* `start_retry_policy_for`: timeout injection, selective copying, empty retry codes, Proc rejection.
* `Driver`: `method_name` appears in log entries and defaults to `ResumableUpload.*` without it; `#chunk_size` reports the resolved value after granularity rounding.

## 14. Documentation pass

`Session`'s class comment is the current home of most of the feature's published narrative. It has to be relocated and rewritten, not simply moved:

* The **two-state model** and the recovery-by-constructing-a-new-session example are obsolete. The replacement narrative is the reusable handle: one object, `#start`, then `#resume` on the same object after a failure.
* The **retry policy** section, the **defaults** section and the **where arguments live** section move onto the handle, with the placement inversion from §8 spelled out.
* `.yardopts` keeps `--no-private`; the published surface becomes `::Gapic::ResumableUpload`, `Progress`, `ResumeHandle`, `HasResumeHandle` and the error classes.
* In-repo design docs must follow: `design/resumable_upload/implementation-guide.md` §1.5 is the `Session` contract and is currently out for review, and `design/resumable_upload/integration-test-plan.md` describes session-based tests. Both need the same collapse applied.
* `README.md` and `CHANGELOG.md` remain deferred to release time.
