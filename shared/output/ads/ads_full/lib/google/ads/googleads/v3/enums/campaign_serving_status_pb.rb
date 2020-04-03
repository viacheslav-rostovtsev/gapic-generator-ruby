# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/enums/campaign_serving_status.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/enums/campaign_serving_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.enums.CampaignServingStatusEnum" do
    end
    add_enum "google.ads.googleads.v3.enums.CampaignServingStatusEnum.CampaignServingStatus" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :SERVING, 2
      value :NONE, 3
      value :ENDED, 4
      value :PENDING, 5
      value :SUSPENDED, 6
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Enums
          CampaignServingStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.CampaignServingStatusEnum").msgclass
          CampaignServingStatusEnum::CampaignServingStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.CampaignServingStatusEnum.CampaignServingStatus").enummodule
        end
      end
    end
  end
end
