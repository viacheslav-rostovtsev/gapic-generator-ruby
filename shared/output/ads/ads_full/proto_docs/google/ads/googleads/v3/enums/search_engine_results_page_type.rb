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
          # The type of the search engine results page.
          class SearchEngineResultsPageTypeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # The type of the search engine results page.
            module SearchEngineResultsPageType
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Only ads were contained in the search engine results page.
              ADS_ONLY = 2

              # Only organic results were contained in the search engine results page.
              ORGANIC_ONLY = 3

              # Both ads and organic results were contained in the search engine results
              # page.
              ADS_AND_ORGANIC = 4
            end
          end
        end
      end
    end
  end
end
