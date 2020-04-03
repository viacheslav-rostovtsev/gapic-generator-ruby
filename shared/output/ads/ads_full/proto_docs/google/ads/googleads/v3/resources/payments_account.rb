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
        module Resources
          # A payments account, which can be used to set up billing for an Ads customer.
          # @!attribute [r] resource_name
          #   @return [String]
          #     Output only. The resource name of the payments account.
          #     PaymentsAccount resource names have the form:
          #
          #     `customers/{customer_id}/paymentsAccounts/{payments_account_id}`
          # @!attribute [r] payments_account_id
          #   @return [Google::Protobuf::StringValue]
          #     Output only. A 16 digit ID used to identify a payments account.
          # @!attribute [r] name
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The name of the payments account.
          # @!attribute [r] currency_code
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The currency code of the payments account.
          #     A subset of the currency codes derived from the ISO 4217 standard is
          #     supported.
          # @!attribute [r] payments_profile_id
          #   @return [Google::Protobuf::StringValue]
          #     Output only. A 12 digit ID used to identify the payments profile associated with the
          #     payments account.
          # @!attribute [r] secondary_payments_profile_id
          #   @return [Google::Protobuf::StringValue]
          #     Output only. A secondary payments profile ID present in uncommon situations, e.g.
          #     when a sequential liability agreement has been arranged.
          class PaymentsAccount
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
