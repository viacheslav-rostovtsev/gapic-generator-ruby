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

require "google/ads/googleads/v3/services/reach_plan_service_pb"
require "google/ads/googleads/v3/services/reach_plan_service_services_pb"
require "google/ads/google_ads/v3/services/reach_plan_service"

class Google::Ads::GoogleAds::V3::Services::ReachPlanService::ClientTest < Minitest::Test
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

  def test_list_plannable_locations
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::ListPlannableLocationsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.

    list_plannable_locations_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_plannable_locations, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::ListPlannableLocationsRequest, request
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_plannable_locations_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::ReachPlanService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_plannable_locations({}) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_plannable_locations Google::Ads::GoogleAds::V3::Services::ListPlannableLocationsRequest.new() do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_plannable_locations({}, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_plannable_locations Google::Ads::GoogleAds::V3::Services::ListPlannableLocationsRequest.new(), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 4, list_plannable_locations_client_stub.call_rpc_count
    end
  end

  def test_list_plannable_products
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::ListPlannableProductsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    plannable_location_id = {}

    list_plannable_products_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_plannable_products, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::ListPlannableProductsRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::StringValue), request.plannable_location_id
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_plannable_products_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::ReachPlanService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_plannable_products({ plannable_location_id: plannable_location_id }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_plannable_products plannable_location_id: plannable_location_id do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_plannable_products Google::Ads::GoogleAds::V3::Services::ListPlannableProductsRequest.new(plannable_location_id: plannable_location_id) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_plannable_products({ plannable_location_id: plannable_location_id }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_plannable_products Google::Ads::GoogleAds::V3::Services::ListPlannableProductsRequest.new(plannable_location_id: plannable_location_id), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_plannable_products_client_stub.call_rpc_count
    end
  end

  def test_generate_product_mix_ideas
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::GenerateProductMixIdeasResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    plannable_location_id = {}
    currency_code = {}
    budget_micros = {}
    preferences = {}

    generate_product_mix_ideas_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :generate_product_mix_ideas, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::GenerateProductMixIdeasRequest, request
      assert_equal "hello world", request.customer_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::StringValue), request.plannable_location_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::StringValue), request.currency_code
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::Int64Value), request.budget_micros
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Ads::GoogleAds::V3::Services::Preferences), request.preferences
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, generate_product_mix_ideas_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::ReachPlanService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.generate_product_mix_ideas({ customer_id: customer_id, plannable_location_id: plannable_location_id, currency_code: currency_code, budget_micros: budget_micros, preferences: preferences }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.generate_product_mix_ideas customer_id: customer_id, plannable_location_id: plannable_location_id, currency_code: currency_code, budget_micros: budget_micros, preferences: preferences do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.generate_product_mix_ideas Google::Ads::GoogleAds::V3::Services::GenerateProductMixIdeasRequest.new(customer_id: customer_id, plannable_location_id: plannable_location_id, currency_code: currency_code, budget_micros: budget_micros, preferences: preferences) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.generate_product_mix_ideas({ customer_id: customer_id, plannable_location_id: plannable_location_id, currency_code: currency_code, budget_micros: budget_micros, preferences: preferences }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.generate_product_mix_ideas Google::Ads::GoogleAds::V3::Services::GenerateProductMixIdeasRequest.new(customer_id: customer_id, plannable_location_id: plannable_location_id, currency_code: currency_code, budget_micros: budget_micros, preferences: preferences), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, generate_product_mix_ideas_client_stub.call_rpc_count
    end
  end

  def test_generate_reach_forecast
    # Create GRPC objects.
    grpc_response = Google::Ads::GoogleAds::V3::Services::GenerateReachForecastResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    customer_id = "hello world"
    currency_code = {}
    campaign_duration = {}
    cookie_frequency_cap = {}
    min_effective_frequency = {}
    targeting = {}
    planned_products = [{}]

    generate_reach_forecast_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :generate_reach_forecast, name
      assert_kind_of Google::Ads::GoogleAds::V3::Services::GenerateReachForecastRequest, request
      assert_equal "hello world", request.customer_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::StringValue), request.currency_code
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Ads::GoogleAds::V3::Services::CampaignDuration), request.campaign_duration
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::Int32Value), request.cookie_frequency_cap
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::Int32Value), request.min_effective_frequency
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Ads::GoogleAds::V3::Services::Targeting), request.targeting
      assert_kind_of Google::Ads::GoogleAds::V3::Services::PlannedProduct, request.planned_products.first
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, generate_reach_forecast_client_stub do
      # Create client
      client = Google::Ads::GoogleAds::V3::Services::ReachPlanService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.generate_reach_forecast({ customer_id: customer_id, currency_code: currency_code, campaign_duration: campaign_duration, cookie_frequency_cap: cookie_frequency_cap, min_effective_frequency: min_effective_frequency, targeting: targeting, planned_products: planned_products }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.generate_reach_forecast customer_id: customer_id, currency_code: currency_code, campaign_duration: campaign_duration, cookie_frequency_cap: cookie_frequency_cap, min_effective_frequency: min_effective_frequency, targeting: targeting, planned_products: planned_products do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.generate_reach_forecast Google::Ads::GoogleAds::V3::Services::GenerateReachForecastRequest.new(customer_id: customer_id, currency_code: currency_code, campaign_duration: campaign_duration, cookie_frequency_cap: cookie_frequency_cap, min_effective_frequency: min_effective_frequency, targeting: targeting, planned_products: planned_products) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.generate_reach_forecast({ customer_id: customer_id, currency_code: currency_code, campaign_duration: campaign_duration, cookie_frequency_cap: cookie_frequency_cap, min_effective_frequency: min_effective_frequency, targeting: targeting, planned_products: planned_products }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.generate_reach_forecast Google::Ads::GoogleAds::V3::Services::GenerateReachForecastRequest.new(customer_id: customer_id, currency_code: currency_code, campaign_duration: campaign_duration, cookie_frequency_cap: cookie_frequency_cap, min_effective_frequency: min_effective_frequency, targeting: targeting, planned_products: planned_products), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, generate_reach_forecast_client_stub.call_rpc_count
    end
  end
end
