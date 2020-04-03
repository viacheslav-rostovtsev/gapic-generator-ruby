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
          # Describes channel availability mode for a criterion availability - whether
          # the availability is meant to include all advertising channels, or a
          # particular channel with all its channel subtypes, or a channel with a certain
          # subset of channel subtypes.
          class CriterionCategoryChannelAvailabilityModeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum containing the possible CriterionCategoryChannelAvailabilityMode.
            module CriterionCategoryChannelAvailabilityMode
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # The category is available to campaigns of all channel types and subtypes.
              ALL_CHANNELS = 2

              # The category is available to campaigns of a specific channel type,
              # including all subtypes under it.
              CHANNEL_TYPE_AND_ALL_SUBTYPES = 3

              # The category is available to campaigns of a specific channel type and
              # subtype(s).
              CHANNEL_TYPE_AND_SUBSET_SUBTYPES = 4
            end
          end
        end
      end
    end
  end
end
