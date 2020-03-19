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

require "google/ads/googleads/v3/services/customer_manager_link_service_pb"
require "google/ads/googleads/v3/services/customer_manager_link_service_services_pb"
require "google/ads/google_ads/v3/services/customer_manager_link_service"

class Google::Ads::GoogleAds::V3::Services::CustomerManagerLinkService::ClientTest < Minitest::Test
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

  def test_get_customer_manager_link
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Resources::CustomerManagerLink.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"

    get_customer_manager_link_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_customer_manager_link, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::GetCustomerManagerLinkRequest, request
      assert_equal "hello world", request.resource_name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_customer_manager_link_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CustomerManagerLinkService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_customer_manager_link({ resource_name: resource_name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_customer_manager_link resource_name: resource_name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_customer_manager_link Google::Ads::GoogleAds::V3::Services::GetCustomerManagerLinkRequest.new(resource_name: resource_name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_customer_manager_link({ resource_name: resource_name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_customer_manager_link Google::Ads::GoogleAds::V3::Services::GetCustomerManagerLinkRequest.new(resource_name: resource_name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_customer_manager_link_client_stub.call_rpc_count
    end
  end

  def test_mutate_customer_manager_link
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::MutateCustomerManagerLinkResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    operations = [{}]

    mutate_customer_manager_link_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :mutate_customer_manager_link, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::MutateCustomerManagerLinkRequest, request
      assert_equal "hello world", request.customer_id
      assert_kind_of Google::Ads::GoogleAds::V3::Services::CustomerManagerLinkOperation, request.operations.first
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, mutate_customer_manager_link_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CustomerManagerLinkService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.mutate_customer_manager_link({ customer_id: customer_id, operations: operations }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.mutate_customer_manager_link customer_id: customer_id, operations: operations do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.mutate_customer_manager_link Google::Ads::GoogleAds::V3::Services::MutateCustomerManagerLinkRequest.new(customer_id: customer_id, operations: operations) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.mutate_customer_manager_link({ customer_id: customer_id, operations: operations }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.mutate_customer_manager_link Google::Ads::GoogleAds::V3::Services::MutateCustomerManagerLinkRequest.new(customer_id: customer_id, operations: operations), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, mutate_customer_manager_link_client_stub.call_rpc_count
    end
  end

  def test_move_manager_link
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::MoveManagerLinkResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    previous_customer_manager_link = "hello world"
    new_manager = "hello world"

    move_manager_link_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :move_manager_link, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::MoveManagerLinkRequest, request
      assert_equal "hello world", request.customer_id
      assert_equal "hello world", request.previous_customer_manager_link
      assert_equal "hello world", request.new_manager
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, move_manager_link_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CustomerManagerLinkService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.move_manager_link({ customer_id: customer_id, previous_customer_manager_link: previous_customer_manager_link, new_manager: new_manager }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.move_manager_link customer_id: customer_id, previous_customer_manager_link: previous_customer_manager_link, new_manager: new_manager do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.move_manager_link Google::Ads::GoogleAds::V3::Services::MoveManagerLinkRequest.new(customer_id: customer_id, previous_customer_manager_link: previous_customer_manager_link, new_manager: new_manager) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.move_manager_link({ customer_id: customer_id, previous_customer_manager_link: previous_customer_manager_link, new_manager: new_manager }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.move_manager_link Google::Ads::GoogleAds::V3::Services::MoveManagerLinkRequest.new(customer_id: customer_id, previous_customer_manager_link: previous_customer_manager_link, new_manager: new_manager), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, move_manager_link_client_stub.call_rpc_count
    end
  end
end
