# `::Gapic::ResumableUpload` — the client-library upload handle

The gapic-common half of resumable upload support in generated clients. The generator half is in [resumable-upload-2-generator.md](resumable-upload-2-generator.md).

This is almost entirely new code. The one exception is `method_name` (§2): threading it through `Session` and `Driver` so that log entries carry the RPC name is a small additive change to both. `Core` and `Rules` are untouched.

## 1. Why a handle

Generated upload methods return an object that the user then drives. That object cannot be a `Gapic::Rest::ResumableUpload::Session`:

* `Session.new` takes the stream, which the generated method does not have — the user supplies it later.
* `Session#start` returns the raw final response body; generated clients must return a decoded protobuf message.
* A `Session` performs exactly one run. The user needs one object that can start and, after a failure, resume.

So the handle sits between them: it holds the initiation parameters and the response type, and creates one `Session` per run.

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
| `start_retry_policy` | `Hash`, `RetryPolicy`, `nil` | forwarded to `Session#start` |
| `error_handler` | `Proc` → `Exception`, `nil` | wraps run failures, see §6 |
| `method_name` | `String`, `nil` | RPC name used in log entries |

Both procs are deferred deliberately. `client_stub_proc` lets a client that cannot perform REST calls still hand back a working object and fail only when an upload is actually attempted. `initial_request_proc` means the initiation URL and body are computed on `#start` and never on `#resume`, so a handle built without a request message is still fully functional for resuming.

`initial_headers` accepts the symbol-keyed metadata hash that generated clients carry; the handle stringifies keys and values before building the config, which rejects the reserved `X-Goog-Upload-*` names case-insensitively.

`method_name` exists so that an upload's log entries identify the RPC that started it. Generated clients pass the method name they already use for logging on every other call (`"create_you_tube_video_upload"`). The handle forwards it to `Session`, which forwards it to `Driver`, which composes the per-request logging name it currently hardcodes:

```ruby
# Driver, today
method_name: "ResumableUpload.start"
# Driver, with the RPC name threaded through
method_name: "#{@method_name || 'ResumableUpload'}.start"
```

That is the whole change on the `Session` and `Driver` side: one new optional keyword on each, and five interpolated strings. A `Session` built directly, without a `method_name`, logs exactly as it does today.

## 3. Runs

```ruby
def start  stream:, content_type: nil, upload_size: nil, chunk_size: nil, timeout: nil,
           on_progress: nil, control_plane_retry_policy: nil, data_plane_retry_policy: nil

def resume stream:, upload_url: nil, chunk_size: nil, resume_handle: nil, **same_options
```

The stream is the first argument and is a keyword; there is no positional form. Both methods are synchronous and return the decoded response message.

Order of operations in each run, before any byte is read from the stream:

1. `client_stub_proc.call` — raises here if REST is unavailable.
2. `#start` only: `initial_request_proc.call` → `[url, body]`.
3. Build a fresh `Session`, retain it, invoke `#start` / `#resume` on it.
4. Decode and return, or wrap and raise.

The handle is reusable: one handle, many runs, one `Session` per run. A second run started while one is in flight raises `Gapic::Rest::ResumableUpload::SessionStateError`. Because each run gets a fresh `Session`, that session's own single-run guard never fires for this case — the handle keeps its own mutex-guarded `running?` flag and raises the same error type, so callers see one consistent failure mode whether they misuse a handle or a session. Every optional keyword that both runs share is passed through untouched — in particular the whole-upload `timeout` is only forwarded when the caller sets it, otherwise the protocol implementation's own default applies.

### Resume forms

| Call | Behaviour |
|---|---|
| `resume stream: io` | reuses `upload_url` and `chunk_size` from this handle's previous run |
| `resume stream: io, upload_url: u, chunk_size: c` | explicit, for a fresh process |
| `resume stream: io, resume_handle: h` | takes both from a `ResumeHandle`, which is what the protocol's own errors carry |

Mixing `resume_handle:` with `upload_url:`/`chunk_size:` raises `ArgumentError`. So does a bare `resume` on a handle with no previous run. The stream must be positioned at byte 0 of the whole object; the protocol implementation fast-forwards to the server's offset itself.

## 4. Readers

