# Resumable Upload Protocol: Client Libraries & Generator Design Plan

## 1. Overview & Architectural Context

This document defines the design for implementing Resumable Upload Protocol (RUP) support across GAPIC-generated Ruby client libraries (`gapic-generator`, `gapic-generator-ads`, and `gapic-generator-cloud`) and `gapic-common`.

### Key Design Principles

1. **Unchanged Low-Level Protocol Session (`Gapic::Rest::ResumableUpload::Session`)**:
   The existing `Session` class in `gapic-common` remains unchanged. It continues to serve as the low-level protocol session coordinator taking `stream:` in its constructor and returning raw `[String, nil]` HTTP response bodies from `#start` and `#resume`.
2. **Client-Facing Session Wrapper (`Gapic::Rest::ResumableUpload::ClientSession`)**:
   A new class `ClientSession` in `gapic-common` bridges GAPIC-generated RPC methods and `Session`. It captures the RPC context at call time, defers request transcoding until `#start` is invoked, instantiates `Session` when `#start` or `#resume` is called with a binary `stream`, and decodes the final JSON response into the RPC's protobuf return type.
3. **Empty Request Default (`request = {}`) with Lazy Transcoding**:
   Generated resumable upload methods default `request = {}` (`def create_you_tube_video_upload request = {}, options = nil`). Because transcoding is deferred until `ClientSession#start`, callers resuming an interrupted upload can invoke `client.create_you_tube_video_upload.resume(stream: file, resume_handle: handle)` without providing dummy request fields or triggering URI template validation errors in `GrpcTranscoder#transcode`.
4. **Unified Sub-Surface Architecture (`ResumableUploadStub`)**:
   To support resumable uploads in both dual-transport libraries (gRPC + REST) and gRPC-only libraries (`gapic-generator-ads`), the generator emits an internal REST-backed sub-surface (`ServiceName::ResumableUploadStub`) whenever a service contains resumable upload RPCs. Both `Client` (gRPC) and `Rest::Client` (REST) delegate resumable upload methods to this stub.

---

## 2. `Gapic::Rest::ResumableUpload::ClientSession` (`gapic-common`)

Location: `lib/gapic/rest/resumable_upload/client_session.rb` (required by `lib/gapic/rest/resumable_upload.rb`).

### 2.1 Lifecycle & State Model

`ClientSession` mirrors the single-run contract of `Session`:
* **Unbound (`!bound?`)**: Initial state returned by `client.<upload_rpc>(request, options)`. No HTTP requests have been sent and `transcode_proc` has not been invoked. Permitted operations: `#start` or `#resume`.
* **Bound (`bound?`)**: Transitions to bound as soon as `#start` or `#resume` begins execution. Subsequent calls to `#start` or `#resume` raise `SessionStateError`.

### 2.2 Constructor (`#initialize`)

Marked `# @private` in YARD documentation so users obtain instances exclusively via generated client methods.

```ruby
module Gapic
  module Rest
    module ResumableUpload
      class ClientSession
        # @private
        # @param client_stub [Gapic::Rest::ClientStub, nil] Underlying REST client stub
        # @param transcode_proc [Proc] Zero-arg proc returning [initial_url, initial_body]
        # @param initial_headers [Hash<String, String>] Metadata headers from CallOptions
        # @param start_retry_policy [Gapic::Common::RetryPolicy, Hash, nil] Retry policy for initiation
        # @param default_timeout [Numeric, nil] Default RPC timeout from client configuration
        # @param response_decoder [Proc, nil] Proc `->(raw_body) { ResponseProto.decode_json(...) }`
        # @param error_wrapper [Proc, nil] Optional flavor error wrapper `->(err) { ... }`
        # @param credentials_error [StandardError, nil] Deferred error if initialized with a gRPC Channel
        # @param logger [Logger, nil] Logger instance
        def initialize client_stub:,
                       transcode_proc:,
                       initial_headers: {},
                       start_retry_policy: nil,
                       default_timeout: nil,
                       response_decoder: nil,
                       error_wrapper: nil,
                       credentials_error: nil,
                       logger: nil
```

* **No Eager I/O or Transcoding**: `#initialize` stores configuration and initializes synchronization primitives (`@mutex = Mutex.new`, `@session = nil`).
* **Pre-Constructed gRPC Channel Support**: If the parent gRPC `Client` was initialized with a `GRPC::Core::Channel` or `GRPC::Core::ChannelCredentials`, `ResumableUploadStub` passes `@credentials_error` to `ClientSession.new` instead of raising during `Client.new`.

### 2.3 Starting an Upload (`#start`)

