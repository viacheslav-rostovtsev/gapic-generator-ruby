# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/resources/billing_setup.proto

require 'google/protobuf'

require 'google/ads/googleads/v3/enums/billing_setup_status_pb'
require 'google/ads/googleads/v3/enums/time_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/resources/billing_setup.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.resources.BillingSetup" do
      optional :resource_name, :string, 1
      optional :id, :message, 2, "google.protobuf.Int64Value"
      optional :status, :enum, 3, "google.ads.googleads.v3.enums.BillingSetupStatusEnum.BillingSetupStatus"
      optional :payments_account, :message, 11, "google.protobuf.StringValue"
      optional :payments_account_info, :message, 12, "google.ads.googleads.v3.resources.BillingSetup.PaymentsAccountInfo"
      oneof :start_time do
        optional :start_date_time, :message, 9, "google.protobuf.StringValue"
        optional :start_time_type, :enum, 10, "google.ads.googleads.v3.enums.TimeTypeEnum.TimeType"
      end
      oneof :end_time do
        optional :end_date_time, :message, 13, "google.protobuf.StringValue"
        optional :end_time_type, :enum, 14, "google.ads.googleads.v3.enums.TimeTypeEnum.TimeType"
      end
    end
    add_message "google.ads.googleads.v3.resources.BillingSetup.PaymentsAccountInfo" do
      optional :payments_account_id, :message, 1, "google.protobuf.StringValue"
      optional :payments_account_name, :message, 2, "google.protobuf.StringValue"
      optional :payments_profile_id, :message, 3, "google.protobuf.StringValue"
      optional :payments_profile_name, :message, 4, "google.protobuf.StringValue"
      optional :secondary_payments_profile_id, :message, 5, "google.protobuf.StringValue"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Resources
          BillingSetup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.resources.BillingSetup").msgclass
          BillingSetup::PaymentsAccountInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.resources.BillingSetup.PaymentsAccountInfo").msgclass
        end
      end
    end
  end
end
