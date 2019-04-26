# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

raise "This file is for documentation purposes only."

module Google
  module Longrunning
    # This resource represents a long-running operation that is the result of a
    # network API call.
    # @!attribute [rw] name
    #   @return [String]
    #     The server-assigned name, which is only unique within the same service that
    #     originally returns it. If you use the default HTTP mapping, the
    #     `name` should have the format of `operations/some/unique/name`.
    # @!attribute [rw] metadata
    #   @return [Google::Protobuf::Any]
    #     Service-specific metadata associated with the operation.  It typically
    #     contains progress information and common metadata such as create time.
    #     Some services might not provide such metadata.  Any method that returns a
    #     long-running operation should document the metadata type, if any.
    # @!attribute [rw] done
    #   @return [Boolean]
    #     If the value is `false`, it means the operation is still in progress.
    #     If true, the operation is completed, and either `error` or `response` is
    #     available.
    # @!attribute [rw] error
    #   @return [Google::Rpc::Status]
    #     The error result of the operation in case of failure or cancellation.
    # @!attribute [rw] response
    #   @return [Google::Protobuf::Any]
    #     The normal response of the operation in case of success.  If the original
    #     method returns no data on success, such as `Delete`, the response is
    #     `google.protobuf.Empty`.  If the original method is standard
    #     `Get`/`Create`/`Update`, the response should be the resource.  For other
    #     methods, the response should have the type `XxxResponse`, where `Xxx`
    #     is the original method name.  For example, if the original method name
    #     is `TakeSnapshot()`, the inferred response type is
    #     `TakeSnapshotResponse`.
    class Operation
      include Google::Protobuf::MessageExts
      extend Google::Protobuf::MessageExts::ClassMethods
    end

    # The request message for [Operations.GetOperation][google.longrunning.Operations.GetOperation].
    # @!attribute [rw] name
    #   @return [String]
    #     The name of the operation resource.
    class GetOperationRequest
      include Google::Protobuf::MessageExts
      extend Google::Protobuf::MessageExts::ClassMethods
    end

    # The request message for [Operations.ListOperations][google.longrunning.Operations.ListOperations].
    # @!attribute [rw] name
    #   @return [String]
    #     The name of the operation collection.
    # @!attribute [rw] filter
    #   @return [String]
    #     The standard list filter.
    # @!attribute [rw] page_size
    #   @return [Integer]
    #     The standard list page size.
    # @!attribute [rw] page_token
    #   @return [String]
    #     The standard list page token.
    class ListOperationsRequest
      include Google::Protobuf::MessageExts
      extend Google::Protobuf::MessageExts::ClassMethods
    end

    # The response message for [Operations.ListOperations][google.longrunning.Operations.ListOperations].
    # @!attribute [rw] operations
    #   @return [Google::Longrunning::Operation]
    #     A list of operations that matches the specified filter in the request.
    # @!attribute [rw] next_page_token
    #   @return [String]
    #     The standard List next-page token.
    class ListOperationsResponse
      include Google::Protobuf::MessageExts
      extend Google::Protobuf::MessageExts::ClassMethods
    end

    # The request message for [Operations.CancelOperation][google.longrunning.Operations.CancelOperation].
    # @!attribute [rw] name
    #   @return [String]
    #     The name of the operation resource to be cancelled.
    class CancelOperationRequest
      include Google::Protobuf::MessageExts
      extend Google::Protobuf::MessageExts::ClassMethods
    end

    # The request message for [Operations.DeleteOperation][google.longrunning.Operations.DeleteOperation].
    # @!attribute [rw] name
    #   @return [String]
    #     The name of the operation resource to be deleted.
    class DeleteOperationRequest
      include Google::Protobuf::MessageExts
      extend Google::Protobuf::MessageExts::ClassMethods
    end

    # A message representing the message types used by a long-running operation.
    #
    # Example:
    #
    #   rpc LongRunningRecognize(LongRunningRecognizeRequest)
    #       returns (google.longrunning.Operation) {
    #     option (google.longrunning.operation_info) = {
    #       response_type: "LongRunningRecognizeResponse"
    #       metadata_type: "LongRunningRecognizeMetadata"
    #     };
    #   }
    # @!attribute [rw] response_type
    #   @return [String]
    #     Required. The message name of the primary return type for this
    #     long-running operation.
    #     This type will be used to deserialize the LRO's response.
    #
    #     If the response is in a different package from the rpc, a fully-qualified
    #     message name must be used (e.g. `google.protobuf.Struct`).
    #
    #     Note: Altering this value constitutes a breaking change.
    # @!attribute [rw] metadata_type
    #   @return [String]
    #     Required. The message name of the metadata type for this long-running
    #     operation.
    #
    #     If the response is in a different package from the rpc, a fully-qualified
    #     message name must be used (e.g. `google.protobuf.Struct`).
    #
    #     Note: Altering this value constitutes a breaking change.
    class OperationInfo
      include Google::Protobuf::MessageExts
      extend Google::Protobuf::MessageExts::ClassMethods
    end
  end
end