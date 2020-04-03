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
          # Describes the status of returned resource.
          # @!attribute [r] resource_name
          #   @return [String]
          #     Output only. The resource name of the change status.
          #     Change status resource names have the form:
          #
          #     `customers/{customer_id}/changeStatus/{change_status_id}`
          # @!attribute [r] last_change_date_time
          #   @return [Google::Protobuf::StringValue]
          #     Output only. Time at which the most recent change has occurred on this resource.
          # @!attribute [r] resource_type
          #   @return [Google::Ads::GoogleAds::V3::Enums::ChangeStatusResourceTypeEnum::ChangeStatusResourceType]
          #     Output only. Represents the type of the changed resource. This dictates what fields
          #     will be set. For example, for AD_GROUP, campaign and ad_group fields will
          #     be set.
          # @!attribute [r] campaign
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The Campaign affected by this change.
          # @!attribute [r] ad_group
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The AdGroup affected by this change.
          # @!attribute [r] resource_status
          #   @return [Google::Ads::GoogleAds::V3::Enums::ChangeStatusOperationEnum::ChangeStatusOperation]
          #     Output only. Represents the status of the changed resource.
          # @!attribute [r] ad_group_ad
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The AdGroupAd affected by this change.
          # @!attribute [r] ad_group_criterion
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The AdGroupCriterion affected by this change.
          # @!attribute [r] campaign_criterion
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The CampaignCriterion affected by this change.
          # @!attribute [r] feed
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The Feed affected by this change.
          # @!attribute [r] feed_item
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The FeedItem affected by this change.
          # @!attribute [r] ad_group_feed
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The AdGroupFeed affected by this change.
          # @!attribute [r] campaign_feed
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The CampaignFeed affected by this change.
          # @!attribute [r] ad_group_bid_modifier
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The AdGroupBidModifier affected by this change.
          class ChangeStatus
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
