# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/services/ad_group_label_service.proto

require 'google/protobuf'

require 'google/ads/googleads/v3/resources/ad_group_label_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/rpc/status_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/services/ad_group_label_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.services.GetAdGroupLabelRequest" do
      optional :resource_name, :string, 1
    end
    add_message "google.ads.googleads.v3.services.MutateAdGroupLabelsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v3.services.AdGroupLabelOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
    end
    add_message "google.ads.googleads.v3.services.AdGroupLabelOperation" do
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v3.resources.AdGroupLabel"
        optional :remove, :string, 2
      end
    end
    add_message "google.ads.googleads.v3.services.MutateAdGroupLabelsResponse" do
      optional :partial_failure_error, :message, 3, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v3.services.MutateAdGroupLabelResult"
    end
    add_message "google.ads.googleads.v3.services.MutateAdGroupLabelResult" do
      optional :resource_name, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Services
          GetAdGroupLabelRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.GetAdGroupLabelRequest").msgclass
          MutateAdGroupLabelsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MutateAdGroupLabelsRequest").msgclass
          AdGroupLabelOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.AdGroupLabelOperation").msgclass
          MutateAdGroupLabelsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MutateAdGroupLabelsResponse").msgclass
          MutateAdGroupLabelResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MutateAdGroupLabelResult").msgclass
        end
      end
    end
  end
end
