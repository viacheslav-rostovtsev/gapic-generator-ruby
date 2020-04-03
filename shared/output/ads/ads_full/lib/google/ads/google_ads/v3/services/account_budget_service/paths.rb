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
        module Services
          module AccountBudgetService
            # Path helper methods for the AccountBudgetService API.
            module Paths
              ##
              # Create a fully-qualified AccountBudget resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/accountBudgets/{account_budget}`
              #
              # @param customer [String]
              # @param account_budget [String]
              #
              # @return [String]
              def account_budget_path customer:, account_budget:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/accountBudgets/#{account_budget}"
              end

              ##
              # Create a fully-qualified AccountBudgetProposal resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/accountBudgetProposals/{account_budget_proposal}`
              #
              # @param customer [String]
              # @param account_budget_proposal [String]
              #
              # @return [String]
              def account_budget_proposal_path customer:, account_budget_proposal:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/accountBudgetProposals/#{account_budget_proposal}"
              end

              ##
              # Create a fully-qualified BillingSetup resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/billingSetups/{billing_setup}`
              #
              # @param customer [String]
              # @param billing_setup [String]
              #
              # @return [String]
              def billing_setup_path customer:, billing_setup:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/billingSetups/#{billing_setup}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
