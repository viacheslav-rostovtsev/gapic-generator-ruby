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
          # Values for Travel placeholder fields.
          # For more information about dynamic remarketing feeds, see
          # https://support.google.com/google-ads/answer/6053288.
          class TravelPlaceholderFieldEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Possible values for Travel placeholder fields.
            module TravelPlaceholderField
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Data Type: STRING. Required. Destination id. Example: PAR, LON.
              # For feed items that only have destination id, destination id must be a
              # unique key. For feed items that have both destination id and origin id,
              # then the combination must be a unique key.
              DESTINATION_ID = 2

              # Data Type: STRING. Origin id. Example: PAR, LON.
              # Combination of DESTINATION_ID and ORIGIN_ID must be
              # unique per offer.
              ORIGIN_ID = 3

              # Data Type: STRING. Required. Main headline with name to be shown in
              # dynamic ad.
              TITLE = 4

              # Data Type: STRING. The destination name. Shorter names are recommended.
              DESTINATION_NAME = 5

              # Data Type: STRING. Origin name. Shorter names are recommended.
              ORIGIN_NAME = 6

              # Data Type: STRING. Price to be shown in the ad. Highly recommended for
              # dynamic ads.
              # Example: "100.00 USD"
              PRICE = 7

              # Data Type: STRING. Formatted price to be shown in the ad.
              # Example: "Starting at $100.00 USD", "$80 - $100"
              FORMATTED_PRICE = 8

              # Data Type: STRING. Sale price to be shown in the ad.
              # Example: "80.00 USD"
              SALE_PRICE = 9

              # Data Type: STRING. Formatted sale price to be shown in the ad.
              # Example: "On sale for $80.00", "$60 - $80"
              FORMATTED_SALE_PRICE = 10

              # Data Type: URL. Image to be displayed in the ad.
              IMAGE_URL = 11

              # Data Type: STRING. Category of travel offer used to group like items
              # together for recommendation engine.
              CATEGORY = 12

              # Data Type: STRING_LIST. Keywords used for product retrieval.
              CONTEXTUAL_KEYWORDS = 13

              # Data Type: STRING. Address of travel offer, including postal code.
              DESTINATION_ADDRESS = 14

              # Data Type: URL_LIST. Required. Final URLs to be used in ad, when using
              # Upgraded URLs; the more specific the better (e.g. the individual URL of a
              # specific travel offer and its location).
              FINAL_URL = 15

              # Data Type: URL_LIST. Final mobile URLs for the ad when using Upgraded
              # URLs.
              FINAL_MOBILE_URLS = 16

              # Data Type: URL. Tracking template for the ad when using Upgraded URLs.
              TRACKING_URL = 17

              # Data Type: STRING. Android app link. Must be formatted as:
              # android-app://\\{package_id}/\\{scheme}/\\{host_path}.
              # The components are defined as follows:
              # package_id: app ID as specified in Google Play.
              # scheme: the scheme to pass to the application. Can be HTTP, or a custom
              #   scheme.
              # host_path: identifies the specific content within your application.
              ANDROID_APP_LINK = 18

              # Data Type: STRING_LIST. List of recommended destination IDs to show
              # together with this item.
              SIMILAR_DESTINATION_IDS = 19

              # Data Type: STRING. iOS app link.
              IOS_APP_LINK = 20

              # Data Type: INT64. iOS app store ID.
              IOS_APP_STORE_ID = 21
            end
          end
        end
      end
    end
  end
end
