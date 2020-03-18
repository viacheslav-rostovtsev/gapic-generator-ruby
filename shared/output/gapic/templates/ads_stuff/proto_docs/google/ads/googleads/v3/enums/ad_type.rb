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