`#upload_url`, `#chunk_size` (resolved — user-requested value after the server's granularity has been applied; `nil` before the first run), `#resume_handle`, `#resumable?`, `#running?`. All read from the retained session and are safe to call from another thread mid-run, returning a best-effort snapshot.

## 5. Response decoding

```ruby
response_type.decode_json body.to_s, ignore_unknown_fields: true
```

Unconditional, identical to what a generated REST service stub does with a unary response. An empty or absent final body decodes to an empty message (`decode_json ""` returns an empty message); malformed JSON raises `Google::Protobuf::ParseError`. The `to_s` is only there because a bodiless `200` surfaces as `nil`.

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

A handle constructed without an `error_handler` propagates protocol errors unchanged.

## 7. `start_retry_policy_for`

```ruby
::Gapic::ResumableUpload.start_retry_policy_for options   # options: Gapic::CallOptions
                                                          # => Hash
```

A class method on the handle, not on the `Gapic::Rest::ResumableUpload` protocol namespace. It exists to serve generated clients, it is meaningless without `Gapic::CallOptions`, and the protocol implementation has no business knowing about call options; keeping it next to the only thing that consumes it means the whole client-library surface is one constant.

Converts the per-call options that generated clients already assemble into the initiation retry policy.

* **Returns a Hash, never a policy object.** The protocol implementation treats a `RetryPolicy` object as a wholesale replacement and a Hash as a per-key override. Initiation's default policy carries a predicate that treats a response missing `X-Goog-Upload-Status` as retriable gateway noise; handing it an object would silently drop that.
* **Always sets `timeout:`** from `options.timeout`. This becomes the local deadline of the initiation request only. Without it, initiation inherits `Gapic::Common::RetryPolicy::DEFAULT_TIMEOUT` (3600 s), because `Gapic::CallOptions::RetryPolicy` never populates `@timeout` even though it subclasses `Gapic::Common::RetryPolicy`.
* **Copies backoff settings and retry codes only where the caller set them.** An empty `retry_codes` list counts as unset, so the initiation defaults survive a policy that only customises, say, `initial_delay`.
* **Raises `ArgumentError` for a Proc** (or any other non-`Gapic::Common::RetryPolicy` callable) retry policy. A per-error predicate has no coherent meaning across the three retry planes of an upload, and silently ignoring it would be worse.

The whole-upload deadline is deliberately not derived here. It stays at the protocol implementation's default and is overridable per run via `timeout:`.

## 8. Packaging and release order

The handle is a new file, `lib/gapic/resumable_upload.rb`, required from `lib/gapic/rest.rb` next to the existing `require "gapic/rest/resumable_upload"`. It is not under `gapic/rest/` because it is not part of the protocol implementation: it is the client-library surface built on top of it, and its constant is `::Gapic::ResumableUpload`. Requiring it from `gapic/rest.rb` means any generated client that already does `require "gapic/rest"` — which the upload stub does on construction — gets it for free, with no extra require in generated code.

Release order is forced, and it is one way only:

1. Ship this document's changes in a `gapic-common` release: the handle, plus the `method_name` keyword on `Session` and `Driver`. Both are additive, so this is a minor version bump with no migration.
2. Only then raise the generated-gemspec dependency floor in the generator (`GemPresenter#dependencies`, currently `"gapic-common" => "~> 1.3"`) to that release.
3. Then land the generator change and its goldens.

Step 2 rewrites every golden gemspec in the repository, so it cannot be split from step 3 in practice — but it also cannot precede step 1, because generated clients would then declare a floor that does not exist on rubygems.

## 9. Non-goals

* The handle adds nothing to `on_progress`. The callback is passed straight through; whatever semantics its return value acquires (pausing, cancelling) are defined by the protocol implementation, not here.
* No upload-size inference from the stream. If the caller wants `upload_size`, they pass it.
* No changes to `Progress`, to the phase list, or to the driver's request construction.

## 10. Tests

* Both procs are called in the right order and only when they should be: `initial_request_proc` on `#start`, never on `#resume`; `client_stub_proc` on both, before anything reads the stream.
* A raising `client_stub_proc` surfaces before the stream is touched.
* Reuse: start-fails-then-resume on one handle; the three resume forms; the argument errors for the illegal combinations; second concurrent run rejected.
* Decoding: populated body, empty body, `nil` body, malformed body.
* Error wrapping: wrapped error is raised, is rescuable as `HasResumeHandle`, and reports the original `#resume_handle`; a handler returning `nil` re-raises the original; an error with no resume handle is not decorated.
* `start_retry_policy_for`: timeout injection, selective copying, empty retry codes, Proc rejection.
* `method_name`: a handle built with one produces log entries named after the RPC; a `Session` built without one logs exactly as it does today.
