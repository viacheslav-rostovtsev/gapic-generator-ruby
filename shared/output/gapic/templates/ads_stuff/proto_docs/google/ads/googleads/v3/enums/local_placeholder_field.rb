# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Ads
    module GoogleAds
      module V3
        module Enums
          # Values for Local placeholder fields.
          # For more information about dynamic remarketing feeds, see
          # https://support.google.com/google-ads/answer/6053288.
          class LocalPlaceholderFieldEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Possible values for Local placeholder fields.
            module LocalPlaceholderField
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Data Type: STRING. Required. Unique ID.
              DEAL_ID = 2

              # Data Type: STRING. Required. Main headline with local deal title to be
              # shown in dynamic ad.
              DEAL_NAME = 3

              # Data Type: STRING. Local deal subtitle to be shown in dynamic ad.
              SUBTITLE = 4

              # Data Type: STRING. Description of local deal to be shown in dynamic ad.
              DESCRIPTION = 5

              # Data Type: STRING. Price to be shown in the ad. Highly recommended for
              # dynamic ads. Example: "100.00 USD"
              PRICE = 6

              # Data Type: STRING. Formatted price to be shown in the ad.
              # Example: "Starting at $100.00 USD", "$80 - $100"
              FORMATTED_PRICE = 7

              # Data Type: STRING. Sale price to be shown in the ad.
              # Example: "80.00 USD"
              SALE_PRICE = 8

              # Data Type: STRING. Formatted sale price to be shown in the ad.
              # Example: "On sale for $80.00", "$60 - $80"
              FORMATTED_SALE_PRICE = 9

              # Data Type: URL. Image to be displayed in the ad.
              IMAGE_URL = 10

              # Data Type: STRING. Complete property address, including postal code.
              ADDRESS = 11

              # Data Type: STRING. Category of local deal used to group like items
              # together for recommendation engine.
              CATEGORY = 12

              # Data Type: STRING_LIST. Keywords used for product retrieval.
              CONTEXTUAL_KEYWORDS = 13

              # Data Type: URL_LIST. Required. Final URLs to be used in ad when using
              # Upgraded URLs; the more specific the better (e.g. the individual URL of a
              # specific local deal and its location).
              FINAL_URLS = 14

              # Data Type: URL_LIST. Final mobile URLs for the ad when using Upgraded
              # URLs.
              FINAL_MOBILE_URLS = 15

              # Data Type: URL. Tracking template for the ad when using Upgraded URLs.
              TRACKING_URL = 16

              # Data Type: STRING. Android app link. Must be formatted as:
              # android-app://\\{package_id}/\\{scheme}/\\{host_path}.
              # The components are defined as follows:
              # package_id: app ID as specified in Google Play.
              # scheme: the scheme to pass to the application. Can be HTTP, or a custom
              #   scheme.
              # host_path: identifies the specific content within your application.
              ANDROID_APP_LINK = 17

              # Data Type: STRING_LIST. List of recommended local deal IDs to show
              # together with this item.
              SIMILAR_DEAL_IDS = 18

              # Data Type: STRING. iOS app link.
              IOS_APP_LINK = 19

              # Data Type: INT64. iOS app store ID.
              IOS_APP_STORE_ID = 20
            end
          end
        end
      end
    end
  end
end
