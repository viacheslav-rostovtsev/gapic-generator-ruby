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

require "google/ads/googleads/v3/services/campaign_draft_service_pb"
require "google/ads/googleads/v3/services/campaign_draft_service_services_pb"
require "google/ads/google_ads/v3/services/campaign_draft_service"

class Google::Ads::GoogleAds::V3::Services::CampaignDraftService::ClientTest < Minitest::Test
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

  def test_get_campaign_draft
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Resources::CampaignDraft.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"

    get_campaign_draft_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_campaign_draft, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::GetCampaignDraftRequest, request
      assert_equal "hello world", request.resource_name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_campaign_draft_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CampaignDraftService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_campaign_draft({ resource_name: resource_name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_campaign_draft resource_name: resource_name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_campaign_draft Google::Ads::GoogleAds::V3::Services::GetCampaignDraftRequest.new(resource_name: resource_name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_campaign_draft({ resource_name: resource_name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_campaign_draft Google::Ads::GoogleAds::V3::Services::GetCampaignDraftRequest.new(resource_name: resource_name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_campaign_draft_client_stub.call_rpc_count
    end
  end

  def test_mutate_campaign_drafts
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::MutateCampaignDraftsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    operations = [{}]
    partial_failure = true
    validate_only = true

    mutate_campaign_drafts_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :mutate_campaign_drafts, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::MutateCampaignDraftsRequest, request
      assert_equal "hello world", request.customer_id
      assert_kind_of Google::Ads::GoogleAds::V3::Services::CampaignDraftOperation, request.operations.first
      assert_equal true, request.partial_failure
      assert_equal true, request.validate_only
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, mutate_campaign_drafts_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CampaignDraftService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.mutate_campaign_drafts({ customer_id: customer_id, operations: operations, partial_failure: partial_failure, validate_only: validate_only }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.mutate_campaign_drafts customer_id: customer_id, operations: operations, partial_failure: partial_failure, validate_only: validate_only do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.mutate_campaign_drafts Google::Ads::GoogleAds::V3::Services::MutateCampaignDraftsRequest.new(customer_id: customer_id, operations: operations, partial_failure: partial_failure, validate_only: validate_only) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.mutate_campaign_drafts({ customer_id: customer_id, operations: operations, partial_failure: partial_failure, validate_only: validate_only }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.mutate_campaign_drafts Google::Ads::GoogleAds::V3::Services::MutateCampaignDraftsRequest.new(customer_id: customer_id, operations: operations, partial_failure: partial_failure, validate_only: validate_only), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, mutate_campaign_drafts_client_stub.call_rpc_count
    end
  end

  def test_promote_campaign_draft
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    campaign_draft = "hello world"

    promote_campaign_draft_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :promote_campaign_draft, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::PromoteCampaignDraftRequest, request
      assert_equal "hello world", request.campaign_draft
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, promote_campaign_draft_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CampaignDraftService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.promote_campaign_draft({ campaign_draft: campaign_draft }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.promote_campaign_draft campaign_draft: campaign_draft do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.promote_campaign_draft Google::Ads::GoogleAds::V3::Services::PromoteCampaignDraftRequest.new(campaign_draft: campaign_draft) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.promote_campaign_draft({ campaign_draft: campaign_draft }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.promote_campaign_draft Google::Ads::GoogleAds::V3::Services::PromoteCampaignDraftRequest.new(campaign_draft: campaign_draft), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, promote_campaign_draft_client_stub.call_rpc_count
    end
  end

  def test_list_campaign_draft_async_errors
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::ListCampaignDraftAsyncErrorsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource_name = "hello world"
    page_token = "hello world"
    page_size = 42

    list_campaign_draft_async_errors_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_campaign_draft_async_errors, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::ListCampaignDraftAsyncErrorsRequest, request
      assert_equal "hello world", request.resource_name
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_campaign_draft_async_errors_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::CampaignDraftService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_campaign_draft_async_errors({ resource_name: resource_name, page_token: page_token, page_size: page_size }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_campaign_draft_async_errors resource_name: resource_name, page_token: page_token, page_size: page_size do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_campaign_draft_async_errors Google::Ads::GoogleAds::V3::Services::ListCampaignDraftAsyncErrorsRequest.new(resource_name: resource_name, page_token: page_token, page_size: page_size) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_campaign_draft_async_errors({ resource_name: resource_name, page_token: page_token, page_size: page_size }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_campaign_draft_async_errors Google::Ads::GoogleAds::V3::Services::ListCampaignDraftAsyncErrorsRequest.new(resource_name: resource_name, page_token: page_token, page_size: page_size), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_campaign_draft_async_errors_client_stub.call_rpc_count
    end
  end
end
