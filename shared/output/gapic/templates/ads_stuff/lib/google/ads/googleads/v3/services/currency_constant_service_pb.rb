# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/services/currency_constant_service.proto

require 'google/protobuf'

require 'google/ads/googleads/v3/resources/currency_constant_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/services/currency_constant_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.services.GetCurrencyConstantRequest" do
      optional :resource_name, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Services
          GetCurrencyConstantRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.GetCurrencyConstantRequest").msgclass
        end
      end
    end
  end
end
