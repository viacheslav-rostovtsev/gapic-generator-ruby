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
          # Container for enum describing possible feed item target errors.
          class FeedItemTargetErrorEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible feed item target errors.
            module FeedItemTargetError
              # Enum unspecified.
              UNSPECIFIED = 0

              # The received error code is not known in this version.
              UNKNOWN = 1

              # On CREATE, the FeedItemTarget must have a populated field in the oneof
              # target.
              MUST_SET_TARGET_ONEOF_ON_CREATE = 2

              # The specified feed item target already exists, so it cannot be added.
              FEED_ITEM_TARGET_ALREADY_EXISTS = 3

              # The schedules for a given feed item cannot overlap.
              FEED_ITEM_SCHEDULES_CANNOT_OVERLAP = 4

              # Too many targets of a given type were added for a single feed item.
              TARGET_LIMIT_EXCEEDED_FOR_GIVEN_TYPE = 5

              # Too many AdSchedules are enabled for the feed item for the given day.
              TOO_MANY_SCHEDULES_PER_DAY = 6

              # A feed item may either have an enabled campaign target or an enabled ad
              # group target.
              CANNOT_HAVE_ENABLED_CAMPAIGN_AND_ENABLED_AD_GROUP_TARGETS = 7

              # Duplicate ad schedules aren't allowed.
              DUPLICATE_AD_SCHEDULE = 8

              # Duplicate keywords aren't allowed.
              DUPLICATE_KEYWORD = 9
            end
          end
        end
      end
    end
  end
end
