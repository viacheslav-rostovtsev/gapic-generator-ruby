# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Ads
    module GoogleAds
      module V3
        module Common
          # A keyword criterion.
          # @!attribute [rw] text
          #   @return [Google::Protobuf::StringValue]
          #     The text of the keyword (at most 80 characters and 10 words).
          # @!attribute [rw] match_type
          #   @return [Google::Ads::GoogleAds::V3::Enums::KeywordMatchTypeEnum::KeywordMatchType]
          #     The match type of the keyword.
          class KeywordInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A placement criterion. This can be used to modify bids for sites when
          # targeting the content network.
          # @!attribute [rw] url
          #   @return [Google::Protobuf::StringValue]
          #     URL of the placement.
          #
          #     For example, "http://www.domain.com".
          class PlacementInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A mobile app category criterion.
          # @!attribute [rw] mobile_app_category_constant
          #   @return [Google::Protobuf::StringValue]
          #     The mobile app category constant resource name.
          class MobileAppCategoryInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A mobile application criterion.
          # @!attribute [rw] app_id
          #   @return [Google::Protobuf::StringValue]
          #     A string that uniquely identifies a mobile application to Google Ads API.
          #     The format of this string is "\\{platform}-\\{platform_native_id}", where
          #     platform is "1" for iOS apps and "2" for Android apps, and where
          #     platform_native_id is the mobile application identifier native to the
          #     corresponding platform.
          #     For iOS, this native identifier is the 9 digit string that appears at the
          #     end of an App Store URL (e.g., "476943146" for "Flood-It! 2" whose App
          #     Store link is "http://itunes.apple.com/us/app/flood-it!-2/id476943146").
          #     For Android, this native identifier is the application's package name
          #     (e.g., "com.labpixies.colordrips" for "Color Drips" given Google Play link
          #     "https://play.google.com/store/apps/details?id=com.labpixies.colordrips").
          #     A well formed app id for Google Ads API would thus be "1-476943146" for iOS
          #     and "2-com.labpixies.colordrips" for Android.
          #     This field is required and must be set in CREATE operations.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     Name of this mobile application.
          class MobileApplicationInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A location criterion.
          # @!attribute [rw] geo_target_constant
          #   @return [Google::Protobuf::StringValue]
          #     The geo target constant resource name.
          class LocationInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A device criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::DeviceEnum::Device]
          #     Type of the device.
          class DeviceInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A preferred content criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::PreferredContentTypeEnum::PreferredContentType]
          #     Type of the preferred content.
          class PreferredContentInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A listing group criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::ListingGroupTypeEnum::ListingGroupType]
          #     Type of the listing group.
          # @!attribute [rw] case_value
          #   @return [Google::Ads::GoogleAds::V3::Common::ListingDimensionInfo]
          #     Dimension value with which this listing group is refining its parent.
          #     Undefined for the root group.
          # @!attribute [rw] parent_ad_group_criterion
          #   @return [Google::Protobuf::StringValue]
          #     Resource name of ad group criterion which is the parent listing group
          #     subdivision. Null for the root group.
          class ListingGroupInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A listing scope criterion.
          # @!attribute [rw] dimensions
          #   @return [Array<Google::Ads::GoogleAds::V3::Common::ListingDimensionInfo>]
          #     Scope of the campaign criterion.
          class ListingScopeInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Listing dimensions for listing group criterion.
          # @!attribute [rw] hotel_id
          #   @return [Google::Ads::GoogleAds::V3::Common::HotelIdInfo]
          #     Advertiser-specific hotel ID.
          # @!attribute [rw] hotel_class
          #   @return [Google::Ads::GoogleAds::V3::Common::HotelClassInfo]
          #     Class of the hotel as a number of stars 1 to 5.
          # @!attribute [rw] hotel_country_region
          #   @return [Google::Ads::GoogleAds::V3::Common::HotelCountryRegionInfo]
          #     Country or Region the hotel is located in.
          # @!attribute [rw] hotel_state
          #   @return [Google::Ads::GoogleAds::V3::Common::HotelStateInfo]
          #     State the hotel is located in.
          # @!attribute [rw] hotel_city
          #   @return [Google::Ads::GoogleAds::V3::Common::HotelCityInfo]
          #     City the hotel is located in.
          # @!attribute [rw] product_bidding_category
          #   @return [Google::Ads::GoogleAds::V3::Common::ProductBiddingCategoryInfo]
          #     Bidding category of a product offer.
          # @!attribute [rw] product_brand
          #   @return [Google::Ads::GoogleAds::V3::Common::ProductBrandInfo]
          #     Brand of a product offer.
          # @!attribute [rw] product_channel
          #   @return [Google::Ads::GoogleAds::V3::Common::ProductChannelInfo]
          #     Locality of a product offer.
          # @!attribute [rw] product_channel_exclusivity
          #   @return [Google::Ads::GoogleAds::V3::Common::ProductChannelExclusivityInfo]
          #     Availability of a product offer.
          # @!attribute [rw] product_condition
          #   @return [Google::Ads::GoogleAds::V3::Common::ProductConditionInfo]
          #     Condition of a product offer.
          # @!attribute [rw] product_custom_attribute
          #   @return [Google::Ads::GoogleAds::V3::Common::ProductCustomAttributeInfo]
          #     Custom attribute of a product offer.
          # @!attribute [rw] product_item_id
          #   @return [Google::Ads::GoogleAds::V3::Common::ProductItemIdInfo]
          #     Item id of a product offer.
          # @!attribute [rw] product_type
          #   @return [Google::Ads::GoogleAds::V3::Common::ProductTypeInfo]
          #     Type of a product offer.
          # @!attribute [rw] unknown_listing_dimension
          #   @return [Google::Ads::GoogleAds::V3::Common::UnknownListingDimensionInfo]
          #     Unknown dimension. Set when no other listing dimension is set.
          class ListingDimensionInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Advertiser-specific hotel ID.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::StringValue]
          #     String value of the hotel ID.
          class HotelIdInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Class of the hotel as a number of stars 1 to 5.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::Int64Value]
          #     Long value of the hotel class.
          class HotelClassInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Country or Region the hotel is located in.
          # @!attribute [rw] country_region_criterion
          #   @return [Google::Protobuf::StringValue]
          #     The Geo Target Constant resource name.
          class HotelCountryRegionInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # State the hotel is located in.
          # @!attribute [rw] state_criterion
          #   @return [Google::Protobuf::StringValue]
          #     The Geo Target Constant resource name.
          class HotelStateInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # City the hotel is located in.
          # @!attribute [rw] city_criterion
          #   @return [Google::Protobuf::StringValue]
          #     The Geo Target Constant resource name.
          class HotelCityInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Bidding category of a product offer.
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     ID of the product bidding category.
          #
          #     This ID is equivalent to the google_product_category ID as described in
          #     this article: https://support.google.com/merchants/answer/6324436
          # @!attribute [rw] country_code
          #   @return [Google::Protobuf::StringValue]
          #     Two-letter upper-case country code of the product bidding category. It must
          #     match the campaign.shopping_setting.sales_country field.
          # @!attribute [rw] level
          #   @return [Google::Ads::GoogleAds::V3::Enums::ProductBiddingCategoryLevelEnum::ProductBiddingCategoryLevel]
          #     Level of the product bidding category.
          class ProductBiddingCategoryInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Brand of the product.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::StringValue]
          #     String value of the product brand.
          class ProductBrandInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Locality of a product offer.
          # @!attribute [rw] channel
          #   @return [Google::Ads::GoogleAds::V3::Enums::ProductChannelEnum::ProductChannel]
          #     Value of the locality.
          class ProductChannelInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Availability of a product offer.
          # @!attribute [rw] channel_exclusivity
          #   @return [Google::Ads::GoogleAds::V3::Enums::ProductChannelExclusivityEnum::ProductChannelExclusivity]
          #     Value of the availability.
          class ProductChannelExclusivityInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Condition of a product offer.
          # @!attribute [rw] condition
          #   @return [Google::Ads::GoogleAds::V3::Enums::ProductConditionEnum::ProductCondition]
          #     Value of the condition.
          class ProductConditionInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Custom attribute of a product offer.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::StringValue]
          #     String value of the product custom attribute.
          # @!attribute [rw] index
          #   @return [Google::Ads::GoogleAds::V3::Enums::ProductCustomAttributeIndexEnum::ProductCustomAttributeIndex]
          #     Indicates the index of the custom attribute.
          class ProductCustomAttributeInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Item id of a product offer.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::StringValue]
          #     Value of the id.
          class ProductItemIdInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Type of a product offer.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::StringValue]
          #     Value of the type.
          # @!attribute [rw] level
          #   @return [Google::Ads::GoogleAds::V3::Enums::ProductTypeLevelEnum::ProductTypeLevel]
          #     Level of the type.
          class ProductTypeInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Unknown listing dimension.
          class UnknownListingDimensionInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Criterion for hotel date selection (default dates vs. user selected).
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::HotelDateSelectionTypeEnum::HotelDateSelectionType]
          #     Type of the hotel date selection
          class HotelDateSelectionTypeInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Criterion for number of days prior to the stay the booking is being made.
          # @!attribute [rw] min_days
          #   @return [Google::Protobuf::Int64Value]
          #     Low end of the number of days prior to the stay.
          # @!attribute [rw] max_days
          #   @return [Google::Protobuf::Int64Value]
          #     High end of the number of days prior to the stay.
          class HotelAdvanceBookingWindowInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Criterion for length of hotel stay in nights.
          # @!attribute [rw] min_nights
          #   @return [Google::Protobuf::Int64Value]
          #     Low end of the number of nights in the stay.
          # @!attribute [rw] max_nights
          #   @return [Google::Protobuf::Int64Value]
          #     High end of the number of nights in the stay.
          class HotelLengthOfStayInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Criterion for day of the week the booking is for.
          # @!attribute [rw] day_of_week
          #   @return [Google::Ads::GoogleAds::V3::Enums::DayOfWeekEnum::DayOfWeek]
          #     The day of the week.
          class HotelCheckInDayInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Criterion for Interaction Type.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::InteractionTypeEnum::InteractionType]
          #     The interaction type.
          class InteractionTypeInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Represents an AdSchedule criterion.
          #
          # AdSchedule is specified as the day of the week and a time interval
          # within which ads will be shown.
          #
          # No more than six AdSchedules can be added for the same day.
          # @!attribute [rw] start_minute
          #   @return [Google::Ads::GoogleAds::V3::Enums::MinuteOfHourEnum::MinuteOfHour]
          #     Minutes after the start hour at which this schedule starts.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          # @!attribute [rw] end_minute
          #   @return [Google::Ads::GoogleAds::V3::Enums::MinuteOfHourEnum::MinuteOfHour]
          #     Minutes after the end hour at which this schedule ends. The schedule is
          #     exclusive of the end minute.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          # @!attribute [rw] start_hour
          #   @return [Google::Protobuf::Int32Value]
          #     Starting hour in 24 hour time.
          #     This field must be between 0 and 23, inclusive.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          # @!attribute [rw] end_hour
          #   @return [Google::Protobuf::Int32Value]
          #     Ending hour in 24 hour time; 24 signifies end of the day.
          #     This field must be between 0 and 24, inclusive.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          # @!attribute [rw] day_of_week
          #   @return [Google::Ads::GoogleAds::V3::Enums::DayOfWeekEnum::DayOfWeek]
          #     Day of the week the schedule applies to.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          class AdScheduleInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # An age range criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::AgeRangeTypeEnum::AgeRangeType]
          #     Type of the age range.
          class AgeRangeInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A gender criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::GenderTypeEnum::GenderType]
          #     Type of the gender.
          class GenderInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # An income range criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::IncomeRangeTypeEnum::IncomeRangeType]
          #     Type of the income range.
          class IncomeRangeInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A parental status criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::ParentalStatusTypeEnum::ParentalStatusType]
          #     Type of the parental status.
          class ParentalStatusInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A YouTube Video criterion.
          # @!attribute [rw] video_id
          #   @return [Google::Protobuf::StringValue]
          #     YouTube video id as it appears on the YouTube watch page.
          class YouTubeVideoInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A YouTube Channel criterion.
          # @!attribute [rw] channel_id
          #   @return [Google::Protobuf::StringValue]
          #     The YouTube uploader channel id or the channel code of a YouTube channel.
          class YouTubeChannelInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A User List criterion. Represents a user list that is defined by the
          # advertiser to be targeted.
          # @!attribute [rw] user_list
          #   @return [Google::Protobuf::StringValue]
          #     The User List resource name.
          class UserListInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A Proximity criterion. The geo point and radius determine what geographical
          # area is included. The address is a description of the geo point that does
          # not affect ad serving.
          #
          # There are two ways to create a proximity. First, by setting an address
          # and radius. The geo point will be automatically computed. Second, by
          # setting a geo point and radius. The address is an optional label that won't
          # be validated.
          # @!attribute [rw] geo_point
          #   @return [Google::Ads::GoogleAds::V3::Common::GeoPointInfo]
          #     Latitude and longitude.
          # @!attribute [rw] radius
          #   @return [Google::Protobuf::DoubleValue]
          #     The radius of the proximity.
          # @!attribute [rw] radius_units
          #   @return [Google::Ads::GoogleAds::V3::Enums::ProximityRadiusUnitsEnum::ProximityRadiusUnits]
          #     The unit of measurement of the radius. Default is KILOMETERS.
          # @!attribute [rw] address
          #   @return [Google::Ads::GoogleAds::V3::Common::AddressInfo]
          #     Full address.
          class ProximityInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Geo point for proximity criterion.
          # @!attribute [rw] longitude_in_micro_degrees
          #   @return [Google::Protobuf::Int32Value]
          #     Micro degrees for the longitude.
          # @!attribute [rw] latitude_in_micro_degrees
          #   @return [Google::Protobuf::Int32Value]
          #     Micro degrees for the latitude.
          class GeoPointInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Address for proximity criterion.
          # @!attribute [rw] postal_code
          #   @return [Google::Protobuf::StringValue]
          #     Postal code.
          # @!attribute [rw] province_code
          #   @return [Google::Protobuf::StringValue]
          #     Province or state code.
          # @!attribute [rw] country_code
          #   @return [Google::Protobuf::StringValue]
          #     Country code.
          # @!attribute [rw] province_name
          #   @return [Google::Protobuf::StringValue]
          #     Province or state name.
          # @!attribute [rw] street_address
          #   @return [Google::Protobuf::StringValue]
          #     Street address line 1.
          # @!attribute [rw] street_address2
          #   @return [Google::Protobuf::StringValue]
          #     Street address line 2. This field is write-only. It is only used for
          #     calculating the longitude and latitude of an address when geo_point is
          #     empty.
          # @!attribute [rw] city_name
          #   @return [Google::Protobuf::StringValue]
          #     Name of the city.
          class AddressInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A topic criterion. Use topics to target or exclude placements in the
          # Google Display Network based on the category into which the placement falls
          # (for example, "Pets & Animals/Pets/Dogs").
          # @!attribute [rw] topic_constant
          #   @return [Google::Protobuf::StringValue]
          #     The Topic Constant resource name.
          # @!attribute [rw] path
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The category to target or exclude. Each subsequent element in the array
          #     describes a more specific sub-category. For example,
          #     "Pets & Animals", "Pets", "Dogs" represents the "Pets & Animals/Pets/Dogs"
          #     category.
          class TopicInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A language criterion.
          # @!attribute [rw] language_constant
          #   @return [Google::Protobuf::StringValue]
          #     The language constant resource name.
          class LanguageInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # An IpBlock criterion used for IP exclusions. We allow:
          #  - IPv4 and IPv6 addresses
          #  - individual addresses (192.168.0.1)
          #  - masks for individual addresses (192.168.0.1/32)
          #  - masks for Class C networks (192.168.0.1/24)
          # @!attribute [rw] ip_address
          #   @return [Google::Protobuf::StringValue]
          #     The IP address of this IP block.
          class IpBlockInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Content Label for category exclusion.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::ContentLabelTypeEnum::ContentLabelType]
          #     Content label type, required for CREATE operations.
          class ContentLabelInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Represents a Carrier Criterion.
          # @!attribute [rw] carrier_constant
          #   @return [Google::Protobuf::StringValue]
          #     The Carrier constant resource name.
          class CarrierInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Represents a particular interest-based topic to be targeted.
          # @!attribute [rw] user_interest_category
          #   @return [Google::Protobuf::StringValue]
          #     The UserInterest resource name.
          class UserInterestInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Represents a criterion for targeting webpages of an advertiser's website.
          # @!attribute [rw] criterion_name
          #   @return [Google::Protobuf::StringValue]
          #     The name of the criterion that is defined by this parameter. The name value
          #     will be used for identifying, sorting and filtering criteria with this type
          #     of parameters.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          # @!attribute [rw] conditions
          #   @return [Array<Google::Ads::GoogleAds::V3::Common::WebpageConditionInfo>]
          #     Conditions, or logical expressions, for webpage targeting. The list of
          #     webpage targeting conditions are and-ed together when evaluated
          #     for targeting.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          class WebpageInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Logical expression for targeting webpages of an advertiser's website.
          # @!attribute [rw] operand
          #   @return [Google::Ads::GoogleAds::V3::Enums::WebpageConditionOperandEnum::WebpageConditionOperand]
          #     Operand of webpage targeting condition.
          # @!attribute [rw] operator
          #   @return [Google::Ads::GoogleAds::V3::Enums::WebpageConditionOperatorEnum::WebpageConditionOperator]
          #     Operator of webpage targeting condition.
          # @!attribute [rw] argument
          #   @return [Google::Protobuf::StringValue]
          #     Argument of webpage targeting condition.
          class WebpageConditionInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Represents an operating system version to be targeted.
          # @!attribute [rw] operating_system_version_constant
          #   @return [Google::Protobuf::StringValue]
          #     The operating system version constant resource name.
          class OperatingSystemVersionInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # An app payment model criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::AppPaymentModelTypeEnum::AppPaymentModelType]
          #     Type of the app payment model.
          class AppPaymentModelInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A mobile device criterion.
          # @!attribute [rw] mobile_device_constant
          #   @return [Google::Protobuf::StringValue]
          #     The mobile device constant resource name.
          class MobileDeviceInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A custom affinity criterion.
          # A criterion of this type is only targetable.
          # @!attribute [rw] custom_affinity
          #   @return [Google::Protobuf::StringValue]
          #     The CustomInterest resource name.
          class CustomAffinityInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A custom intent criterion.
          # A criterion of this type is only targetable.
          # @!attribute [rw] custom_intent
          #   @return [Google::Protobuf::StringValue]
          #     The CustomInterest resource name.
          class CustomIntentInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A radius around a list of locations specified via a feed.
          # @!attribute [rw] feed
          #   @return [Google::Protobuf::StringValue]
          #     Feed specifying locations for targeting.
          #     This is required and must be set in CREATE operations.
          # @!attribute [rw] geo_target_constants
          #   @return [Array<Google::Protobuf::StringValue>]
          #     Geo target constant(s) restricting the scope of the geographic area within
          #     the feed. Currently only one geo target constant is allowed.
          # @!attribute [rw] radius
          #   @return [Google::Protobuf::Int64Value]
          #     Distance in units specifying the radius around targeted locations.
          #     This is required and must be set in CREATE operations.
          # @!attribute [rw] radius_units
          #   @return [Google::Ads::GoogleAds::V3::Enums::LocationGroupRadiusUnitsEnum::LocationGroupRadiusUnits]
          #     Unit of the radius, miles and meters supported currently.
          #     This is required and must be set in CREATE operations.
          class LocationGroupInfo
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
