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
        module Resources
          # A customer.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Immutable. The resource name of the customer.
          #     Customer resource names have the form:
          #
          #     `customers/{customer_id}`
          # @!attribute [r] id
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. The ID of the customer.
          # @!attribute [rw] descriptive_name
          #   @return [Google::Protobuf::StringValue]
          #     Optional, non-unique descriptive name of the customer.
          # @!attribute [rw] currency_code
          #   @return [Google::Protobuf::StringValue]
          #     Immutable. The currency in which the account operates.
          #     A subset of the currency codes from the ISO 4217 standard is
          #     supported.
          # @!attribute [rw] time_zone
          #   @return [Google::Protobuf::StringValue]
          #     Immutable. The local timezone ID of the customer.
          # @!attribute [rw] tracking_url_template
          #   @return [Google::Protobuf::StringValue]
          #     The URL template for constructing a tracking URL out of parameters.
          # @!attribute [rw] final_url_suffix
          #   @return [Google::Protobuf::StringValue]
          #     The URL template for appending params to the final URL
          # @!attribute [rw] auto_tagging_enabled
          #   @return [Google::Protobuf::BoolValue]
          #     Whether auto-tagging is enabled for the customer.
          # @!attribute [r] has_partners_badge
          #   @return [Google::Protobuf::BoolValue]
          #     Output only. Whether the Customer has a Partners program badge. If the Customer is not
          #     associated with the Partners program, this will be false. For more
          #     information, see https://support.google.com/partners/answer/3125774.
          # @!attribute [r] manager
          #   @return [Google::Protobuf::BoolValue]
          #     Output only. Whether the customer is a manager.
          # @!attribute [r] test_account
          #   @return [Google::Protobuf::BoolValue]
          #     Output only. Whether the customer is a test account.
          # @!attribute [rw] call_reporting_setting
          #   @return [Google::Ads::GoogleAds::V3::Resources::CallReportingSetting]
          #     Call reporting setting for a customer.
          # @!attribute [r] conversion_tracking_setting
          #   @return [Google::Ads::GoogleAds::V3::Resources::ConversionTrackingSetting]
          #     Output only. Conversion tracking setting for a customer.
          # @!attribute [r] remarketing_setting
          #   @return [Google::Ads::GoogleAds::V3::Resources::RemarketingSetting]
          #     Output only. Remarketing setting for a customer.
          # @!attribute [r] pay_per_conversion_eligibility_failure_reasons
          #   @return [Array<Google::Ads::GoogleAds::V3::Enums::CustomerPayPerConversionEligibilityFailureReasonEnum::CustomerPayPerConversionEligibilityFailureReason>]
          #     Output only. Reasons why the customer is not eligible to use PaymentMode.CONVERSIONS. If
          #     the list is empty, the customer is eligible. This field is read-only.
          class Customer
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Call reporting setting for a customer.
          # @!attribute [rw] call_reporting_enabled
          #   @return [Google::Protobuf::BoolValue]
          #     Enable reporting of phone call events by redirecting them via Google
          #     System.
          # @!attribute [rw] call_conversion_reporting_enabled
          #   @return [Google::Protobuf::BoolValue]
          #     Whether to enable call conversion reporting.
          # @!attribute [rw] call_conversion_action
          #   @return [Google::Protobuf::StringValue]
          #     Customer-level call conversion action to attribute a call conversion to.
          #     If not set a default conversion action is used. Only in effect when
          #     call_conversion_reporting_enabled is set to true.
          class CallReportingSetting
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A collection of customer-wide settings related to Google Ads Conversion
          # Tracking.
          # @!attribute [r] conversion_tracking_id
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. The conversion tracking id used for this account. This id is automatically
          #     assigned after any conversion tracking feature is used. If the customer
          #     doesn't use conversion tracking, this is 0. This field is read-only.
          # @!attribute [r] cross_account_conversion_tracking_id
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. The conversion tracking id of the customer's manager. This is set when the
          #     customer is opted into cross account conversion tracking, and it overrides
          #     conversion_tracking_id. This field can only be managed through the Google
          #     Ads UI. This field is read-only.
          class ConversionTrackingSetting
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Remarketing setting for a customer.
          # @!attribute [r] google_global_site_tag
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The Google global site tag.
          class RemarketingSetting
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
