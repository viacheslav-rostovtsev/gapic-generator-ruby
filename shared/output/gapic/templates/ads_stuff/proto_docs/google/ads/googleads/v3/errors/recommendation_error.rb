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
        module Errors
          # Container for enum describing possible errors from applying a recommendation.
          class RecommendationErrorEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible errors from applying a recommendation.
            module RecommendationError
              # Enum unspecified.
              UNSPECIFIED = 0

              # The received error code is not known in this version.
              UNKNOWN = 1

              # The specified budget amount is too low e.g. lower than minimum currency
              # unit or lower than ad group minimum cost-per-click.
              BUDGET_AMOUNT_TOO_SMALL = 2

              # The specified budget amount is too large.
              BUDGET_AMOUNT_TOO_LARGE = 3

              # The specified budget amount is not a valid amount. e.g. not a multiple
              # of minimum currency unit.
              INVALID_BUDGET_AMOUNT = 4

              # The specified keyword or ad violates ad policy.
              POLICY_ERROR = 5

              # The specified bid amount is not valid. e.g. too many fractional digits,
              # or negative amount.
              INVALID_BID_AMOUNT = 6

              # The number of keywords in ad group have reached the maximum allowed.
              ADGROUP_KEYWORD_LIMIT = 7

              # The recommendation requested to apply has already been applied.
              RECOMMENDATION_ALREADY_APPLIED = 8

              # The recommendation requested to apply has been invalidated.
              RECOMMENDATION_INVALIDATED = 9

              # The number of operations in a single request exceeds the maximum allowed.
              TOO_MANY_OPERATIONS = 10

              # There are no operations in the request.
              NO_OPERATIONS = 11

              # Operations with multiple recommendation types are not supported when
              # partial failure mode is not enabled.
              DIFFERENT_TYPES_NOT_SUPPORTED = 12

              # Request contains multiple operations with the same resource_name.
              DUPLICATE_RESOURCE_NAME = 13

              # The recommendation requested to dismiss has already been dismissed.
              RECOMMENDATION_ALREADY_DISMISSED = 14

              # The recommendation apply request was malformed and invalid.
              INVALID_APPLY_REQUEST = 15
            end
          end
        end
      end
    end
  end
end
