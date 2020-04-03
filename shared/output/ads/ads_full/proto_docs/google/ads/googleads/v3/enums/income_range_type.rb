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
          # Container for enum describing the type of demographic income ranges.
          class IncomeRangeTypeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # The type of demographic income ranges (e.g. between 0% to 50%).
            module IncomeRangeType
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # 0%-50%.
              INCOME_RANGE_0_50 = 510001

              # 50% to 60%.
              INCOME_RANGE_50_60 = 510002

              # 60% to 70%.
              INCOME_RANGE_60_70 = 510003

              # 70% to 80%.
              INCOME_RANGE_70_80 = 510004

              # 80% to 90%.
              INCOME_RANGE_80_90 = 510005

              # Greater than 90%.
              INCOME_RANGE_90_UP = 510006

              # Undetermined income range.
              INCOME_RANGE_UNDETERMINED = 510000
            end
          end
        end
      end
    end
  end
end