```ruby
# Initiates a new resumable upload transfer.
#
# @param stream [IO] Binary input stream positioned at byte 0
# @param upload_size [Integer, nil] Total upload bytes if known upfront
# @param content_type [String, nil] MIME type of uploaded media
# @param chunk_size [Integer, nil] Explicit chunk size in bytes
# @param timeout [Numeric, nil] Total upload timeout in seconds (overrides default_timeout)
# @param control_plane_retry_policy [Gapic::Common::RetryPolicy, Hash, nil] Retry policy for query/cancel
# @param data_plane_retry_policy [Gapic::Common::RetryPolicy, Hash, nil] Retry policy for upload/finalize
# @param on_progress [Proc, nil] Callback invoked with {Progress} snapshots
# @yield [progress] Optional block form for progress callback
# @yieldparam progress [Progress]
# @return [Object, String, nil] Decoded protobuf response message (or raw body if no decoder)
def start stream:,
          upload_size: nil,
          content_type: nil,
          chunk_size: nil,
          timeout: nil,
          control_plane_retry_policy: nil,
          data_plane_retry_policy: nil,
          on_progress: nil,
          &progress_block
```

**Execution Steps**:
1. **Credential Verification ()**: If `@credentials_error` is present, raise it (passing through `@error_wrapper` if configured).
2. **Lazy Transcoding**: Invoke `initial_url, initial_body = @transcode_proc.call`. If `request` was invalid or missing required URI template bindings, `GrpcTranscoder#transcode` raises `Gapic::Common::Error` here.
3. **Session Construction**: Under `@mutex`, verify `@session.nil?` (raising `SessionStateError` if already bound) and instantiate:
   ```ruby
   @session = Session.new(
     client_stub:                @client_stub,
     stream:                     stream,
     upload_size:                upload_size,
     content_type:               content_type,
     timeout:                    timeout || @default_timeout,
     control_plane_retry_policy: control_plane_retry_policy,
     data_plane_retry_policy:    data_plane_retry_policy,
     on_progress:                on_progress || progress_block,
     logger:                     @logger
   )
   ```
4. **Protocol Execution**: Invoke:
   ```ruby
   raw_body = @session.start(
     initial_url:        initial_url,
     initial_body:       initial_body,
     initial_headers:    @initial_headers,
     chunk_size:         chunk_size,
     start_retry_policy: @start_retry_policy
   )
   ```
5. **Response Deserialization**: If `raw_body` is non-nil and `@response_decoder` is present, call `@response_decoder.call(raw_body)` and return the protobuf message instance.
6. **Error Wrapping & `HasResumeHandle` Preservation**:
   If an exception `e` is raised and `@error_wrapper` is present:
   * Transform `wrapped = @error_wrapper.call(e)`.
   * If `e.is_a?(HasResumeHandle)` and `!wrapped.is_a?(HasResumeHandle)`, extend `wrapped` with `HasResumeHandle` and copy `@resume_handle = e.resume_handle` so callers can rescue `HasResumeHandle` or access `err.resume_handle` on flavor-wrapped exceptions (such as `Google::Cloud::Error`).
   * Raise `wrapped`.

### 2.4 Resuming an Upload (`#resume`)

```ruby
# Resumes an interrupted upload transfer using either explicit parameters or a {ResumeHandle}.
#
# @param stream [IO] Binary input stream positioned at byte 0 of the entire payload
# @param resume_handle [ResumeHandle, nil] Resume handle from a previous session or error
# @param upload_url [String, nil] Explicit upload URL (mutually exclusive with resume_handle)
# @param chunk_size [Integer, nil] Explicit chunk size (required with upload_url)
# @param upload_size [Integer, nil] Total upload bytes if known upfront
# @param content_type [String, nil] MIME type of uploaded media
# @param timeout [Numeric, nil] Total upload timeout in seconds
# @param control_plane_retry_policy [Gapic::Common::RetryPolicy, Hash, nil] Retry policy for query/cancel
# @param data_plane_retry_policy [Gapic::Common::RetryPolicy, Hash, nil] Retry policy for upload/finalize
# @param on_progress [Proc, nil] Callback invoked with {Progress} snapshots
# @yield [progress] Optional block form for progress callback
# @yieldparam progress [Progress]
# @return [Object, String, nil] Decoded protobuf response message
def resume stream:,
           resume_handle: nil,
           upload_url: nil,
           chunk_size: nil,
           upload_size: nil,
           content_type: nil,
           timeout: nil,
           control_plane_retry_policy: nil,
           data_plane_retry_policy: nil,
           on_progress: nil,
           &progress_block
```

