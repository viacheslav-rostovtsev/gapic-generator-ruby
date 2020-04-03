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
          # Container for enum describing possible policy topic entry types.
          class PolicyTopicEntryTypeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # The possible policy topic entry types.
            module PolicyTopicEntryType
              # No value has been specified.
              UNSPECIFIED = 0

              # The received value is not known in this version.
              #
              # This is a response-only value.
              UNKNOWN = 1

              # The resource will not be served.
              PROHIBITED = 2

              # The resource will not be served under some circumstances.
              LIMITED = 4

              # The resource cannot serve at all because of the current targeting
              # criteria.
              FULLY_LIMITED = 8

              # May be of interest, but does not limit how the resource is served.
              DESCRIPTIVE = 5

              # Could increase coverage beyond normal.
              BROADENING = 6

              # Constrained for all targeted countries, but may serve in other countries
              # through area of interest.
              AREA_OF_INTEREST_ONLY = 7
            end
          end
        end
      end
    end
  end
end
