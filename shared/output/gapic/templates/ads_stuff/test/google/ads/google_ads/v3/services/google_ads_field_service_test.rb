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

require "google/ads/googleads/v3/services/google_ads_field_service_pb"
require "google/ads/googleads/v3/services/google_ads_field_service_services_pb"
require "google/ads/google_ads/v3/services/google_ads_field_service"

class Google::Ads::GoogleAds::V3::Services::GoogleAdsFieldService::ClientTest < Minitest::Test
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

  def test_get_google_ads_field
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Resources::GoogleAdsField.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"

    get_google_ads_field_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_google_ads_field, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::GetGoogleAdsFieldRequest, request
      assert_equal "hello world", request.resource_name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_google_ads_field_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::GoogleAdsFieldService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_google_ads_field({ resource_name: resource_name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_google_ads_field resource_name: resource_name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_google_ads_field Google::Ads::GoogleAds::V3::Services::GetGoogleAdsFieldRequest.new(resource_name: resource_name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_google_ads_field({ resource_name: resource_name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_google_ads_field Google::Ads::GoogleAds::V3::Services::GetGoogleAdsFieldRequest.new(resource_name: resource_name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_google_ads_field_client_stub.call_rpc_count
    end
  end

  def test_search_google_ads_fields
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsFieldsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    query = "hello world"
    page_token = "hello world"
    page_size = 42

    search_google_ads_fields_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :search_google_ads_fields, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsFieldsRequest, request
      assert_equal "hello world", request.query
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, search_google_ads_fields_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::GoogleAdsFieldService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.search_google_ads_fields({ query: query, page_token: page_token, page_size: page_size }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.search_google_ads_fields query: query, page_token: page_token, page_size: page_size do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.search_google_ads_fields Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsFieldsRequest.new(query: query, page_token: page_token, page_size: page_size) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.search_google_ads_fields({ query: query, page_token: page_token, page_size: page_size }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.search_google_ads_fields Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsFieldsRequest.new(query: query, page_token: page_token, page_size: page_size), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, search_google_ads_fields_client_stub.call_rpc_count
    end
  end
end
