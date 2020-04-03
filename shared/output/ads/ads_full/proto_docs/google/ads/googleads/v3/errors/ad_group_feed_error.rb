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
        module Errors
          # Container for enum describing possible ad group feed errors.
          class AdGroupFeedErrorEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible ad group feed errors.
            module AdGroupFeedError
              # Enum unspecified.
              UNSPECIFIED = 0

              # The received error code is not known in this version.
              UNKNOWN = 1

              # An active feed already exists for this ad group and place holder type.
              FEED_ALREADY_EXISTS_FOR_PLACEHOLDER_TYPE = 2

              # The specified feed is removed.
              CANNOT_CREATE_FOR_REMOVED_FEED = 3

              # The AdGroupFeed already exists. UPDATE operation should be used to modify
              # the existing AdGroupFeed.
              ADGROUP_FEED_ALREADY_EXISTS = 4

              # Cannot operate on removed AdGroupFeed.
              CANNOT_OPERATE_ON_REMOVED_ADGROUP_FEED = 5

              # Invalid placeholder type.
              INVALID_PLACEHOLDER_TYPE = 6

              # Feed mapping for this placeholder type does not exist.
              MISSING_FEEDMAPPING_FOR_PLACEHOLDER_TYPE = 7

              # Location AdGroupFeeds cannot be created unless there is a location
              # CustomerFeed for the specified feed.
              NO_EXISTING_LOCATION_CUSTOMER_FEED = 8
            end
          end
        end
      end
    end
  end
end
