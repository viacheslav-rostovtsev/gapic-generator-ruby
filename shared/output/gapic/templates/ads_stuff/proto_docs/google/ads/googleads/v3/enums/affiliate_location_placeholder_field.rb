# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

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
