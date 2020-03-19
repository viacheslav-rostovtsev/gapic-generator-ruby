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

require "google/ads/googleads/v3/services/google_ads_service_pb"
require "google/ads/googleads/v3/services/google_ads_service_services_pb"
require "google/ads/google_ads/v3/services/google_ads_service"

class Google::Ads::GoogleAds::V3::Services::GoogleAdsService::ClientTest < Minitest::Test
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

  def test_search
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    query = "hello world"
    page_token = "hello world"
    page_size = 42
    validate_only = true
    return_total_results_count = true
    summary_row_setting = :UNSPECIFIED

    search_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :search, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsRequest, request
      assert_equal "hello world", request.customer_id
      assert_equal "hello world", request.query
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      assert_equal true, request.validate_only
      assert_equal true, request.return_total_results_count
      assert_equal :UNSPECIFIED, request.summary_row_setting
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, search_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::GoogleAdsService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.search({ customer_id: customer_id, query: query, page_token: page_token, page_size: page_size, validate_only: validate_only, return_total_results_count: return_total_results_count, summary_row_setting: summary_row_setting }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.search customer_id: customer_id, query: query, page_token: page_token, page_size: page_size, validate_only: validate_only, return_total_results_count: return_total_results_count, summary_row_setting: summary_row_setting do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.search Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsRequest.new(customer_id: customer_id, query: query, page_token: page_token, page_size: page_size, validate_only: validate_only, return_total_results_count: return_total_results_count, summary_row_setting: summary_row_setting) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.search({ customer_id: customer_id, query: query, page_token: page_token, page_size: page_size, validate_only: validate_only, return_total_results_count: return_total_results_count, summary_row_setting: summary_row_setting }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.search Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsRequest.new(customer_id: customer_id, query: query, page_token: page_token, page_size: page_size, validate_only: validate_only, return_total_results_count: return_total_results_count, summary_row_setting: summary_row_setting), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, search_client_stub.call_rpc_count
    end
  end

  def test_search_stream
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsStreamResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a server streaming method.
    customer_id = "hello world"
    query = "hello world"
    summary_row_setting = :UNSPECIFIED

    search_stream_client_stub = ClientStub.new [grpc_response].to_enum, grpc_operation do |name, request, options:|
      assert_equal :search_stream, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsStreamRequest, request
      assert_equal "hello world", request.customer_id
      assert_equal "hello world", request.query
      assert_equal :UNSPECIFIED, request.summary_row_setting
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, search_stream_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::GoogleAdsService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.search_stream({ customer_id: customer_id, query: query, summary_row_setting: summary_row_setting }) do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsStreamResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.search_stream customer_id: customer_id, query: query, summary_row_setting: summary_row_setting do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsStreamResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.search_stream Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsStreamRequest.new(customer_id: customer_id, query: query, summary_row_setting: summary_row_setting) do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsStreamResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.search_stream({ customer_id: customer_id, query: query, summary_row_setting: summary_row_setting }, grpc_options) do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsStreamResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.search_stream Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsStreamRequest.new(customer_id: customer_id, query: query, summary_row_setting: summary_row_setting), grpc_options do |response, operation|
        assert_kind_of Enumerable, response
        response.to_a.each do |r|
          assert_kind_of Google::Ads::GoogleAds::V3::Services::SearchGoogleAdsStreamResponse, r
        end
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, search_stream_client_stub.call_rpc_count
    end
  end

  def test_mutate
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::MutateGoogleAdsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    mutate_operations = [{}]
    partial_failure = true
    validate_only = true

    mutate_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :mutate, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::MutateGoogleAdsRequest, request
      assert_equal "hello world", request.customer_id
      assert_kind_of Google::Ads::GoogleAds::V3::Services::MutateOperation, request.mutate_operations.first
      assert_equal true, request.partial_failure
      assert_equal true, request.validate_only
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, mutate_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::GoogleAdsService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.mutate({ customer_id: customer_id, mutate_operations: mutate_operations, partial_failure: partial_failure, validate_only: validate_only }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.mutate customer_id: customer_id, mutate_operations: mutate_operations, partial_failure: partial_failure, validate_only: validate_only do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.mutate Google::Ads::GoogleAds::V3::Services::MutateGoogleAdsRequest.new(customer_id: customer_id, mutate_operations: mutate_operations, partial_failure: partial_failure, validate_only: validate_only) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.mutate({ customer_id: customer_id, mutate_operations: mutate_operations, partial_failure: partial_failure, validate_only: validate_only }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.mutate Google::Ads::GoogleAds::V3::Services::MutateGoogleAdsRequest.new(customer_id: customer_id, mutate_operations: mutate_operations, partial_failure: partial_failure, validate_only: validate_only), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, mutate_client_stub.call_rpc_count
    end
  end
end
