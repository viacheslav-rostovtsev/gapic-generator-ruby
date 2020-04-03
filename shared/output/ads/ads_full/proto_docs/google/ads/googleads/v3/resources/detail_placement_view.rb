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
          # A view with metrics aggregated by ad group and URL or YouTube video.
          # @!attribute [r] resource_name
          #   @return [String]
          #     Output only. The resource name of the detail placement view.
          #     Detail placement view resource names have the form:
          #
          #     `customers/{customer_id}/detailPlacementViews/{ad_group_id}~{base64_placement}`
          # @!attribute [r] placement
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The automatic placement string at detail level, e. g. website URL, mobile
          #     application ID, or a YouTube video ID.
          # @!attribute [r] display_name
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The display name is URL name for websites, YouTube video name for YouTube
          #     videos, and translated mobile app name for mobile apps.
          # @!attribute [r] group_placement_target_url
          #   @return [Google::Protobuf::StringValue]
          #     Output only. URL of the group placement, e.g. domain, link to the mobile application in
          #     app store, or a YouTube channel URL.
          # @!attribute [r] target_url
          #   @return [Google::Protobuf::StringValue]
          #     Output only. URL of the placement, e.g. website, link to the mobile application in app
          #     store, or a YouTube video URL.
          # @!attribute [r] placement_type
          #   @return [Google::Ads::GoogleAds::V3::Enums::PlacementTypeEnum::PlacementType]
          #     Output only. Type of the placement, e.g. Website, YouTube Video, and Mobile Application.
          class DetailPlacementView
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
