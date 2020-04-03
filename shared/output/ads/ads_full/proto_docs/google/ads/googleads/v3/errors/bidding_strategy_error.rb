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
          # Container for enum describing possible bidding strategy errors.
          class BiddingStrategyErrorEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible bidding strategy errors.
            module BiddingStrategyError
              # Enum unspecified.
              UNSPECIFIED = 0

              # The received error code is not known in this version.
              UNKNOWN = 1

              # Each bidding strategy must have a unique name.
              DUPLICATE_NAME = 2

              # Bidding strategy type is immutable.
              CANNOT_CHANGE_BIDDING_STRATEGY_TYPE = 3

              # Only bidding strategies not linked to campaigns, adgroups or adgroup
              # criteria can be removed.
              CANNOT_REMOVE_ASSOCIATED_STRATEGY = 4

              # The specified bidding strategy is not supported.
              BIDDING_STRATEGY_NOT_SUPPORTED = 5

              # The bidding strategy is incompatible with the campaign's bidding
              # strategy goal type.
              INCOMPATIBLE_BIDDING_STRATEGY_AND_BIDDING_STRATEGY_GOAL_TYPE = 6
            end
          end
        end
      end
    end
  end
end
