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
          module BillingSetupService
            # Path helper methods for the BillingSetupService API.
            module Paths
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

              ##
              # Create a fully-qualified PaymentsAccount resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/paymentsAccounts/{payments_account}`
              #
              # @param customer [String]
              # @param payments_account [String]
              #
              # @return [String]
              def payments_account_path customer:, payments_account:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/paymentsAccounts/#{payments_account}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
