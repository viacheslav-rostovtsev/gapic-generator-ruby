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
        module Common
          # Key of the violation. The key is used for referring to a violation
          # when filing an exemption request.
          # @!attribute [rw] policy_name
          #   @return [Google::Protobuf::StringValue]
          #     Unique ID of the violated policy.
          # @!attribute [rw] violating_text
          #   @return [Google::Protobuf::StringValue]
          #     The text that violates the policy if specified.
          #     Otherwise, refers to the policy in general
          #     (e.g., when requesting to be exempt from the whole policy).
          #     If not specified for criterion exemptions, the whole policy is implied.
          #     Must be specified for ad exemptions.
          class PolicyViolationKey
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Parameter for controlling how policy exemption is done. Ignorable policy
          # topics are only usable with expanded text ads and responsive search ads. All
          # other ad types must use policy violation keys.
          # @!attribute [rw] ignorable_policy_topics
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The list of policy topics that should not cause a PolicyFindingError to
          #     be reported. This field is currently only compatible with Enhanced Text Ad.
          #     It corresponds to the PolicyTopicEntry.topic field.
          #
          #     Resources violating these policies will be saved, but will not be eligible
          #     to serve. They may begin serving at a later time due to a change in
          #     policies, re-review of the resource, or a change in advertiser
          #     certificates.
          # @!attribute [rw] exempt_policy_violation_keys
          #   @return [Array<Google::Ads::GoogleAds::V3::Common::PolicyViolationKey>]
          #     The list of policy violation keys that should not cause a
          #     PolicyViolationError to be reported. Not all policy violations are
          #     exemptable, please refer to the is_exemptible field in the returned
          #     PolicyViolationError.
          #
          #     Resources violating these polices will be saved, but will not be eligible
          #     to serve. They may begin serving at a later time due to a change in
          #     policies, re-review of the resource, or a change in advertiser
          #     certificates.
          class PolicyValidationParameter
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Policy finding attached to a resource (e.g. alcohol policy associated with
          # a site that sells alcohol).
          #
          # Each PolicyTopicEntry has a topic that indicates the specific ads policy
          # the entry is about and a type to indicate the effect that the entry will have
          # on serving. It may optionally have one or more evidences that indicate the
          # reason for the finding. It may also optionally have one or more constraints
          # that provide details about how serving may be restricted.
          # @!attribute [rw] topic
          #   @return [Google::Protobuf::StringValue]
          #     Policy topic this finding refers to. For example, "ALCOHOL",
          #     "TRADEMARKS_IN_AD_TEXT", or "DESTINATION_NOT_WORKING". The set of possible
          #     policy topics is not fixed for a particular API version and may change
          #     at any time.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::PolicyTopicEntryTypeEnum::PolicyTopicEntryType]
          #     Describes the negative or positive effect this policy will have on serving.
          # @!attribute [rw] evidences
          #   @return [Array<Google::Ads::GoogleAds::V3::Common::PolicyTopicEvidence>]
          #     Additional information that explains policy finding
          #     (e.g. the brand name for a trademark finding).
          # @!attribute [rw] constraints
          #   @return [Array<Google::Ads::GoogleAds::V3::Common::PolicyTopicConstraint>]
          #     Indicates how serving of this resource may be affected (e.g. not serving
          #     in a country).
          class PolicyTopicEntry
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Additional information that explains a policy finding.
          # @!attribute [rw] website_list
          #   @return [Google::Ads::GoogleAds::V3::Common::PolicyTopicEvidence::WebsiteList]
          #     List of websites linked with this resource.
          # @!attribute [rw] text_list
          #   @return [Google::Ads::GoogleAds::V3::Common::PolicyTopicEvidence::TextList]
          #     List of evidence found in the text of a resource.
          # @!attribute [rw] language_code
          #   @return [Google::Protobuf::StringValue]
          #     The language the resource was detected to be written in.
          #     This is an IETF language tag such as "en-US".
          # @!attribute [rw] destination_text_list
          #   @return [Google::Ads::GoogleAds::V3::Common::PolicyTopicEvidence::DestinationTextList]
          #     The text in the destination of the resource that is causing a policy
          #     finding.
          # @!attribute [rw] destination_mismatch
          #   @return [Google::Ads::GoogleAds::V3::Common::PolicyTopicEvidence::DestinationMismatch]
          #     Mismatch between the destinations of a resource's URLs.
          # @!attribute [rw] destination_not_working
          #   @return [Google::Ads::GoogleAds::V3::Common::PolicyTopicEvidence::DestinationNotWorking]
          #     Details when the destination is returning an HTTP error code or isn't
          #     functional in all locations for commonly used devices.
          class PolicyTopicEvidence
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # A list of fragments of text that violated a policy.
            # @!attribute [rw] texts
            #   @return [Array<Google::Protobuf::StringValue>]
            #     The fragments of text from the resource that caused the policy finding.
            class TextList
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end

            # A list of websites that caused a policy finding. Used for
            # ONE_WEBSITE_PER_AD_GROUP policy topic, for example. In case there are more
            # than five websites, only the top five (those that appear in resources the
            # most) will be listed here.
            # @!attribute [rw] websites
            #   @return [Array<Google::Protobuf::StringValue>]
            #     Websites that caused the policy finding.
            class WebsiteList
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end

            # A list of strings found in a destination page that caused a policy
            # finding.
            # @!attribute [rw] destination_texts
            #   @return [Array<Google::Protobuf::StringValue>]
            #     List of text found in the resource's destination page.
            class DestinationTextList
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end

            # Evidence of mismatches between the URLs of a resource.
            # @!attribute [rw] url_types
            #   @return [Array<Google::Ads::GoogleAds::V3::Enums::PolicyTopicEvidenceDestinationMismatchUrlTypeEnum::PolicyTopicEvidenceDestinationMismatchUrlType>]
            #     The set of URLs that did not match each other.
            class DestinationMismatch
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end

            # Evidence details when the destination is returning an HTTP error
            # code or isn't functional in all locations for commonly used devices.
            # @!attribute [rw] expanded_url
            #   @return [Google::Protobuf::StringValue]
            #     The full URL that didn't work.
            # @!attribute [rw] device
            #   @return [Google::Ads::GoogleAds::V3::Enums::PolicyTopicEvidenceDestinationNotWorkingDeviceEnum::PolicyTopicEvidenceDestinationNotWorkingDevice]
            #     The type of device that failed to load the URL.
            # @!attribute [rw] last_checked_date_time
            #   @return [Google::Protobuf::StringValue]
            #     The time the URL was last checked.
            #     The format is "YYYY-MM-DD HH:MM:SS".
            #     Examples: "2018-03-05 09:15:00" or "2018-02-01 14:34:30"
            # @!attribute [rw] dns_error_type
            #   @return [Google::Ads::GoogleAds::V3::Enums::PolicyTopicEvidenceDestinationNotWorkingDnsErrorTypeEnum::PolicyTopicEvidenceDestinationNotWorkingDnsErrorType]
            #     The type of DNS error.
            # @!attribute [rw] http_error_code
            #   @return [Google::Protobuf::Int64Value]
            #     The HTTP error code.
            class DestinationNotWorking
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end
          end

          # Describes the effect on serving that a policy topic entry will have.
          # @!attribute [rw] country_constraint_list
          #   @return [Google::Ads::GoogleAds::V3::Common::PolicyTopicConstraint::CountryConstraintList]
          #     Countries where the resource cannot serve.
          # @!attribute [rw] reseller_constraint
          #   @return [Google::Ads::GoogleAds::V3::Common::PolicyTopicConstraint::ResellerConstraint]
          #     Reseller constraint.
          # @!attribute [rw] certificate_missing_in_country_list
          #   @return [Google::Ads::GoogleAds::V3::Common::PolicyTopicConstraint::CountryConstraintList]
          #     Countries where a certificate is required for serving.
          # @!attribute [rw] certificate_domain_mismatch_in_country_list
          #   @return [Google::Ads::GoogleAds::V3::Common::PolicyTopicConstraint::CountryConstraintList]
          #     Countries where the resource's domain is not covered by the
          #     certificates associated with it.
          class PolicyTopicConstraint
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # A list of countries where a resource's serving is constrained.
            # @!attribute [rw] total_targeted_countries
            #   @return [Google::Protobuf::Int32Value]
            #     Total number of countries targeted by the resource.
            # @!attribute [rw] countries
            #   @return [Array<Google::Ads::GoogleAds::V3::Common::PolicyTopicConstraint::CountryConstraint>]
            #     Countries in which serving is restricted.
            class CountryConstraintList
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end

            # Indicates that a policy topic was constrained due to disapproval of the
            # website for reseller purposes.
            class ResellerConstraint
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end

            # Indicates that a resource's ability to serve in a particular country is
            # constrained.
            # @!attribute [rw] country_criterion
            #   @return [Google::Protobuf::StringValue]
            #     Geo target constant resource name of the country in which serving is
            #     constrained.
            class CountryConstraint
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end
          end
        end
      end
    end
  end
end
