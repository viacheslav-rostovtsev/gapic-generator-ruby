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
        module Services
          # Request message for [CustomerService.GetCustomer][google.ads.googleads.v3.services.CustomerService.GetCustomer].
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Required. The resource name of the customer to fetch.
          class GetCustomerRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [CustomerService.MutateCustomer][google.ads.googleads.v3.services.CustomerService.MutateCustomer].
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer being modified.
          # @!attribute [rw] operation
          #   @return [Google::Ads::GoogleAds::V3::Services::CustomerOperation]
          #     Required. The operation to perform on the customer
          # @!attribute [rw] validate_only
          #   @return [Boolean]
          #     If true, the request is validated but not executed. Only errors are
          #     returned, not results.
          class MutateCustomerRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [CustomerService.CreateCustomerClient][google.ads.googleads.v3.services.CustomerService.CreateCustomerClient].
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the Manager under whom client customer is being created.
          # @!attribute [rw] customer_client
          #   @return [Google::Ads::GoogleAds::V3::Resources::Customer]
          #     Required. The new client customer to create. The resource name on this customer
          #     will be ignored.
          # @!attribute [rw] email_address
          #   @return [Google::Protobuf::StringValue]
          #     Email address of the user who should be invited on the created client
          #     customer. Accessible to whitelisted customers only.
          # @!attribute [rw] access_role
          #   @return [Google::Ads::GoogleAds::V3::Enums::AccessRoleEnum::AccessRole]
          #     The proposed role of user on the created client customer.
          #     Accessible to whitelisted customers only.
          class CreateCustomerClientRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A single update on a customer.
          # @!attribute [rw] update
          #   @return [Google::Ads::GoogleAds::V3::Resources::Customer]
          #     Mutate operation. Only updates are supported for customer.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          class CustomerOperation
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for CreateCustomerClient mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the newly created customer client.
          class CreateCustomerClientResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for customer mutate.
          # @!attribute [rw] result
          #   @return [Google::Ads::GoogleAds::V3::Services::MutateCustomerResult]
          #     Result for the mutate.
          class MutateCustomerResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # The result for the customer mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateCustomerResult
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [CustomerService.ListAccessibleCustomers][google.ads.googleads.v3.services.CustomerService.ListAccessibleCustomers].
          class ListAccessibleCustomersRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for [CustomerService.ListAccessibleCustomers][google.ads.googleads.v3.services.CustomerService.ListAccessibleCustomers].
          # @!attribute [rw] resource_names
          #   @return [Array<String>]
          #     Resource name of customers directly accessible by the
          #     user authenticating the call.
          class ListAccessibleCustomersResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
