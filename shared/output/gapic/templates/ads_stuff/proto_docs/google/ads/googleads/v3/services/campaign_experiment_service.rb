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
          # Request message for [CampaignExperimentService.GetCampaignExperiment][google.ads.googleads.v3.services.CampaignExperimentService.GetCampaignExperiment].
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Required. The resource name of the campaign experiment to fetch.
          class GetCampaignExperimentRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [CampaignExperimentService.MutateCampaignExperiments][google.ads.googleads.v3.services.CampaignExperimentService.MutateCampaignExperiments].
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer whose campaign experiments are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::GoogleAds::V3::Services::CampaignExperimentOperation>]
          #     Required. The list of operations to perform on individual campaign experiments.
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
          class MutateCampaignExperimentsRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A single update operation on a campaign experiment.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] update
          #   @return [Google::Ads::GoogleAds::V3::Resources::CampaignExperiment]
          #     Update operation: The campaign experiment is expected to have a valid
          #     resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: The campaign experiment is expected to have a valid
          #     resource name, in this format:
          #
          #     `customers/{customer_id}/campaignExperiments/{campaign_experiment_id}`
          class CampaignExperimentOperation
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for campaign experiment mutate.
          # @!attribute [rw] partial_failure_error
          #   @return [Google::Rpc::Status]
          #     Errors that pertain to operation failures in the partial failure mode.
          #     Returned only when partial_failure = true and all errors occur inside the
          #     operations. If any errors occur outside the operations (e.g. auth errors),
          #     we return an RPC level error.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::GoogleAds::V3::Services::MutateCampaignExperimentResult>]
          #     All results for the mutate.
          class MutateCampaignExperimentsResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # The result for the campaign experiment mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateCampaignExperimentResult
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [CampaignExperimentService.CreateCampaignExperiment][google.ads.googleads.v3.services.CampaignExperimentService.CreateCampaignExperiment].
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer whose campaign experiment is being created.
          # @!attribute [rw] campaign_experiment
          #   @return [Google::Ads::GoogleAds::V3::Resources::CampaignExperiment]
          #     Required. The campaign experiment to be created.
          # @!attribute [rw] validate_only
          #   @return [Boolean]
          #     If true, the request is validated but not executed. Only errors are
          #     returned, not results.
          class CreateCampaignExperimentRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Message used as metadata returned in Long Running Operations for
          # CreateCampaignExperimentRequest
          # @!attribute [rw] campaign_experiment
          #   @return [String]
          #     Resource name of campaign experiment created.
          class CreateCampaignExperimentMetadata
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [CampaignExperimentService.GraduateCampaignExperiment][google.ads.googleads.v3.services.CampaignExperimentService.GraduateCampaignExperiment].
          # @!attribute [rw] campaign_experiment
          #   @return [String]
          #     Required. The resource name of the campaign experiment to graduate.
          # @!attribute [rw] campaign_budget
          #   @return [String]
          #     Required. Resource name of the budget to attach to the campaign graduated from the
          #     experiment.
          class GraduateCampaignExperimentRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for campaign experiment graduate.
          # @!attribute [rw] graduated_campaign
          #   @return [String]
          #     The resource name of the campaign from the graduated experiment.
          #     This campaign is the same one as CampaignExperiment.experiment_campaign.
          class GraduateCampaignExperimentResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [CampaignExperimentService.PromoteCampaignExperiment][google.ads.googleads.v3.services.CampaignExperimentService.PromoteCampaignExperiment].
          # @!attribute [rw] campaign_experiment
          #   @return [String]
          #     Required. The resource name of the campaign experiment to promote.
          class PromoteCampaignExperimentRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [CampaignExperimentService.EndCampaignExperiment][google.ads.googleads.v3.services.CampaignExperimentService.EndCampaignExperiment].
          # @!attribute [rw] campaign_experiment
          #   @return [String]
          #     Required. The resource name of the campaign experiment to end.
          class EndCampaignExperimentRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for
          # [CampaignExperimentService.ListCampaignExperimentAsyncErrors][google.ads.googleads.v3.services.CampaignExperimentService.ListCampaignExperimentAsyncErrors].
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Required. The name of the campaign experiment from which to retrieve the async
          #     errors.
          # @!attribute [rw] page_token
          #   @return [String]
          #     Token of the page to retrieve. If not specified, the first
          #     page of results will be returned. Use the value obtained from
          #     `next_page_token` in the previous response in order to request
          #     the next page of results.
          # @!attribute [rw] page_size
          #   @return [Integer]
          #     Number of elements to retrieve in a single page.
          #     When a page request is too large, the server may decide to
          #     further limit the number of returned resources.
          class ListCampaignExperimentAsyncErrorsRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for
          # [CampaignExperimentService.ListCampaignExperimentAsyncErrors][google.ads.googleads.v3.services.CampaignExperimentService.ListCampaignExperimentAsyncErrors].
          # @!attribute [rw] errors
          #   @return [Array<Google::Rpc::Status>]
          #     Details of the errors when performing the asynchronous operation.
          # @!attribute [rw] next_page_token
          #   @return [String]
          #     Pagination token used to retrieve the next page of results.
          #     Pass the content of this string as the `page_token` attribute of
          #     the next request. `next_page_token` is not returned for the last
          #     page.
          class ListCampaignExperimentAsyncErrorsResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
