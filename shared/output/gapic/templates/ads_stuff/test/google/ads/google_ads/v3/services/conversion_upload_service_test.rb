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

require "google/ads/googleads/v3/services/conversion_upload_service_pb"
require "google/ads/googleads/v3/services/conversion_upload_service_services_pb"
require "google/ads/google_ads/v3/services/conversion_upload_service"

class Google::Ads::GoogleAds::V3::Services::ConversionUploadService::ClientTest < Minitest::Test
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

  def test_upload_click_conversions
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::UploadClickConversionsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    conversions = [{}]
    partial_failure = true
    validate_only = true

    upload_click_conversions_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :upload_click_conversions, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::UploadClickConversionsRequest, request
      assert_equal "hello world", request.customer_id
      assert_kind_of Google::Ads::GoogleAds::V3::Services::ClickConversion, request.conversions.first
      assert_equal true, request.partial_failure
      assert_equal true, request.validate_only
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, upload_click_conversions_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::ConversionUploadService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.upload_click_conversions({ customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.upload_click_conversions customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.upload_click_conversions Google::Ads::GoogleAds::V3::Services::UploadClickConversionsRequest.new(customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.upload_click_conversions({ customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.upload_click_conversions Google::Ads::GoogleAds::V3::Services::UploadClickConversionsRequest.new(customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, upload_click_conversions_client_stub.call_rpc_count
    end
  end

  def test_upload_call_conversions
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::UploadCallConversionsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    conversions = [{}]
    partial_failure = true
    validate_only = true

    upload_call_conversions_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :upload_call_conversions, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::UploadCallConversionsRequest, request
      assert_equal "hello world", request.customer_id
      assert_kind_of Google::Ads::GoogleAds::V3::Services::CallConversion, request.conversions.first
      assert_equal true, request.partial_failure
      assert_equal true, request.validate_only
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, upload_call_conversions_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::ConversionUploadService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.upload_call_conversions({ customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.upload_call_conversions customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.upload_call_conversions Google::Ads::GoogleAds::V3::Services::UploadCallConversionsRequest.new(customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.upload_call_conversions({ customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.upload_call_conversions Google::Ads::GoogleAds::V3::Services::UploadCallConversionsRequest.new(customer_id: customer_id, conversions: conversions, partial_failure: partial_failure, validate_only: validate_only), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, upload_call_conversions_client_stub.call_rpc_count
    end
  end
end
