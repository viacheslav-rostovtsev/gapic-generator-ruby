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

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/ads/googleads/v3/services/mutate_job_service_pb"
require "google/ads/googleads/v3/services/mutate_job_service_services_pb"
require "google/ads/google_ads/v3/services/mutate_job_service"

class Google::Ads::GoogleAds::V3::Services::MutateJobService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_create_mutate_job
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::CreateMutateJobResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"

    create_mutate_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_mutate_job, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::CreateMutateJobRequest, request
      assert_equal "hello world", request.customer_id
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_mutate_job_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::MutateJobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_mutate_job({ customer_id: customer_id }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_mutate_job customer_id: customer_id do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_mutate_job Google::Ads::GoogleAds::V3::Services::CreateMutateJobRequest.new(customer_id: customer_id) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_mutate_job({ customer_id: customer_id }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_mutate_job Google::Ads::GoogleAds::V3::Services::CreateMutateJobRequest.new(customer_id: customer_id), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_mutate_job_client_stub.call_rpc_count
    end
  end

  def test_get_mutate_job
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Resources::MutateJob.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"

    get_mutate_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_mutate_job, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::GetMutateJobRequest, request
      assert_equal "hello world", request.resource_name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_mutate_job_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::MutateJobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_mutate_job({ resource_name: resource_name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_mutate_job resource_name: resource_name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_mutate_job Google::Ads::GoogleAds::V3::Services::GetMutateJobRequest.new(resource_name: resource_name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_mutate_job({ resource_name: resource_name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_mutate_job Google::Ads::GoogleAds::V3::Services::GetMutateJobRequest.new(resource_name: resource_name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_mutate_job_client_stub.call_rpc_count
    end
  end

  def test_list_mutate_job_results
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::ListMutateJobResultsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"
    page_token = "hello world"
    page_size = 42

    list_mutate_job_results_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_mutate_job_results, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::ListMutateJobResultsRequest, request
      assert_equal "hello world", request.resource_name
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_mutate_job_results_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::MutateJobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_mutate_job_results({ resource_name: resource_name, page_token: page_token, page_size: page_size }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_mutate_job_results resource_name: resource_name, page_token: page_token, page_size: page_size do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_mutate_job_results Google::Ads::GoogleAds::V3::Services::ListMutateJobResultsRequest.new(resource_name: resource_name, page_token: page_token, page_size: page_size) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_mutate_job_results({ resource_name: resource_name, page_token: page_token, page_size: page_size }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_mutate_job_results Google::Ads::GoogleAds::V3::Services::ListMutateJobResultsRequest.new(resource_name: resource_name, page_token: page_token, page_size: page_size), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_mutate_job_results_client_stub.call_rpc_count
    end
  end

  def test_run_mutate_job
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"

    run_mutate_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :run_mutate_job, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::RunMutateJobRequest, request
      assert_equal "hello world", request.resource_name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, run_mutate_job_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::MutateJobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.run_mutate_job({ resource_name: resource_name }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.run_mutate_job resource_name: resource_name do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.run_mutate_job Google::Ads::GoogleAds::V3::Services::RunMutateJobRequest.new(resource_name: resource_name) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.run_mutate_job({ resource_name: resource_name }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.run_mutate_job Google::Ads::GoogleAds::V3::Services::RunMutateJobRequest.new(resource_name: resource_name), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, run_mutate_job_client_stub.call_rpc_count
    end
  end

  def test_add_mutate_job_operations
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::AddMutateJobOperationsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"
    sequence_token = "hello world"
    mutate_operations = [{}]

    add_mutate_job_operations_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :add_mutate_job_operations, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::AddMutateJobOperationsRequest, request
      assert_equal "hello world", request.resource_name
      assert_equal "hello world", request.sequence_token
      assert_kind_of Google::Ads::GoogleAds::V3::Services::MutateOperation, request.mutate_operations.first
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, add_mutate_job_operations_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::MutateJobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.add_mutate_job_operations({ resource_name: resource_name, sequence_token: sequence_token, mutate_operations: mutate_operations }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.add_mutate_job_operations resource_name: resource_name, sequence_token: sequence_token, mutate_operations: mutate_operations do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.add_mutate_job_operations Google::Ads::GoogleAds::V3::Services::AddMutateJobOperationsRequest.new(resource_name: resource_name, sequence_token: sequence_token, mutate_operations: mutate_operations) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.add_mutate_job_operations({ resource_name: resource_name, sequence_token: sequence_token, mutate_operations: mutate_operations }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.add_mutate_job_operations Google::Ads::GoogleAds::V3::Services::AddMutateJobOperationsRequest.new(resource_name: resource_name, sequence_token: sequence_token, mutate_operations: mutate_operations), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, add_mutate_job_operations_client_stub.call_rpc_count
    end
  end
end
