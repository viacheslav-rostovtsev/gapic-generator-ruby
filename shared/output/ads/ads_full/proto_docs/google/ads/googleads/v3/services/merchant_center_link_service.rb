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
          # Request message for {Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkService::Client#list_merchant_center_links MerchantCenterLinkService.ListMerchantCenterLinks}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer onto which to apply the Merchant Center link list
          #     operation.
          class ListMerchantCenterLinksRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for {Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkService::Client#list_merchant_center_links MerchantCenterLinkService.ListMerchantCenterLinks}.
          # @!attribute [rw] merchant_center_links
          #   @return [Array<Google::Ads::GoogleAds::V3::Resources::MerchantCenterLink>]
          #     Merchant Center links available for the requested customer
          class ListMerchantCenterLinksResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for {Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkService::Client#get_merchant_center_link MerchantCenterLinkService.GetMerchantCenterLink}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Required. Resource name of the Merchant Center link.
          class GetMerchantCenterLinkRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for {Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkService::Client#mutate_merchant_center_link MerchantCenterLinkService.MutateMerchantCenterLink}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer being modified.
          # @!attribute [rw] operation
          #   @return [Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkOperation]
          #     Required. The operation to perform on the link
          class MutateMerchantCenterLinkRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A single update on a Merchant Center link.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] update
          #   @return [Google::Ads::GoogleAds::V3::Resources::MerchantCenterLink]
          #     Update operation: The merchant center link is expected to have a valid
          #     resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed merchant center link is
          #     expected, in this format:
          #
          #     `customers/{customer_id}/merchantCenterLinks/{merchant_center_id}`
          class MerchantCenterLinkOperation
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for Merchant Center link mutate.
          # @!attribute [rw] result
          #   @return [Google::Ads::GoogleAds::V3::Services::MutateMerchantCenterLinkResult]
          #     Result for the mutate.
          class MutateMerchantCenterLinkResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # The result for the Merchant Center link mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateMerchantCenterLinkResult
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
