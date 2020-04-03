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
          # Container for enum describing possible types of an ad.
          class AdTypeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # The possible types of an ad.
            module AdType
              # No value has been specified.
              UNSPECIFIED = 0

              # The received value is not known in this version.
              #
              # This is a response-only value.
              UNKNOWN = 1

              # The ad is a text ad.
              TEXT_AD = 2

              # The ad is an expanded text ad.
              EXPANDED_TEXT_AD = 3

              # The ad is a call only ad.
              CALL_ONLY_AD = 6

              # The ad is an expanded dynamic search ad.
              EXPANDED_DYNAMIC_SEARCH_AD = 7

              # The ad is a hotel ad.
              HOTEL_AD = 8

              # The ad is a Smart Shopping ad.
              SHOPPING_SMART_AD = 9

              # The ad is a standard Shopping ad.
              SHOPPING_PRODUCT_AD = 10

              # The ad is a video ad.
              VIDEO_AD = 12

              # This ad is a Gmail ad.
              GMAIL_AD = 13

              # This ad is an Image ad.
              IMAGE_AD = 14

              # The ad is a responsive search ad.
              RESPONSIVE_SEARCH_AD = 15

              # The ad is a legacy responsive display ad.
              LEGACY_RESPONSIVE_DISPLAY_AD = 16

              # The ad is an app ad.
              APP_AD = 17

              # The ad is a legacy app install ad.
              LEGACY_APP_INSTALL_AD = 18

              # The ad is a responsive display ad.
              RESPONSIVE_DISPLAY_AD = 19

              # The ad is a display upload ad with the HTML5_UPLOAD_AD product type.
              HTML5_UPLOAD_AD = 21

              # The ad is a display upload ad with one of the DYNAMIC_HTML5_* product
              # types.
              DYNAMIC_HTML5_AD = 22

              # The ad is an app engagement ad.
              APP_ENGAGEMENT_AD = 23

              # The ad is a Shopping Comparison Listing ad.
              SHOPPING_COMPARISON_LISTING_AD = 24
            end
          end
        end
      end
    end
  end
end
