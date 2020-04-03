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
          # Request message for {Google::Ads::GoogleAds::V3::Services::FeedMappingService::Client#get_feed_mapping FeedMappingService.GetFeedMapping}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Required. The resource name of the feed mapping to fetch.
          class GetFeedMappingRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for {Google::Ads::GoogleAds::V3::Services::FeedMappingService::Client#mutate_feed_mappings FeedMappingService.MutateFeedMappings}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer whose feed mappings are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::GoogleAds::V3::Services::FeedMappingOperation>]
          #     Required. The list of operations to perform on individual feed mappings.
          # @!attribute [rw] partial_failure
          #   @return [Boolean]
          #     If true, successful operations will be carried out and invalid
          #     operations will return errors. If false, all operations will be carried
          #     out in one transaction if and only if they are all valid.
          #     Default is false.
          # @!attribute [rw] validate_only
          #   @return [Boolean]
          #     If true, the request is validated but not executed. Only errors are
          #     returned, not results.
          class MutateFeedMappingsRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A single operation (create, remove) on a feed mapping.
          # @!attribute [rw] create
          #   @return [Google::Ads::GoogleAds::V3::Resources::FeedMapping]
          #     Create operation: No resource name is expected for the new feed mapping.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed feed mapping is
          #     expected, in this format:
          #
          #     `customers/{customer_id}/feedMappings/{feed_id}~{feed_mapping_id}`
          class FeedMappingOperation
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for a feed mapping mutate.
          # @!attribute [rw] partial_failure_error
          #   @return [Google::Rpc::Status]
          #     Errors that pertain to operation failures in the partial failure mode.
          #     Returned only when partial_failure = true and all errors occur inside the
          #     operations. If any errors occur outside the operations (e.g. auth errors),
          #     we return an RPC level error.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::GoogleAds::V3::Services::MutateFeedMappingResult>]
          #     All results for the mutate.
          class MutateFeedMappingsResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # The result for the feed mapping mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateFeedMappingResult
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
