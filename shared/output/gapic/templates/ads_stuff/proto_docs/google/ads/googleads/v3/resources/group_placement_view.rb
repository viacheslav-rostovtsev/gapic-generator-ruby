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
        module Resources
          # A group placement view.
          # @!attribute [r] resource_name
          #   @return [String]
          #     Output only. The resource name of the group placement view.
          #     Group placement view resource names have the form:
          #
          #     `customers/{customer_id}/groupPlacementViews/{ad_group_id}~{base64_placement}`
          # @!attribute [r] placement
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The automatic placement string at group level, e. g. web domain, mobile
          #     app ID, or a YouTube channel ID.
          # @!attribute [r] display_name
          #   @return [Google::Protobuf::StringValue]
          #     Output only. Domain name for websites and YouTube channel name for YouTube channels.
          # @!attribute [r] target_url
          #   @return [Google::Protobuf::StringValue]
          #     Output only. URL of the group placement, e.g. domain, link to the mobile application in
          #     app store, or a YouTube channel URL.
          # @!attribute [r] placement_type
          #   @return [Google::Ads::GoogleAds::V3::Enums::PlacementTypeEnum::PlacementType]
          #     Output only. Type of the placement, e.g. Website, YouTube Channel, Mobile Application.
          class GroupPlacementView
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
