# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/enums/app_url_operating_system_type.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/enums/app_url_operating_system_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.enums.AppUrlOperatingSystemTypeEnum" do
    end
    add_enum "google.ads.googleads.v3.enums.AppUrlOperatingSystemTypeEnum.AppUrlOperatingSystemType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :IOS, 2
      value :ANDROID, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Enums
          AppUrlOperatingSystemTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.AppUrlOperatingSystemTypeEnum").msgclass
          AppUrlOperatingSystemTypeEnum::AppUrlOperatingSystemType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.AppUrlOperatingSystemTypeEnum.AppUrlOperatingSystemType").enummodule
        end
      end
    end
  end
end
