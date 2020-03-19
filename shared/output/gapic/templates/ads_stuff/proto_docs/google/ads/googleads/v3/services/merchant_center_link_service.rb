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
          # Request message for [MerchantCenterLinkService.ListMerchantCenterLinks][google.ads.googleads.v3.services.MerchantCenterLinkService.ListMerchantCenterLinks].
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer onto which to apply the Merchant Center link list
          #     operation.
          class ListMerchantCenterLinksRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for [MerchantCenterLinkService.ListMerchantCenterLinks][google.ads.googleads.v3.services.MerchantCenterLinkService.ListMerchantCenterLinks].
          # @!attribute [rw] merchant_center_links
          #   @return [Array<Google::Ads::GoogleAds::V3::Resources::MerchantCenterLink>]
          #     Merchant Center links available for the requested customer
          class ListMerchantCenterLinksResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [MerchantCenterLinkService.GetMerchantCenterLink][google.ads.googleads.v3.services.MerchantCenterLinkService.GetMerchantCenterLink].
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Required. Resource name of the Merchant Center link.
          class GetMerchantCenterLinkRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [MerchantCenterLinkService.MutateMerchantCenterLink][google.ads.googleads.v3.services.MerchantCenterLinkService.MutateMerchantCenterLink].
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
