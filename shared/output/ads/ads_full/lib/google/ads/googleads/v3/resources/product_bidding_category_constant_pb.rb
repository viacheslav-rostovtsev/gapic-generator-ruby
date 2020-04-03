# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/resources/product_bidding_category_constant.proto

require 'google/protobuf'

require 'google/ads/googleads/v3/enums/product_bidding_category_level_pb'
require 'google/ads/googleads/v3/enums/product_bidding_category_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/resources/product_bidding_category_constant.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.resources.ProductBiddingCategoryConstant" do
      optional :resource_name, :string, 1
      optional :id, :message, 2, "google.protobuf.Int64Value"
      optional :country_code, :message, 3, "google.protobuf.StringValue"
      optional :product_bidding_category_constant_parent, :message, 4, "google.protobuf.StringValue"
      optional :level, :enum, 5, "google.ads.googleads.v3.enums.ProductBiddingCategoryLevelEnum.ProductBiddingCategoryLevel"
      optional :status, :enum, 6, "google.ads.googleads.v3.enums.ProductBiddingCategoryStatusEnum.ProductBiddingCategoryStatus"
      optional :language_code, :message, 7, "google.protobuf.StringValue"
      optional :localized_name, :message, 8, "google.protobuf.StringValue"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Resources
          ProductBiddingCategoryConstant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.resources.ProductBiddingCategoryConstant").msgclass
        end
      end
    end
  end
end
