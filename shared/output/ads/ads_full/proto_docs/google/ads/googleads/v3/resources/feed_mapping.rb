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
        module Resources
          # A feed mapping.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Immutable. The resource name of the feed mapping.
          #     Feed mapping resource names have the form:
          #
          #     `customers/{customer_id}/feedMappings/{feed_id}~{feed_mapping_id}`
          # @!attribute [rw] feed
          #   @return [Google::Protobuf::StringValue]
          #     Immutable. The feed of this feed mapping.
          # @!attribute [rw] attribute_field_mappings
          #   @return [Array<Google::Ads::GoogleAds::V3::Resources::AttributeFieldMapping>]
          #     Immutable. Feed attributes to field mappings. These mappings are a one-to-many
          #     relationship meaning that 1 feed attribute can be used to populate
          #     multiple placeholder fields, but 1 placeholder field can only draw
          #     data from 1 feed attribute. Ad Customizer is an exception, 1 placeholder
          #     field can be mapped to multiple feed attributes. Required.
          # @!attribute [r] status
          #   @return [Google::Ads::GoogleAds::V3::Enums::FeedMappingStatusEnum::FeedMappingStatus]
          #     Output only. Status of the feed mapping.
          #     This field is read-only.
          # @!attribute [rw] placeholder_type
          #   @return [Google::Ads::GoogleAds::V3::Enums::PlaceholderTypeEnum::PlaceholderType]
          #     Immutable. The placeholder type of this mapping (i.e., if the mapping maps feed
          #     attributes to placeholder fields).
          # @!attribute [rw] criterion_type
          #   @return [Google::Ads::GoogleAds::V3::Enums::FeedMappingCriterionTypeEnum::FeedMappingCriterionType]
          #     Immutable. The criterion type of this mapping (i.e., if the mapping maps feed
          #     attributes to criterion fields).
          class FeedMapping
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Maps from feed attribute id to a placeholder or criterion field id.
          # @!attribute [rw] feed_attribute_id
          #   @return [Google::Protobuf::Int64Value]
          #     Immutable. Feed attribute from which to map.
          # @!attribute [r] field_id
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. The placeholder field ID. If a placeholder field enum is not published in
          #     the current API version, then this field will be populated and the field
          #     oneof will be empty.
          #     This field is read-only.
          # @!attribute [rw] sitelink_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::SitelinkPlaceholderFieldEnum::SitelinkPlaceholderField]
          #     Immutable. Sitelink Placeholder Fields.
          # @!attribute [rw] call_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::CallPlaceholderFieldEnum::CallPlaceholderField]
          #     Immutable. Call Placeholder Fields.
          # @!attribute [rw] app_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::AppPlaceholderFieldEnum::AppPlaceholderField]
          #     Immutable. App Placeholder Fields.
          # @!attribute [r] location_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::LocationPlaceholderFieldEnum::LocationPlaceholderField]
          #     Output only. Location Placeholder Fields. This field is read-only.
          # @!attribute [r] affiliate_location_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::AffiliateLocationPlaceholderFieldEnum::AffiliateLocationPlaceholderField]
          #     Output only. Affiliate Location Placeholder Fields. This field is read-only.
          # @!attribute [rw] callout_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::CalloutPlaceholderFieldEnum::CalloutPlaceholderField]
          #     Immutable. Callout Placeholder Fields.
          # @!attribute [rw] structured_snippet_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::StructuredSnippetPlaceholderFieldEnum::StructuredSnippetPlaceholderField]
          #     Immutable. Structured Snippet Placeholder Fields.
          # @!attribute [rw] message_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::MessagePlaceholderFieldEnum::MessagePlaceholderField]
          #     Immutable. Message Placeholder Fields.
          # @!attribute [rw] price_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::PricePlaceholderFieldEnum::PricePlaceholderField]
          #     Immutable. Price Placeholder Fields.
          # @!attribute [rw] promotion_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::PromotionPlaceholderFieldEnum::PromotionPlaceholderField]
          #     Immutable. Promotion Placeholder Fields.
          # @!attribute [rw] ad_customizer_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::AdCustomizerPlaceholderFieldEnum::AdCustomizerPlaceholderField]
          #     Immutable. Ad Customizer Placeholder Fields
          # @!attribute [rw] dsa_page_feed_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::DsaPageFeedCriterionFieldEnum::DsaPageFeedCriterionField]
          #     Immutable. Dynamic Search Ad Page Feed Fields.
          # @!attribute [rw] location_extension_targeting_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::LocationExtensionTargetingCriterionFieldEnum::LocationExtensionTargetingCriterionField]
          #     Immutable. Location Target Fields.
          # @!attribute [rw] education_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::EducationPlaceholderFieldEnum::EducationPlaceholderField]
          #     Immutable. Education Placeholder Fields
          # @!attribute [rw] flight_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::FlightPlaceholderFieldEnum::FlightPlaceholderField]
          #     Immutable. Flight Placeholder Fields
          # @!attribute [rw] custom_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::CustomPlaceholderFieldEnum::CustomPlaceholderField]
          #     Immutable. Custom Placeholder Fields
          # @!attribute [rw] hotel_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::HotelPlaceholderFieldEnum::HotelPlaceholderField]
          #     Immutable. Hotel Placeholder Fields
          # @!attribute [rw] real_estate_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::RealEstatePlaceholderFieldEnum::RealEstatePlaceholderField]
          #     Immutable. Real Estate Placeholder Fields
          # @!attribute [rw] travel_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::TravelPlaceholderFieldEnum::TravelPlaceholderField]
          #     Immutable. Travel Placeholder Fields
          # @!attribute [rw] local_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::LocalPlaceholderFieldEnum::LocalPlaceholderField]
          #     Immutable. Local Placeholder Fields
          # @!attribute [rw] job_field
          #   @return [Google::Ads::GoogleAds::V3::Enums::JobPlaceholderFieldEnum::JobPlaceholderField]
          #     Immutable. Job Placeholder Fields
          class AttributeFieldMapping
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
