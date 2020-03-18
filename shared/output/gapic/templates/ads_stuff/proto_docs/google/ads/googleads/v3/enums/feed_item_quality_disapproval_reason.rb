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
          # Container for enum describing possible quality evaluation disapproval reasons
          # of a feed item.
          class FeedItemQualityDisapprovalReasonEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # The possible quality evaluation disapproval reasons of a feed item.
            module FeedItemQualityDisapprovalReason
              # No value has been specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Price contains repetitive headers.
              PRICE_TABLE_REPETITIVE_HEADERS = 2

              # Price contains repetitive description.
              PRICE_TABLE_REPETITIVE_DESCRIPTION = 3

              # Price contains inconsistent items.
              PRICE_TABLE_INCONSISTENT_ROWS = 4

              # Price contains qualifiers in description.
              PRICE_DESCRIPTION_HAS_PRICE_QUALIFIERS = 5

              # Price contains an unsupported language.
              PRICE_UNSUPPORTED_LANGUAGE = 6

              # Price item header is not relevant to the price type.
              PRICE_TABLE_ROW_HEADER_TABLE_TYPE_MISMATCH = 7

              # Price item header has promotional text.
              PRICE_TABLE_ROW_HEADER_HAS_PROMOTIONAL_TEXT = 8

              # Price item description is not relevant to the item header.
              PRICE_TABLE_ROW_DESCRIPTION_NOT_RELEVANT = 9

              # Price item description contains promotional text.
              PRICE_TABLE_ROW_DESCRIPTION_HAS_PROMOTIONAL_TEXT = 10

              # Price item header and description are repetitive.
              PRICE_TABLE_ROW_HEADER_DESCRIPTION_REPETITIVE = 11

              # Price item is in a foreign language, nonsense, or can't be rated.
              PRICE_TABLE_ROW_UNRATEABLE = 12

              # Price item price is invalid or inaccurate.
              PRICE_TABLE_ROW_PRICE_INVALID = 13

              # Price item URL is invalid or irrelevant.
              PRICE_TABLE_ROW_URL_INVALID = 14

              # Price item header or description has price.
              PRICE_HEADER_OR_DESCRIPTION_HAS_PRICE = 15

              # Structured snippet values do not match the header.
              STRUCTURED_SNIPPETS_HEADER_POLICY_VIOLATED = 16

              # Structured snippet values are repeated.
              STRUCTURED_SNIPPETS_REPEATED_VALUES = 17

              # Structured snippet values violate editorial guidelines like punctuation.
              STRUCTURED_SNIPPETS_EDITORIAL_GUIDELINES = 18

              # Structured snippet contain promotional text.
              STRUCTURED_SNIPPETS_HAS_PROMOTIONAL_TEXT = 19
            end
          end
        end
      end
    end
  end
end
