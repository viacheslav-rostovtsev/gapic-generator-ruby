# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/errors/ad_sharing_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/errors/ad_sharing_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.errors.AdSharingErrorEnum" do
    end
    add_enum "google.ads.googleads.v3.errors.AdSharingErrorEnum.AdSharingError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :AD_GROUP_ALREADY_CONTAINS_AD, 2
      value :INCOMPATIBLE_AD_UNDER_AD_GROUP, 3
      value :CANNOT_SHARE_INACTIVE_AD, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Errors
          AdSharingErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.AdSharingErrorEnum").msgclass
          AdSharingErrorEnum::AdSharingError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.AdSharingErrorEnum.AdSharingError").enummodule
        end
      end
    end
  end
end
