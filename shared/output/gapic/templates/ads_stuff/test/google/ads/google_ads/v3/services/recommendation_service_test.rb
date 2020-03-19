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

require "google/ads/googleads/v3/services/recommendation_service_pb"
require "google/ads/googleads/v3/services/recommendation_service_services_pb"
require "google/ads/google_ads/v3/services/recommendation_service"

class Google::Ads::GoogleAds::V3::Services::RecommendationService::ClientTest < Minitest::Test
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

  def test_get_recommendation
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Resources::Recommendation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"

    get_recommendation_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_recommendation, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::GetRecommendationRequest, request
      assert_equal "hello world", request.resource_name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_recommendation_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::RecommendationService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_recommendation({ resource_name: resource_name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_recommendation resource_name: resource_name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_recommendation Google::Ads::GoogleAds::V3::Services::GetRecommendationRequest.new(resource_name: resource_name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_recommendation({ resource_name: resource_name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_recommendation Google::Ads::GoogleAds::V3::Services::GetRecommendationRequest.new(resource_name: resource_name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_recommendation_client_stub.call_rpc_count
    end
  end

  def test_apply_recommendation
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::ApplyRecommendationResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    operations = [{}]
    partial_failure = true

    apply_recommendation_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :apply_recommendation, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::ApplyRecommendationRequest, request
      assert_equal "hello world", request.customer_id
      assert_kind_of Google::Ads::GoogleAds::V3::Services::ApplyRecommendationOperation, request.operations.first
      assert_equal true, request.partial_failure
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, apply_recommendation_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::RecommendationService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.apply_recommendation({ customer_id: customer_id, operations: operations, partial_failure: partial_failure }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.apply_recommendation customer_id: customer_id, operations: operations, partial_failure: partial_failure do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.apply_recommendation Google::Ads::GoogleAds::V3::Services::ApplyRecommendationRequest.new(customer_id: customer_id, operations: operations, partial_failure: partial_failure) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.apply_recommendation({ customer_id: customer_id, operations: operations, partial_failure: partial_failure }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.apply_recommendation Google::Ads::GoogleAds::V3::Services::ApplyRecommendationRequest.new(customer_id: customer_id, operations: operations, partial_failure: partial_failure), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, apply_recommendation_client_stub.call_rpc_count
    end
  end

  def test_dismiss_recommendation
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::DismissRecommendationResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    operations = [{}]
    partial_failure = true

    dismiss_recommendation_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :dismiss_recommendation, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::DismissRecommendationRequest, request
      assert_equal "hello world", request.customer_id
      assert_kind_of Google::Ads::GoogleAds::V3::Services::DismissRecommendationRequest::DismissRecommendationOperation, request.operations.first
      assert_equal true, request.partial_failure
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, dismiss_recommendation_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::RecommendationService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.dismiss_recommendation({ customer_id: customer_id, operations: operations, partial_failure: partial_failure }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.dismiss_recommendation customer_id: customer_id, operations: operations, partial_failure: partial_failure do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.dismiss_recommendation Google::Ads::GoogleAds::V3::Services::DismissRecommendationRequest.new(customer_id: customer_id, operations: operations, partial_failure: partial_failure) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.dismiss_recommendation({ customer_id: customer_id, operations: operations, partial_failure: partial_failure }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.dismiss_recommendation Google::Ads::GoogleAds::V3::Services::DismissRecommendationRequest.new(customer_id: customer_id, operations: operations, partial_failure: partial_failure), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, dismiss_recommendation_client_stub.call_rpc_count
    end
  end
end
