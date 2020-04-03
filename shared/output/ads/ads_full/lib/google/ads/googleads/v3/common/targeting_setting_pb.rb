# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/common/targeting_setting.proto

require 'google/protobuf'

require 'google/ads/googleads/v3/enums/targeting_dimension_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/common/targeting_setting.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.common.TargetingSetting" do
      repeated :target_restrictions, :message, 1, "google.ads.googleads.v3.common.TargetRestriction"
      repeated :target_restriction_operations, :message, 2, "google.ads.googleads.v3.common.TargetRestrictionOperation"
    end
    add_message "google.ads.googleads.v3.common.TargetRestriction" do
      optional :targeting_dimension, :enum, 1, "google.ads.googleads.v3.enums.TargetingDimensionEnum.TargetingDimension"
      optional :bid_only, :message, 2, "google.protobuf.BoolValue"
    end
    add_message "google.ads.googleads.v3.common.TargetRestrictionOperation" do
      optional :operator, :enum, 1, "google.ads.googleads.v3.common.TargetRestrictionOperation.Operator"
      optional :value, :message, 2, "google.ads.googleads.v3.common.TargetRestriction"
    end
    add_enum "google.ads.googleads.v3.common.TargetRestrictionOperation.Operator" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ADD, 2
      value :REMOVE, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Common
          TargetingSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.TargetingSetting").msgclass
          TargetRestriction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.TargetRestriction").msgclass
          TargetRestrictionOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.TargetRestrictionOperation").msgclass
          TargetRestrictionOperation::Operator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.TargetRestrictionOperation.Operator").enummodule
        end
      end
    end
  end
end
