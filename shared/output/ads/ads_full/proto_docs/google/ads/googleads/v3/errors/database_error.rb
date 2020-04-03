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
          # Container for enum describing possible database errors.
          class DatabaseErrorEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible database errors.
            module DatabaseError
              # Enum unspecified.
              UNSPECIFIED = 0

              # The received error code is not known in this version.
              UNKNOWN = 1

              # Multiple requests were attempting to modify the same resource at once.
              # Please retry the request.
              CONCURRENT_MODIFICATION = 2

              # The request conflicted with existing data. This error will usually be
              # replaced with a more specific error if the request is retried.
              DATA_CONSTRAINT_VIOLATION = 3

              # The data written is too large. Please split the request into smaller
              # requests.
              REQUEST_TOO_LARGE = 4
            end
          end
        end
      end
    end
  end
end
