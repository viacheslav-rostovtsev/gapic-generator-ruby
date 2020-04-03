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
          # Container for enum describing content label types in ContentLabel.
          class ContentLabelTypeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum listing the content label types supported by ContentLabel criterion.
            module ContentLabelType
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Sexually suggestive content.
              SEXUALLY_SUGGESTIVE = 2

              # Below the fold placement.
              BELOW_THE_FOLD = 3

              # Parked domain.
              PARKED_DOMAIN = 4

              # Juvenile, gross & bizarre content.
              JUVENILE = 6

              # Profanity & rough language.
              PROFANITY = 7

              # Death & tragedy.
              TRAGEDY = 8

              # Video.
              VIDEO = 9

              # Content rating: G.
              VIDEO_RATING_DV_G = 10

              # Content rating: PG.
              VIDEO_RATING_DV_PG = 11

              # Content rating: T.
              VIDEO_RATING_DV_T = 12

              # Content rating: MA.
              VIDEO_RATING_DV_MA = 13

              # Content rating: not yet rated.
              VIDEO_NOT_YET_RATED = 14

              # Embedded video.
              EMBEDDED_VIDEO = 15

              # Live streaming video.
              LIVE_STREAMING_VIDEO = 16

              # Sensitive social issues.
              SOCIAL_ISSUES = 17
            end
          end
        end
      end
    end
  end
end
