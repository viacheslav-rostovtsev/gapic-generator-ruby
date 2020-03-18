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
          # Container for enum describing possible campaign budget errors.
          class CampaignBudgetErrorEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible campaign budget errors.
            module CampaignBudgetError
              # Enum unspecified.
              UNSPECIFIED = 0

              # The received error code is not known in this version.
              UNKNOWN = 1

              # The campaign budget cannot be shared.
              CAMPAIGN_BUDGET_CANNOT_BE_SHARED = 17

              # The requested campaign budget no longer exists.
              CAMPAIGN_BUDGET_REMOVED = 2

              # The campaign budget is associated with at least one campaign, and so the
              # campaign budget cannot be removed.
              CAMPAIGN_BUDGET_IN_USE = 3

              # Customer is not whitelisted for this campaign budget period.
              CAMPAIGN_BUDGET_PERIOD_NOT_AVAILABLE = 4

              # This field is not mutable on implicitly shared campaign budgets
              CANNOT_MODIFY_FIELD_OF_IMPLICITLY_SHARED_CAMPAIGN_BUDGET = 6

              # Cannot change explicitly shared campaign budgets back to implicitly
              # shared ones.
              CANNOT_UPDATE_CAMPAIGN_BUDGET_TO_IMPLICITLY_SHARED = 7

              # An implicit campaign budget without a name cannot be changed to
              # explicitly shared campaign budget.
              CANNOT_UPDATE_CAMPAIGN_BUDGET_TO_EXPLICITLY_SHARED_WITHOUT_NAME = 8

              # Cannot change an implicitly shared campaign budget to an explicitly
              # shared one.
              CANNOT_UPDATE_CAMPAIGN_BUDGET_TO_EXPLICITLY_SHARED = 9

              # Only explicitly shared campaign budgets can be used with multiple
              # campaigns.
              CANNOT_USE_IMPLICITLY_SHARED_CAMPAIGN_BUDGET_WITH_MULTIPLE_CAMPAIGNS = 10

              # A campaign budget with this name already exists.
              DUPLICATE_NAME = 11

              # A money amount was not in the expected currency.
              MONEY_AMOUNT_IN_WRONG_CURRENCY = 12

              # A money amount was less than the minimum CPC for currency.
              MONEY_AMOUNT_LESS_THAN_CURRENCY_MINIMUM_CPC = 13

              # A money amount was greater than the maximum allowed.
              MONEY_AMOUNT_TOO_LARGE = 14

              # A money amount was negative.
              NEGATIVE_MONEY_AMOUNT = 15

              # A money amount was not a multiple of a minimum unit.
              NON_MULTIPLE_OF_MINIMUM_CURRENCY_UNIT = 16
            end
          end
        end
      end
    end
  end
end
