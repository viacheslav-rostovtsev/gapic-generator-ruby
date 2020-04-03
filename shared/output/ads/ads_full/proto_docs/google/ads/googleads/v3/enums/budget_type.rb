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
        module Enums
          # Describes Budget types.
          class BudgetTypeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Possible Budget types.
            module BudgetType
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Budget type for standard Google Ads usage.
              # Caps daily spend at two times the specified budget amount.
              # Full details: https://support.google.com/google-ads/answer/6385083
              STANDARD = 2

              # Budget type for Hotels Ads commission program.
              # Full details: https://support.google.com/google-ads/answer/9243945
              #
              # This type is only supported by campaigns with
              # AdvertisingChannelType.HOTEL, BiddingStrategyType.COMMISSION and
              # PaymentMode.CONVERSION_VALUE.
              HOTEL_ADS_COMMISSION = 3

              # Budget type with a fixed cost-per-acquisition (conversion).
              # Full details: https://support.google.com/google-ads/answer/7528254
              #
              # This type is only supported by campaigns with
              # AdvertisingChannelType.DISPLAY (excluding
              # AdvertisingChannelSubType.DISPLAY_GMAIL),
              # BiddingStrategyType.TARGET_CPA and PaymentMode.CONVERSIONS.
              FIXED_CPA = 4
            end
          end
        end
      end
    end
  end
end
