# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/errors/extension_feed_item_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/errors/extension_feed_item_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.errors.ExtensionFeedItemErrorEnum" do
    end
    add_enum "google.ads.googleads.v3.errors.ExtensionFeedItemErrorEnum.ExtensionFeedItemError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :VALUE_OUT_OF_RANGE, 2
      value :URL_LIST_TOO_LONG, 3
      value :CANNOT_HAVE_RESTRICTION_ON_EMPTY_GEO_TARGETING, 4
      value :CANNOT_SET_WITH_FINAL_URLS, 5
      value :CANNOT_SET_WITHOUT_FINAL_URLS, 6
      value :INVALID_PHONE_NUMBER, 7
      value :PHONE_NUMBER_NOT_SUPPORTED_FOR_COUNTRY, 8
      value :CARRIER_SPECIFIC_SHORT_NUMBER_NOT_ALLOWED, 9
      value :PREMIUM_RATE_NUMBER_NOT_ALLOWED, 10
      value :DISALLOWED_NUMBER_TYPE, 11
      value :INVALID_DOMESTIC_PHONE_NUMBER_FORMAT, 12
      value :VANITY_PHONE_NUMBER_NOT_ALLOWED, 13
      value :INVALID_CALL_CONVERSION_ACTION, 14
      value :CUSTOMER_NOT_WHITELISTED_FOR_CALLTRACKING, 15
      value :CALLTRACKING_NOT_SUPPORTED_FOR_COUNTRY, 16
      value :CUSTOMER_CONSENT_FOR_CALL_RECORDING_REQUIRED, 17
      value :INVALID_APP_ID, 18
      value :QUOTES_IN_REVIEW_EXTENSION_SNIPPET, 19
      value :HYPHENS_IN_REVIEW_EXTENSION_SNIPPET, 20
      value :REVIEW_EXTENSION_SOURCE_INELIGIBLE, 21
      value :SOURCE_NAME_IN_REVIEW_EXTENSION_TEXT, 22
      value :INCONSISTENT_CURRENCY_CODES, 23
      value :PRICE_EXTENSION_HAS_DUPLICATED_HEADERS, 24
      value :PRICE_ITEM_HAS_DUPLICATED_HEADER_AND_DESCRIPTION, 25
      value :PRICE_EXTENSION_HAS_TOO_FEW_ITEMS, 26
      value :PRICE_EXTENSION_HAS_TOO_MANY_ITEMS, 27
      value :UNSUPPORTED_VALUE, 28
      value :UNSUPPORTED_VALUE_IN_SELECTED_LANGUAGE, 29
      value :INVALID_DEVICE_PREFERENCE, 30
      value :INVALID_SCHEDULE_END, 31
      value :DATE_TIME_MUST_BE_IN_ACCOUNT_TIME_ZONE, 32
      value :INVALID_SNIPPETS_HEADER, 33
      value :CANNOT_OPERATE_ON_REMOVED_FEED_ITEM, 34
      value :PHONE_NUMBER_NOT_SUPPORTED_WITH_CALLTRACKING_FOR_COUNTRY, 35
      value :CONFLICTING_CALL_CONVERSION_SETTINGS, 36
      value :EXTENSION_TYPE_MISMATCH, 37
      value :EXTENSION_SUBTYPE_REQUIRED, 38
      value :EXTENSION_TYPE_UNSUPPORTED, 39
      value :CANNOT_OPERATE_ON_FEED_WITH_MULTIPLE_MAPPINGS, 40
      value :CANNOT_OPERATE_ON_FEED_WITH_KEY_ATTRIBUTES, 41
      value :INVALID_PRICE_FORMAT, 42
      value :PROMOTION_INVALID_TIME, 43
      value :TOO_MANY_DECIMAL_PLACES_SPECIFIED, 44
      value :CONCRETE_EXTENSION_TYPE_REQUIRED, 45
      value :SCHEDULE_END_NOT_AFTER_START, 46
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Errors
          ExtensionFeedItemErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.ExtensionFeedItemErrorEnum").msgclass
          ExtensionFeedItemErrorEnum::ExtensionFeedItemError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.ExtensionFeedItemErrorEnum.ExtensionFeedItemError").enummodule
        end
      end
    end
  end
end
