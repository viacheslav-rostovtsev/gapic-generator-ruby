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
          # Values for Affiliate Location placeholder fields.
          class AffiliateLocationPlaceholderFieldEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Possible values for Affiliate Location placeholder fields.
            module AffiliateLocationPlaceholderField
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Data Type: STRING. The name of the business.
              BUSINESS_NAME = 2

              # Data Type: STRING. Line 1 of the business address.
              ADDRESS_LINE_1 = 3

              # Data Type: STRING. Line 2 of the business address.
              ADDRESS_LINE_2 = 4

              # Data Type: STRING. City of the business address.
              CITY = 5

              # Data Type: STRING. Province of the business address.
              PROVINCE = 6

              # Data Type: STRING. Postal code of the business address.
              POSTAL_CODE = 7

              # Data Type: STRING. Country code of the business address.
              COUNTRY_CODE = 8

              # Data Type: STRING. Phone number of the business.
              PHONE_NUMBER = 9

              # Data Type: STRING. Language code of the business.
              LANGUAGE_CODE = 10

              # Data Type: INT64. ID of the chain.
              CHAIN_ID = 11

              # Data Type: STRING. Name of the chain.
              CHAIN_NAME = 12
            end
          end
        end
      end
    end
  end
end