**Execution Steps**:
1. **Credential Verification**: Raise `@credentials_error` if present.
2. **Skip Transcoding**: `@transcode_proc` is **not called**. An empty `request = {}` passed to `client.<upload_rpc>` causes no transcoding error.
3. **Session Construction**: Under `@mutex`, verify `@session.nil?` and instantiate `Session.new(...)`.
4. **Protocol Execution**: Invoke `raw_body = @session.resume(resume_handle: resume_handle, upload_url: upload_url, chunk_size: chunk_size)`.
5. **Response Deserialization & Error Wrapping**: Identical to `#start`.

### 2.5 Delegated State Readers

`ClientSession` exposes thread-safe readers delegating to `@session`:
* `#upload_url` $\to$ `@session&.upload_url`
* `#resume_handle` $\to$ `@session&.resume_handle`
* `#resumable?` $\to$ `@session ? @session.resumable? : false`
* `#bound?` $\to$ `@session ? @session.bound? : false`
* `#running?` $\to$ `@session ? @session.running? : false`

---

## 3. Generator & Template Architecture (`gapic-generator-ruby`)

### 3.1 Method & Service Presenters

#### `MethodPresenter` (`gapic-generator/lib/gapic/presenters/method_presenter.rb`)
* **`#resumable_upload?`**:
  Returns `true` if:
  1. **Milestone 1 Allowlist**:
     * Full method address (`@method.address.join(".")`) matches `/\Agoogle\.ads\.googleads\.v\d+\.services\.YouTubeVideoUploadService\.CreateYouTubeVideoUpload\z/`
     * Or equals `"google.showcase.v1beta1.ResumableUploadService.UploadMedia"`
  2. **Annotation + Config Opt-in**:
     * `@api.resumable_upload_enabled?` is true AND `@method.http_media_upload_enabled?` (`google.api.http.media_upload.enabled == true`).
  * **Validation**: If `resumable_upload?` is true on a method where `client_streaming? || server_streaming? || lro? || nonstandard_lro? || paged?`, raise a generation-time error.
* **`#resumable_upload_prefix`**:
  Reads `upload_prefix` from generator configuration / `ClientLibrarySettings`, falling back to `"/resumable/upload"` for allowlisted methods. Normalizes the prefix to start with `"/"` and have no trailing `"/"`.

#### `ServicePresenter` (`gapic-generator/lib/gapic/presenters/service_presenter.rb`)
* **`#resumable_upload?`**: `methods.any?(&:resumable_upload?)`
* **`#resumable_upload_methods`**: `methods.select(&:resumable_upload?)`
* **`#resumable_upload_file_path`**: `"#{service_directory_name}/resumable_upload.rb"`
* **`#resumable_upload_require`**: `"#{service_require}/resumable_upload"`
* **`#resumable_upload_stub_name`**: `"ResumableUploadStub"`

### 3.2 Sub-Surface Template (`service/resumable_upload.text.erb`)

Emitted in both `DefaultGenerator#generate` and `AdsGenerator#generate`:
```ruby
files << g("service/resumable_upload", "lib/#{service.resumable_upload_file_path}", service: service) if service.resumable_upload?
```

Template structure (`templates/default/service/resumable_upload.text.erb` & `_resumable_upload.text.erb`):
* Marked `# @private`.
* **`#initialize(endpoint:, endpoint_template:, universe_domain:, credentials:, logger:)`**:
  ```ruby
  if defined?(::GRPC::Core::Channel) &&
     (credentials.is_a?(::GRPC::Core::Channel) || credentials.is_a?(::GRPC::Core::ChannelCredentials))
    @credentials_error = ::Gapic::Common::Error.new(
      "Resumable upload methods operate over HTTP/REST and cannot use a pre-constructed " \
      "gRPC Channel or ChannelCredentials. Initialize the client with Google Auth credentials instead."
    )
    @client_stub = nil
  else
    require "gapic/rest"
    require "gapic/rest/resumable_upload"

    @client_stub = ::Gapic::Rest::ClientStub.new(
      endpoint:             endpoint,
      endpoint_template:    endpoint_template,
      universe_domain:      universe_domain,
      credentials:          credentials,
      numeric_enums:        <%= service.rest.numeric_enums? %>,
      service_name:         self.class,
      raise_faraday_errors: false,
      logger:               logger
    )
  end
  @logger = logger
  ```
* **Transcoding Helpers**:
  For each method in `service.resumable_upload_methods`, renders `self.transcode_<method_name>_request(request_pb)` using `Gapic::Rest::GrpcTranscoder`.
