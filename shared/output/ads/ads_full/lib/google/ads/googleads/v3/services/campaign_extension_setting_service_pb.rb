# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/services/campaign_extension_setting_service.proto

require 'google/protobuf'

require 'google/ads/googleads/v3/resources/campaign_extension_setting_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/services/campaign_extension_setting_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.services.GetCampaignExtensionSettingRequest" do
      optional :resource_name, :string, 1
    end
    add_message "google.ads.googleads.v3.services.MutateCampaignExtensionSettingsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v3.services.CampaignExtensionSettingOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
    end
    add_message "google.ads.googleads.v3.services.CampaignExtensionSettingOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v3.resources.CampaignExtensionSetting"
        optional :update, :message, 2, "google.ads.googleads.v3.resources.CampaignExtensionSetting"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v3.services.MutateCampaignExtensionSettingsResponse" do
      optional :partial_failure_error, :message, 3, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v3.services.MutateCampaignExtensionSettingResult"
    end
    add_message "google.ads.googleads.v3.services.MutateCampaignExtensionSettingResult" do
      optional :resource_name, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Services
          GetCampaignExtensionSettingRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.GetCampaignExtensionSettingRequest").msgclass
          MutateCampaignExtensionSettingsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MutateCampaignExtensionSettingsRequest").msgclass
          CampaignExtensionSettingOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.CampaignExtensionSettingOperation").msgclass
          MutateCampaignExtensionSettingsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MutateCampaignExtensionSettingsResponse").msgclass
          MutateCampaignExtensionSettingResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MutateCampaignExtensionSettingResult").msgclass
        end
      end
    end
  end
end
