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
          # Container for enum describing possible policy topic evidence destination not
          # working DNS error types.
          class PolicyTopicEvidenceDestinationNotWorkingDnsErrorTypeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # The possible policy topic evidence destination not working DNS error types.
            module PolicyTopicEvidenceDestinationNotWorkingDnsErrorType
              # No value has been specified.
              UNSPECIFIED = 0

              # The received value is not known in this version.
              #
              # This is a response-only value.
              UNKNOWN = 1

              # Host name not found in DNS when fetching landing page.
              HOSTNAME_NOT_FOUND = 2

              # Google internal crawler issue when communicating with DNS. This error
              # doesn't mean the landing page doesn't work. Google will recrawl the
              # landing page.
              GOOGLE_CRAWLER_DNS_ISSUE = 3
            end
          end
        end
      end
    end
  end
end