* **Session Factory Methods**:
  ```ruby
  def <%= method.name %> request_pb, options = nil, &error_wrapper
    require "gapic/rest/resumable_upload"

    transcode_proc = -> do
      _verb, uri, query_string_params, body = self.class.<%= method.rest.transcoding_helper_name %> request_pb
      initial_url = "<%= method.resumable_upload_prefix %>#{uri}"
      if query_string_params.any?
        query_str = URI.encode_www_form(query_string_params.map { |p| p.split("=", 2) })
        initial_url = "#{initial_url}?#{query_str}"
      end
      [initial_url, body]
    end

    metadata = options.respond_to?(:metadata) ? options.metadata.to_h : {}
    headers = metadata.transform_keys(&:to_s)
    start_retry_policy = options.respond_to?(:retry_policy) ? options.retry_policy : nil
    default_timeout = options.respond_to?(:timeout) ? options.timeout : nil

    ::Gapic::Rest::ResumableUpload::ClientSession.new(
      client_stub:        @client_stub,
      transcode_proc:     transcode_proc,
      initial_headers:    headers,
      start_retry_policy: start_retry_policy,
      default_timeout:    default_timeout,
      response_decoder:   ->(raw_body) { <%= method.return_type %>.decode_json raw_body, ignore_unknown_fields: true },
      error_wrapper:      error_wrapper,
      credentials_error:  @credentials_error,
      logger:             @logger
    )
  end
  ```

### 3.3 Client Surface Integration (`Client` & `Rest::Client`)

1. **Require & Initialization (`_client.text.erb` for both gRPC and REST)**:
   * Require `"#{service.resumable_upload_require}"` when `service.resumable_upload?` is true.
   * In `#initialize`, instantiate:
     ```ruby
     @resumable_upload_stub = ResumableUploadStub.new(
       endpoint:          @config.endpoint,
       endpoint_template: DEFAULT_ENDPOINT_TEMPLATE,
       universe_domain:   @config.universe_domain,
       credentials:       credentials,
       logger:            @config.logger
     )
     ```
2. **Method Signature (`method/_def.text.erb`)**:
   * When `method.resumable_upload?` is true:
     ```ruby
     def <%= method.name %> request = {}, options = nil
     ```
3. **Method Body (`method/def/_response.text.erb`)**:
   * When `method.resumable_upload?` is true:
     * In default and Ads flavors:
       ```ruby
       @resumable_upload_stub.<%= method.name %> request, options
       ```
     * In Cloud flavor (`gapic-generator-cloud`), pass the error-wrapping block so errors raised during `#start` or `#resume` are wrapped in `::Google::Cloud::Error`:
       ```ruby
       @resumable_upload_stub.<%= method.name %> request, options do |err|
         ::Google::Cloud::Error.from_error err
       end
       ```
4. **Documentation Partials**:
   * Update method YARD documentation templates for resumable upload methods to document:
     * `@param request [RequestClass, ::Hash]` defaults to `{}` (used when creating a session purely to call `#resume`).
     * `@param options [::Gapic::CallOptions, ::Hash]` headers (`metadata`), `retry_policy`, and `timeout` apply to the initial `start` request.
     * `@return [::Gapic::Rest::ResumableUpload::ClientSession]` returning a session object whose `#start` and `#resume` methods return a decoded `<%= method.return_type %>` instance.
     * Precondition notes on stream byte-0 positioning when resuming.

---

## 4. Verification & Testing Plan

1. **`gapic-common` Unit & Integration Tests**:
   * Add `test/gapic/rest/resumable_upload/client_session_test.rb` testing:
     * Lazy transcoding (`transcode_proc` called on `#start`, skipped on `#resume`).
     * Protobuf response decoding on completion of `#start` and `#resume`.
     * Pre-constructed gRPC channel error raising on `#start` and `#resume`.
     * Error wrapping with `HasResumeHandle` preservation (`rescue HasResumeHandle` and `#resume_handle` on wrapped errors).
     * State reader delegation (`#upload_url`, `#resume_handle`, `#resumable?`, `#bound?`, `#running?`).
   * Verify `toys ci` and `toys test-integration` pass in `gapic-common`.
2. **`gapic-generator-ruby` Golden & Unit Tests**:
   * Add unit tests in `gapic-generator/test/gapic/presenters/method_presenter_test.rb` for `resumable_upload?` allowlist matching and non-unary validation.
   * Regenerate goldens (`cd shared && toys gen`) and verify generated code for Showcase (`ResumableUploadService#upload_media`) and Google Ads (`YouTubeVideoUploadService#create_you_tube_video_upload`).
   * Run `toys test` across `gapic-generator`, `gapic-generator-ads`, and `gapic-generator-cloud`.
