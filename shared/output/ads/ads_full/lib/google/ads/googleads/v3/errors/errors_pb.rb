# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/errors/errors.proto

require 'google/protobuf'

require 'google/ads/googleads/v3/common/policy_pb'
require 'google/ads/googleads/v3/common/value_pb'
require 'google/ads/googleads/v3/errors/access_invitation_error_pb'
require 'google/ads/googleads/v3/errors/account_budget_proposal_error_pb'
require 'google/ads/googleads/v3/errors/ad_customizer_error_pb'
require 'google/ads/googleads/v3/errors/ad_error_pb'
require 'google/ads/googleads/v3/errors/ad_group_ad_error_pb'
require 'google/ads/googleads/v3/errors/ad_group_bid_modifier_error_pb'
require 'google/ads/googleads/v3/errors/ad_group_criterion_error_pb'
require 'google/ads/googleads/v3/errors/ad_group_error_pb'
require 'google/ads/googleads/v3/errors/ad_group_feed_error_pb'
require 'google/ads/googleads/v3/errors/ad_parameter_error_pb'
require 'google/ads/googleads/v3/errors/ad_sharing_error_pb'
require 'google/ads/googleads/v3/errors/adx_error_pb'
require 'google/ads/googleads/v3/errors/asset_error_pb'
require 'google/ads/googleads/v3/errors/authentication_error_pb'
require 'google/ads/googleads/v3/errors/authorization_error_pb'
require 'google/ads/googleads/v3/errors/bidding_error_pb'
require 'google/ads/googleads/v3/errors/bidding_strategy_error_pb'
require 'google/ads/googleads/v3/errors/billing_setup_error_pb'
require 'google/ads/googleads/v3/errors/campaign_budget_error_pb'
require 'google/ads/googleads/v3/errors/campaign_criterion_error_pb'
require 'google/ads/googleads/v3/errors/campaign_draft_error_pb'
require 'google/ads/googleads/v3/errors/campaign_error_pb'
require 'google/ads/googleads/v3/errors/campaign_experiment_error_pb'
require 'google/ads/googleads/v3/errors/campaign_feed_error_pb'
require 'google/ads/googleads/v3/errors/campaign_shared_set_error_pb'
require 'google/ads/googleads/v3/errors/change_status_error_pb'
require 'google/ads/googleads/v3/errors/collection_size_error_pb'
require 'google/ads/googleads/v3/errors/context_error_pb'
require 'google/ads/googleads/v3/errors/conversion_action_error_pb'
require 'google/ads/googleads/v3/errors/conversion_adjustment_upload_error_pb'
require 'google/ads/googleads/v3/errors/conversion_upload_error_pb'
require 'google/ads/googleads/v3/errors/country_code_error_pb'
require 'google/ads/googleads/v3/errors/criterion_error_pb'
require 'google/ads/googleads/v3/errors/currency_code_error_pb'
require 'google/ads/googleads/v3/errors/custom_interest_error_pb'
require 'google/ads/googleads/v3/errors/customer_client_link_error_pb'
require 'google/ads/googleads/v3/errors/customer_error_pb'
require 'google/ads/googleads/v3/errors/customer_feed_error_pb'
require 'google/ads/googleads/v3/errors/customer_manager_link_error_pb'
require 'google/ads/googleads/v3/errors/database_error_pb'
require 'google/ads/googleads/v3/errors/date_error_pb'
require 'google/ads/googleads/v3/errors/date_range_error_pb'
require 'google/ads/googleads/v3/errors/distinct_error_pb'
require 'google/ads/googleads/v3/errors/enum_error_pb'
require 'google/ads/googleads/v3/errors/extension_feed_item_error_pb'
require 'google/ads/googleads/v3/errors/extension_setting_error_pb'
require 'google/ads/googleads/v3/errors/feed_attribute_reference_error_pb'
require 'google/ads/googleads/v3/errors/feed_error_pb'
require 'google/ads/googleads/v3/errors/feed_item_error_pb'
require 'google/ads/googleads/v3/errors/feed_item_target_error_pb'
require 'google/ads/googleads/v3/errors/feed_item_validation_error_pb'
require 'google/ads/googleads/v3/errors/feed_mapping_error_pb'
require 'google/ads/googleads/v3/errors/field_error_pb'
require 'google/ads/googleads/v3/errors/field_mask_error_pb'
require 'google/ads/googleads/v3/errors/function_error_pb'
require 'google/ads/googleads/v3/errors/function_parsing_error_pb'
require 'google/ads/googleads/v3/errors/geo_target_constant_suggestion_error_pb'
require 'google/ads/googleads/v3/errors/header_error_pb'
require 'google/ads/googleads/v3/errors/id_error_pb'
require 'google/ads/googleads/v3/errors/image_error_pb'
require 'google/ads/googleads/v3/errors/internal_error_pb'
require 'google/ads/googleads/v3/errors/invoice_error_pb'
require 'google/ads/googleads/v3/errors/keyword_plan_ad_group_error_pb'
require 'google/ads/googleads/v3/errors/keyword_plan_campaign_error_pb'
require 'google/ads/googleads/v3/errors/keyword_plan_error_pb'
require 'google/ads/googleads/v3/errors/keyword_plan_idea_error_pb'
require 'google/ads/googleads/v3/errors/keyword_plan_keyword_error_pb'
require 'google/ads/googleads/v3/errors/keyword_plan_negative_keyword_error_pb'
require 'google/ads/googleads/v3/errors/label_error_pb'
require 'google/ads/googleads/v3/errors/language_code_error_pb'
require 'google/ads/googleads/v3/errors/list_operation_error_pb'
require 'google/ads/googleads/v3/errors/manager_link_error_pb'
require 'google/ads/googleads/v3/errors/media_bundle_error_pb'
require 'google/ads/googleads/v3/errors/media_file_error_pb'
require 'google/ads/googleads/v3/errors/media_upload_error_pb'
require 'google/ads/googleads/v3/errors/multiplier_error_pb'
require 'google/ads/googleads/v3/errors/mutate_error_pb'
require 'google/ads/googleads/v3/errors/mutate_job_error_pb'
require 'google/ads/googleads/v3/errors/new_resource_creation_error_pb'
require 'google/ads/googleads/v3/errors/not_empty_error_pb'
require 'google/ads/googleads/v3/errors/not_whitelisted_error_pb'
require 'google/ads/googleads/v3/errors/null_error_pb'
require 'google/ads/googleads/v3/errors/operation_access_denied_error_pb'
require 'google/ads/googleads/v3/errors/operator_error_pb'
require 'google/ads/googleads/v3/errors/partial_failure_error_pb'
require 'google/ads/googleads/v3/errors/payments_account_error_pb'
require 'google/ads/googleads/v3/errors/policy_finding_error_pb'
require 'google/ads/googleads/v3/errors/policy_validation_parameter_error_pb'
require 'google/ads/googleads/v3/errors/policy_violation_error_pb'
require 'google/ads/googleads/v3/errors/query_error_pb'
require 'google/ads/googleads/v3/errors/quota_error_pb'
require 'google/ads/googleads/v3/errors/range_error_pb'
require 'google/ads/googleads/v3/errors/reach_plan_error_pb'
require 'google/ads/googleads/v3/errors/recommendation_error_pb'
require 'google/ads/googleads/v3/errors/region_code_error_pb'
require 'google/ads/googleads/v3/errors/request_error_pb'
require 'google/ads/googleads/v3/errors/resource_access_denied_error_pb'
require 'google/ads/googleads/v3/errors/resource_count_limit_exceeded_error_pb'
require 'google/ads/googleads/v3/errors/setting_error_pb'
require 'google/ads/googleads/v3/errors/shared_criterion_error_pb'
require 'google/ads/googleads/v3/errors/shared_set_error_pb'
require 'google/ads/googleads/v3/errors/size_limit_error_pb'
require 'google/ads/googleads/v3/errors/string_format_error_pb'
require 'google/ads/googleads/v3/errors/string_length_error_pb'
require 'google/ads/googleads/v3/errors/time_zone_error_pb'
require 'google/ads/googleads/v3/errors/url_field_error_pb'
require 'google/ads/googleads/v3/errors/user_list_error_pb'
require 'google/ads/googleads/v3/errors/youtube_video_registration_error_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/errors/errors.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.errors.GoogleAdsFailure" do
      repeated :errors, :message, 1, "google.ads.googleads.v3.errors.GoogleAdsError"
    end
    add_message "google.ads.googleads.v3.errors.GoogleAdsError" do
      optional :error_code, :message, 1, "google.ads.googleads.v3.errors.ErrorCode"
      optional :message, :string, 2
      optional :trigger, :message, 3, "google.ads.googleads.v3.common.Value"
      optional :location, :message, 4, "google.ads.googleads.v3.errors.ErrorLocation"
      optional :details, :message, 5, "google.ads.googleads.v3.errors.ErrorDetails"
    end
    add_message "google.ads.googleads.v3.errors.ErrorCode" do
      oneof :error_code do
        optional :request_error, :enum, 1, "google.ads.googleads.v3.errors.RequestErrorEnum.RequestError"
        optional :bidding_strategy_error, :enum, 2, "google.ads.googleads.v3.errors.BiddingStrategyErrorEnum.BiddingStrategyError"
        optional :url_field_error, :enum, 3, "google.ads.googleads.v3.errors.UrlFieldErrorEnum.UrlFieldError"
        optional :list_operation_error, :enum, 4, "google.ads.googleads.v3.errors.ListOperationErrorEnum.ListOperationError"
        optional :query_error, :enum, 5, "google.ads.googleads.v3.errors.QueryErrorEnum.QueryError"
        optional :mutate_error, :enum, 7, "google.ads.googleads.v3.errors.MutateErrorEnum.MutateError"
        optional :field_mask_error, :enum, 8, "google.ads.googleads.v3.errors.FieldMaskErrorEnum.FieldMaskError"
        optional :authorization_error, :enum, 9, "google.ads.googleads.v3.errors.AuthorizationErrorEnum.AuthorizationError"
        optional :internal_error, :enum, 10, "google.ads.googleads.v3.errors.InternalErrorEnum.InternalError"
        optional :quota_error, :enum, 11, "google.ads.googleads.v3.errors.QuotaErrorEnum.QuotaError"
        optional :ad_error, :enum, 12, "google.ads.googleads.v3.errors.AdErrorEnum.AdError"
        optional :ad_group_error, :enum, 13, "google.ads.googleads.v3.errors.AdGroupErrorEnum.AdGroupError"
        optional :campaign_budget_error, :enum, 14, "google.ads.googleads.v3.errors.CampaignBudgetErrorEnum.CampaignBudgetError"
        optional :campaign_error, :enum, 15, "google.ads.googleads.v3.errors.CampaignErrorEnum.CampaignError"
        optional :authentication_error, :enum, 17, "google.ads.googleads.v3.errors.AuthenticationErrorEnum.AuthenticationError"
        optional :ad_group_criterion_error, :enum, 18, "google.ads.googleads.v3.errors.AdGroupCriterionErrorEnum.AdGroupCriterionError"
        optional :ad_customizer_error, :enum, 19, "google.ads.googleads.v3.errors.AdCustomizerErrorEnum.AdCustomizerError"
        optional :ad_group_ad_error, :enum, 21, "google.ads.googleads.v3.errors.AdGroupAdErrorEnum.AdGroupAdError"
        optional :ad_sharing_error, :enum, 24, "google.ads.googleads.v3.errors.AdSharingErrorEnum.AdSharingError"
        optional :adx_error, :enum, 25, "google.ads.googleads.v3.errors.AdxErrorEnum.AdxError"
        optional :asset_error, :enum, 107, "google.ads.googleads.v3.errors.AssetErrorEnum.AssetError"
        optional :bidding_error, :enum, 26, "google.ads.googleads.v3.errors.BiddingErrorEnum.BiddingError"
        optional :campaign_criterion_error, :enum, 29, "google.ads.googleads.v3.errors.CampaignCriterionErrorEnum.CampaignCriterionError"
        optional :collection_size_error, :enum, 31, "google.ads.googleads.v3.errors.CollectionSizeErrorEnum.CollectionSizeError"
        optional :country_code_error, :enum, 109, "google.ads.googleads.v3.errors.CountryCodeErrorEnum.CountryCodeError"
        optional :criterion_error, :enum, 32, "google.ads.googleads.v3.errors.CriterionErrorEnum.CriterionError"
        optional :customer_error, :enum, 90, "google.ads.googleads.v3.errors.CustomerErrorEnum.CustomerError"
        optional :date_error, :enum, 33, "google.ads.googleads.v3.errors.DateErrorEnum.DateError"
        optional :date_range_error, :enum, 34, "google.ads.googleads.v3.errors.DateRangeErrorEnum.DateRangeError"
        optional :distinct_error, :enum, 35, "google.ads.googleads.v3.errors.DistinctErrorEnum.DistinctError"
        optional :feed_attribute_reference_error, :enum, 36, "google.ads.googleads.v3.errors.FeedAttributeReferenceErrorEnum.FeedAttributeReferenceError"
        optional :function_error, :enum, 37, "google.ads.googleads.v3.errors.FunctionErrorEnum.FunctionError"
        optional :function_parsing_error, :enum, 38, "google.ads.googleads.v3.errors.FunctionParsingErrorEnum.FunctionParsingError"
        optional :id_error, :enum, 39, "google.ads.googleads.v3.errors.IdErrorEnum.IdError"
        optional :image_error, :enum, 40, "google.ads.googleads.v3.errors.ImageErrorEnum.ImageError"
        optional :language_code_error, :enum, 110, "google.ads.googleads.v3.errors.LanguageCodeErrorEnum.LanguageCodeError"
        optional :media_bundle_error, :enum, 42, "google.ads.googleads.v3.errors.MediaBundleErrorEnum.MediaBundleError"
        optional :media_upload_error, :enum, 116, "google.ads.googleads.v3.errors.MediaUploadErrorEnum.MediaUploadError"
        optional :media_file_error, :enum, 86, "google.ads.googleads.v3.errors.MediaFileErrorEnum.MediaFileError"
        optional :multiplier_error, :enum, 44, "google.ads.googleads.v3.errors.MultiplierErrorEnum.MultiplierError"
        optional :new_resource_creation_error, :enum, 45, "google.ads.googleads.v3.errors.NewResourceCreationErrorEnum.NewResourceCreationError"
        optional :not_empty_error, :enum, 46, "google.ads.googleads.v3.errors.NotEmptyErrorEnum.NotEmptyError"
        optional :null_error, :enum, 47, "google.ads.googleads.v3.errors.NullErrorEnum.NullError"
        optional :operator_error, :enum, 48, "google.ads.googleads.v3.errors.OperatorErrorEnum.OperatorError"
        optional :range_error, :enum, 49, "google.ads.googleads.v3.errors.RangeErrorEnum.RangeError"
        optional :recommendation_error, :enum, 58, "google.ads.googleads.v3.errors.RecommendationErrorEnum.RecommendationError"
        optional :region_code_error, :enum, 51, "google.ads.googleads.v3.errors.RegionCodeErrorEnum.RegionCodeError"
        optional :setting_error, :enum, 52, "google.ads.googleads.v3.errors.SettingErrorEnum.SettingError"
        optional :string_format_error, :enum, 53, "google.ads.googleads.v3.errors.StringFormatErrorEnum.StringFormatError"
        optional :string_length_error, :enum, 54, "google.ads.googleads.v3.errors.StringLengthErrorEnum.StringLengthError"
        optional :operation_access_denied_error, :enum, 55, "google.ads.googleads.v3.errors.OperationAccessDeniedErrorEnum.OperationAccessDeniedError"
        optional :resource_access_denied_error, :enum, 56, "google.ads.googleads.v3.errors.ResourceAccessDeniedErrorEnum.ResourceAccessDeniedError"
        optional :resource_count_limit_exceeded_error, :enum, 57, "google.ads.googleads.v3.errors.ResourceCountLimitExceededErrorEnum.ResourceCountLimitExceededError"
        optional :youtube_video_registration_error, :enum, 117, "google.ads.googleads.v3.errors.YoutubeVideoRegistrationErrorEnum.YoutubeVideoRegistrationError"
        optional :ad_group_bid_modifier_error, :enum, 59, "google.ads.googleads.v3.errors.AdGroupBidModifierErrorEnum.AdGroupBidModifierError"
        optional :context_error, :enum, 60, "google.ads.googleads.v3.errors.ContextErrorEnum.ContextError"
        optional :field_error, :enum, 61, "google.ads.googleads.v3.errors.FieldErrorEnum.FieldError"
        optional :shared_set_error, :enum, 62, "google.ads.googleads.v3.errors.SharedSetErrorEnum.SharedSetError"
        optional :shared_criterion_error, :enum, 63, "google.ads.googleads.v3.errors.SharedCriterionErrorEnum.SharedCriterionError"
        optional :campaign_shared_set_error, :enum, 64, "google.ads.googleads.v3.errors.CampaignSharedSetErrorEnum.CampaignSharedSetError"
        optional :conversion_action_error, :enum, 65, "google.ads.googleads.v3.errors.ConversionActionErrorEnum.ConversionActionError"
        optional :conversion_adjustment_upload_error, :enum, 115, "google.ads.googleads.v3.errors.ConversionAdjustmentUploadErrorEnum.ConversionAdjustmentUploadError"
        optional :conversion_upload_error, :enum, 111, "google.ads.googleads.v3.errors.ConversionUploadErrorEnum.ConversionUploadError"
        optional :header_error, :enum, 66, "google.ads.googleads.v3.errors.HeaderErrorEnum.HeaderError"
        optional :database_error, :enum, 67, "google.ads.googleads.v3.errors.DatabaseErrorEnum.DatabaseError"
        optional :policy_finding_error, :enum, 68, "google.ads.googleads.v3.errors.PolicyFindingErrorEnum.PolicyFindingError"
        optional :enum_error, :enum, 70, "google.ads.googleads.v3.errors.EnumErrorEnum.EnumError"
        optional :keyword_plan_error, :enum, 71, "google.ads.googleads.v3.errors.KeywordPlanErrorEnum.KeywordPlanError"
        optional :keyword_plan_campaign_error, :enum, 72, "google.ads.googleads.v3.errors.KeywordPlanCampaignErrorEnum.KeywordPlanCampaignError"
        optional :keyword_plan_negative_keyword_error, :enum, 73, "google.ads.googleads.v3.errors.KeywordPlanNegativeKeywordErrorEnum.KeywordPlanNegativeKeywordError"
        optional :keyword_plan_ad_group_error, :enum, 74, "google.ads.googleads.v3.errors.KeywordPlanAdGroupErrorEnum.KeywordPlanAdGroupError"
        optional :keyword_plan_keyword_error, :enum, 75, "google.ads.googleads.v3.errors.KeywordPlanKeywordErrorEnum.KeywordPlanKeywordError"
        optional :keyword_plan_idea_error, :enum, 76, "google.ads.googleads.v3.errors.KeywordPlanIdeaErrorEnum.KeywordPlanIdeaError"
        optional :account_budget_proposal_error, :enum, 77, "google.ads.googleads.v3.errors.AccountBudgetProposalErrorEnum.AccountBudgetProposalError"
        optional :user_list_error, :enum, 78, "google.ads.googleads.v3.errors.UserListErrorEnum.UserListError"
        optional :change_status_error, :enum, 79, "google.ads.googleads.v3.errors.ChangeStatusErrorEnum.ChangeStatusError"
        optional :feed_error, :enum, 80, "google.ads.googleads.v3.errors.FeedErrorEnum.FeedError"
        optional :geo_target_constant_suggestion_error, :enum, 81, "google.ads.googleads.v3.errors.GeoTargetConstantSuggestionErrorEnum.GeoTargetConstantSuggestionError"
        optional :campaign_draft_error, :enum, 82, "google.ads.googleads.v3.errors.CampaignDraftErrorEnum.CampaignDraftError"
        optional :feed_item_error, :enum, 83, "google.ads.googleads.v3.errors.FeedItemErrorEnum.FeedItemError"
        optional :label_error, :enum, 84, "google.ads.googleads.v3.errors.LabelErrorEnum.LabelError"
        optional :billing_setup_error, :enum, 87, "google.ads.googleads.v3.errors.BillingSetupErrorEnum.BillingSetupError"
        optional :customer_client_link_error, :enum, 88, "google.ads.googleads.v3.errors.CustomerClientLinkErrorEnum.CustomerClientLinkError"
        optional :customer_manager_link_error, :enum, 91, "google.ads.googleads.v3.errors.CustomerManagerLinkErrorEnum.CustomerManagerLinkError"
        optional :feed_mapping_error, :enum, 92, "google.ads.googleads.v3.errors.FeedMappingErrorEnum.FeedMappingError"
        optional :customer_feed_error, :enum, 93, "google.ads.googleads.v3.errors.CustomerFeedErrorEnum.CustomerFeedError"
        optional :ad_group_feed_error, :enum, 94, "google.ads.googleads.v3.errors.AdGroupFeedErrorEnum.AdGroupFeedError"
        optional :campaign_feed_error, :enum, 96, "google.ads.googleads.v3.errors.CampaignFeedErrorEnum.CampaignFeedError"
        optional :custom_interest_error, :enum, 97, "google.ads.googleads.v3.errors.CustomInterestErrorEnum.CustomInterestError"
        optional :campaign_experiment_error, :enum, 98, "google.ads.googleads.v3.errors.CampaignExperimentErrorEnum.CampaignExperimentError"
        optional :extension_feed_item_error, :enum, 100, "google.ads.googleads.v3.errors.ExtensionFeedItemErrorEnum.ExtensionFeedItemError"
        optional :ad_parameter_error, :enum, 101, "google.ads.googleads.v3.errors.AdParameterErrorEnum.AdParameterError"
        optional :feed_item_validation_error, :enum, 102, "google.ads.googleads.v3.errors.FeedItemValidationErrorEnum.FeedItemValidationError"
        optional :extension_setting_error, :enum, 103, "google.ads.googleads.v3.errors.ExtensionSettingErrorEnum.ExtensionSettingError"
        optional :feed_item_target_error, :enum, 104, "google.ads.googleads.v3.errors.FeedItemTargetErrorEnum.FeedItemTargetError"
        optional :policy_violation_error, :enum, 105, "google.ads.googleads.v3.errors.PolicyViolationErrorEnum.PolicyViolationError"
        optional :mutate_job_error, :enum, 108, "google.ads.googleads.v3.errors.MutateJobErrorEnum.MutateJobError"
        optional :partial_failure_error, :enum, 112, "google.ads.googleads.v3.errors.PartialFailureErrorEnum.PartialFailureError"
        optional :policy_validation_parameter_error, :enum, 114, "google.ads.googleads.v3.errors.PolicyValidationParameterErrorEnum.PolicyValidationParameterError"
        optional :size_limit_error, :enum, 118, "google.ads.googleads.v3.errors.SizeLimitErrorEnum.SizeLimitError"
        optional :not_whitelisted_error, :enum, 120, "google.ads.googleads.v3.errors.NotWhitelistedErrorEnum.NotWhitelistedError"
        optional :manager_link_error, :enum, 121, "google.ads.googleads.v3.errors.ManagerLinkErrorEnum.ManagerLinkError"
        optional :currency_code_error, :enum, 122, "google.ads.googleads.v3.errors.CurrencyCodeErrorEnum.CurrencyCodeError"
        optional :access_invitation_error, :enum, 124, "google.ads.googleads.v3.errors.AccessInvitationErrorEnum.AccessInvitationError"
        optional :reach_plan_error, :enum, 125, "google.ads.googleads.v3.errors.ReachPlanErrorEnum.ReachPlanError"
        optional :invoice_error, :enum, 126, "google.ads.googleads.v3.errors.InvoiceErrorEnum.InvoiceError"
        optional :payments_account_error, :enum, 127, "google.ads.googleads.v3.errors.PaymentsAccountErrorEnum.PaymentsAccountError"
        optional :time_zone_error, :enum, 128, "google.ads.googleads.v3.errors.TimeZoneErrorEnum.TimeZoneError"
      end
    end
    add_message "google.ads.googleads.v3.errors.ErrorLocation" do
      repeated :field_path_elements, :message, 2, "google.ads.googleads.v3.errors.ErrorLocation.FieldPathElement"
    end
    add_message "google.ads.googleads.v3.errors.ErrorLocation.FieldPathElement" do
      optional :field_name, :string, 1
      optional :index, :message, 2, "google.protobuf.Int64Value"
    end
    add_message "google.ads.googleads.v3.errors.ErrorDetails" do
      optional :unpublished_error_code, :string, 1
      optional :policy_violation_details, :message, 2, "google.ads.googleads.v3.errors.PolicyViolationDetails"
      optional :policy_finding_details, :message, 3, "google.ads.googleads.v3.errors.PolicyFindingDetails"
    end
    add_message "google.ads.googleads.v3.errors.PolicyViolationDetails" do
      optional :external_policy_description, :string, 2
      optional :key, :message, 4, "google.ads.googleads.v3.common.PolicyViolationKey"
      optional :external_policy_name, :string, 5
      optional :is_exemptible, :bool, 6
    end
    add_message "google.ads.googleads.v3.errors.PolicyFindingDetails" do
      repeated :policy_topic_entries, :message, 1, "google.ads.googleads.v3.common.PolicyTopicEntry"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Errors
          GoogleAdsFailure = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.GoogleAdsFailure").msgclass
          GoogleAdsError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.GoogleAdsError").msgclass
          ErrorCode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.ErrorCode").msgclass
          ErrorLocation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.ErrorLocation").msgclass
          ErrorLocation::FieldPathElement = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.ErrorLocation.FieldPathElement").msgclass
          ErrorDetails = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.ErrorDetails").msgclass
          PolicyViolationDetails = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.PolicyViolationDetails").msgclass
          PolicyFindingDetails = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.errors.PolicyFindingDetails").msgclass
        end
      end
    end
  end
end
