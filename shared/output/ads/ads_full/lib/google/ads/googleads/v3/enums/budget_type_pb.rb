# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/enums/budget_type.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/enums/budget_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.enums.BudgetTypeEnum" do
    end
    add_enum "google.ads.googleads.v3.enums.BudgetTypeEnum.BudgetType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :STANDARD, 2
      value :HOTEL_ADS_COMMISSION, 3
      value :FIXED_CPA, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Enums
          BudgetTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.BudgetTypeEnum").msgclass
          BudgetTypeEnum::BudgetType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.BudgetTypeEnum.BudgetType").enummodule
        end
      end
    end
  end
end
