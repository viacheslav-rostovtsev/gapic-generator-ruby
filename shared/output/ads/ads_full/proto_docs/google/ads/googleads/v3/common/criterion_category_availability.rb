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
          # Information of category availability, per advertising channel.
          # @!attribute [rw] channel
          #   @return [Google::Ads::GoogleAds::V3::Common::CriterionCategoryChannelAvailability]
          #     Channel types and subtypes that are available to the category.
          # @!attribute [rw] locale
          #   @return [Array<Google::Ads::GoogleAds::V3::Common::CriterionCategoryLocaleAvailability>]
          #     Locales that are available to the category for the channel.
          class CriterionCategoryAvailability
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Information of advertising channel type and subtypes a category is available
          # in.
          # @!attribute [rw] availability_mode
          #   @return [Google::Ads::GoogleAds::V3::Enums::CriterionCategoryChannelAvailabilityModeEnum::CriterionCategoryChannelAvailabilityMode]
          #     Format of the channel availability. Can be ALL_CHANNELS (the rest of the
          #     fields will not be set), CHANNEL_TYPE (only advertising_channel_type type
          #     will be set, the category is available to all sub types under it) or
          #     CHANNEL_TYPE_AND_SUBTYPES (advertising_channel_type,
          #     advertising_channel_sub_type, and include_default_channel_sub_type will all
          #     be set).
          # @!attribute [rw] advertising_channel_type
          #   @return [Google::Ads::GoogleAds::V3::Enums::AdvertisingChannelTypeEnum::AdvertisingChannelType]
          #     Channel type the category is available to.
          # @!attribute [rw] advertising_channel_sub_type
          #   @return [Array<Google::Ads::GoogleAds::V3::Enums::AdvertisingChannelSubTypeEnum::AdvertisingChannelSubType>]
          #     Channel subtypes under the channel type the category is available to.
          # @!attribute [rw] include_default_channel_sub_type
          #   @return [Google::Protobuf::BoolValue]
          #     Whether default channel sub type is included. For example,
          #     advertising_channel_type being DISPLAY and include_default_channel_sub_type
          #     being false means that the default display campaign where channel sub type
          #     is not set is not included in this availability configuration.
          class CriterionCategoryChannelAvailability
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Information about which locales a category is available in.
          # @!attribute [rw] availability_mode
          #   @return [Google::Ads::GoogleAds::V3::Enums::CriterionCategoryLocaleAvailabilityModeEnum::CriterionCategoryLocaleAvailabilityMode]
          #     Format of the locale availability. Can be LAUNCHED_TO_ALL (both country and
          #     language will be empty), COUNTRY (only country will be set), LANGUAGE (only
          #     language wil be set), COUNTRY_AND_LANGUAGE (both country and language will
          #     be set).
          # @!attribute [rw] country_code
          #   @return [Google::Protobuf::StringValue]
          #     Code of the country.
          # @!attribute [rw] language_code
          #   @return [Google::Protobuf::StringValue]
          #     Code of the language.
          class CriterionCategoryLocaleAvailability
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
