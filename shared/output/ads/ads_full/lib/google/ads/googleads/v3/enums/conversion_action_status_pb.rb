# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/enums/conversion_action_status.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/enums/conversion_action_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.enums.ConversionActionStatusEnum" do
    end
    add_enum "google.ads.googleads.v3.enums.ConversionActionStatusEnum.ConversionActionStatus" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ENABLED, 2
      value :REMOVED, 3
      value :HIDDEN, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Enums
          ConversionActionStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.ConversionActionStatusEnum").msgclass
          ConversionActionStatusEnum::ConversionActionStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.ConversionActionStatusEnum.ConversionActionStatus").enummodule
        end
      end
    end
  end
end
