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

require "google/ads/googleads/v3/services/customer_service_pb"
require "google/ads/googleads/v3/services/customer_service_services_pb"
require "google/ads/google_ads/v3/services/customer_service"

class Google::Ads::GoogleAds::V3::Services::CustomerService::ClientTest < Minitest::Test
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

  def test_get_customer
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Resources::Customer.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"

    get_customer_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_customer, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::GetCustomerRequest, request
      assert_equal "hello world", request.resource_name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_customer_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CustomerService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_customer({ resource_name: resource_name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_customer resource_name: resource_name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_customer Google::Ads::GoogleAds::V3::Services::GetCustomerRequest.new(resource_name: resource_name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_customer({ resource_name: resource_name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_customer Google::Ads::GoogleAds::V3::Services::GetCustomerRequest.new(resource_name: resource_name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_customer_client_stub.call_rpc_count
    end
  end

  def test_mutate_customer
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::MutateCustomerResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    operation = {}
    validate_only = true

    mutate_customer_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :mutate_customer, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::MutateCustomerRequest, request
      assert_equal "hello world", request.customer_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Ads::GoogleAds::V3::Services::CustomerOperation), request.operation
      assert_equal true, request.validate_only
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, mutate_customer_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CustomerService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.mutate_customer({ customer_id: customer_id, operation: operation, validate_only: validate_only }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.mutate_customer customer_id: customer_id, operation: operation, validate_only: validate_only do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.mutate_customer Google::Ads::GoogleAds::V3::Services::MutateCustomerRequest.new(customer_id: customer_id, operation: operation, validate_only: validate_only) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.mutate_customer({ customer_id: customer_id, operation: operation, validate_only: validate_only }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.mutate_customer Google::Ads::GoogleAds::V3::Services::MutateCustomerRequest.new(customer_id: customer_id, operation: operation, validate_only: validate_only), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, mutate_customer_client_stub.call_rpc_count
    end
  end

  def test_list_accessible_customers
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::ListAccessibleCustomersResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.

    list_accessible_customers_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_accessible_customers, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::ListAccessibleCustomersRequest, request
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_accessible_customers_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CustomerService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_accessible_customers({}) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_accessible_customers Google::Ads::GoogleAds::V3::Services::ListAccessibleCustomersRequest.new() do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_accessible_customers({}, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_accessible_customers Google::Ads::GoogleAds::V3::Services::ListAccessibleCustomersRequest.new(), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 4, list_accessible_customers_client_stub.call_rpc_count
    end
  end

  def test_create_customer_client
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::CreateCustomerClientResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    customer_client = {}
    email_address = {}
    access_role = :UNSPECIFIED

    create_customer_client_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_customer_client, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::CreateCustomerClientRequest, request
      assert_equal "hello world", request.customer_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Ads::GoogleAds::V3::Resources::Customer), request.customer_client
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::StringValue), request.email_address
      assert_equal :UNSPECIFIED, request.access_role
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_customer_client_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CustomerService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_customer_client({ customer_id: customer_id, customer_client: customer_client, email_address: email_address, access_role: access_role }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_customer_client customer_id: customer_id, customer_client: customer_client, email_address: email_address, access_role: access_role do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_customer_client Google::Ads::GoogleAds::V3::Services::CreateCustomerClientRequest.new(customer_id: customer_id, customer_client: customer_client, email_address: email_address, access_role: access_role) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_customer_client({ customer_id: customer_id, customer_client: customer_client, email_address: email_address, access_role: access_role }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_customer_client Google::Ads::GoogleAds::V3::Services::CreateCustomerClientRequest.new(customer_id: customer_id, customer_client: customer_client, email_address: email_address, access_role: access_role), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_customer_client_client_stub.call_rpc_count
    end
  end
end
