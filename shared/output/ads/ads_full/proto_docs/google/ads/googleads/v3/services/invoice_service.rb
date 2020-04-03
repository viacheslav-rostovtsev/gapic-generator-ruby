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
          # Request message for fetching the invoices of a given billing setup that were
          # issued during a given month.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer to fetch invoices for.
          # @!attribute [rw] billing_setup
          #   @return [String]
          #     Required. The billing setup resource name of the requested invoices.
          #
          #     `customers/{customer_id}/billingSetups/{billing_setup_id}`
          # @!attribute [rw] issue_year
          #   @return [String]
          #     Required. The issue year to retrieve invoices, in yyyy format. Only
          #     invoices issued in 2019 or later can be retrieved.
          # @!attribute [rw] issue_month
          #   @return [Google::Ads::GoogleAds::V3::Enums::MonthOfYearEnum::MonthOfYear]
          #     Required. The issue month to retrieve invoices.
          class ListInvoicesRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for {Google::Ads::GoogleAds::V3::Services::InvoiceService::Client#list_invoices InvoiceService.ListInvoices}.
          # @!attribute [rw] invoices
          #   @return [Array<Google::Ads::GoogleAds::V3::Resources::Invoice>]
          #     The list of invoices that match the billing setup and time period.
          class ListInvoicesResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
