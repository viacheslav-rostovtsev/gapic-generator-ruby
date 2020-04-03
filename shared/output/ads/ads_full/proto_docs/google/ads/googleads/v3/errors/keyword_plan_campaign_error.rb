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
          # Container for enum describing possible errors from applying a keyword plan
          # campaign.
          class KeywordPlanCampaignErrorEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible errors from applying a keyword plan campaign.
            module KeywordPlanCampaignError
              # Enum unspecified.
              UNSPECIFIED = 0

              # The received error code is not known in this version.
              UNKNOWN = 1

              # A keyword plan campaign name is missing, empty, longer than allowed limit
              # or contains invalid chars.
              INVALID_NAME = 2

              # A keyword plan campaign contains one or more untargetable languages.
              INVALID_LANGUAGES = 3

              # A keyword plan campaign contains one or more invalid geo targets.
              INVALID_GEOS = 4

              # The keyword plan campaign name is duplicate to an existing keyword plan
              # campaign name or other keyword plan campaign name in the request.
              DUPLICATE_NAME = 5

              # The number of geo targets in the keyword plan campaign exceeds limits.
              MAX_GEOS_EXCEEDED = 6
            end
          end
        end
      end
    end
  end
end
