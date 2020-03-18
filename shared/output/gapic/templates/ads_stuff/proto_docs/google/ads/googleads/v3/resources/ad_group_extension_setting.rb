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
          # An ad group extension setting.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Immutable. The resource name of the ad group extension setting.
          #     AdGroupExtensionSetting resource names have the form:
          #
          #     `customers/{customer_id}/adGroupExtensionSettings/{ad_group_id}~{extension_type}`
          # @!attribute [rw] extension_type
          #   @return [Google::Ads::GoogleAds::V3::Enums::ExtensionTypeEnum::ExtensionType]
          #     Immutable. The extension type of the ad group extension setting.
          # @!attribute [rw] ad_group
          #   @return [Google::Protobuf::StringValue]
          #     Immutable. The resource name of the ad group. The linked extension feed items will
          #     serve under this ad group.
          #     AdGroup resource names have the form:
          #
          #     `customers/{customer_id}/adGroups/{ad_group_id}`
          # @!attribute [rw] extension_feed_items
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The resource names of the extension feed items to serve under the ad group.
          #     ExtensionFeedItem resource names have the form:
          #
          #     `customers/{customer_id}/extensionFeedItems/{feed_item_id}`
          # @!attribute [rw] device
          #   @return [Google::Ads::GoogleAds::V3::Enums::ExtensionSettingDeviceEnum::ExtensionSettingDevice]
          #     The device for which the extensions will serve. Optional.
          class AdGroupExtensionSetting
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
