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
          # Request message for {Google::Ads::GoogleAds::V3::Services::ConversionUploadService::Client#upload_click_conversions ConversionUploadService.UploadClickConversions}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer performing the upload.
          # @!attribute [rw] conversions
          #   @return [Array<Google::Ads::GoogleAds::V3::Services::ClickConversion>]
          #     Required. The conversions that are being uploaded.
          # @!attribute [rw] partial_failure
          #   @return [Boolean]
          #     If true, successful operations will be carried out and invalid
          #     operations will return errors. If false, all operations will be carried
          #     out in one transaction if and only if they are all valid.
          #     This should always be set to true.
          # @!attribute [rw] validate_only
          #   @return [Boolean]
          #     If true, the request is validated but not executed. Only errors are
          #     returned, not results.
          class UploadClickConversionsRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for {Google::Ads::GoogleAds::V3::Services::ConversionUploadService::Client#upload_click_conversions ConversionUploadService.UploadClickConversions}.
          # @!attribute [rw] partial_failure_error
          #   @return [Google::Rpc::Status]
          #     Errors that pertain to conversion failures in the partial failure mode.
          #     Returned when all errors occur inside the conversions. If any errors occur
          #     outside the conversions (e.g. auth errors), we return an RPC level error.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::GoogleAds::V3::Services::ClickConversionResult>]
          #     Returned for successfully processed conversions. Proto will be empty for
          #     rows that received an error. Results are not returned when validate_only is
          #     true.
          class UploadClickConversionsResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for {Google::Ads::GoogleAds::V3::Services::ConversionUploadService::Client#upload_call_conversions ConversionUploadService.UploadCallConversions}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     Required. The ID of the customer performing the upload.
          # @!attribute [rw] conversions
          #   @return [Array<Google::Ads::GoogleAds::V3::Services::CallConversion>]
          #     Required. The conversions that are being uploaded.
          # @!attribute [rw] partial_failure
          #   @return [Boolean]
          #     If true, successful operations will be carried out and invalid
          #     operations will return errors. If false, all operations will be carried
          #     out in one transaction if and only if they are all valid.
          #     This should always be set to true.
          # @!attribute [rw] validate_only
          #   @return [Boolean]
          #     If true, the request is validated but not executed. Only errors are
          #     returned, not results.
          class UploadCallConversionsRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for {Google::Ads::GoogleAds::V3::Services::ConversionUploadService::Client#upload_call_conversions ConversionUploadService.UploadCallConversions}.
          # @!attribute [rw] partial_failure_error
          #   @return [Google::Rpc::Status]
          #     Errors that pertain to conversion failures in the partial failure mode.
          #     Returned when all errors occur inside the conversions. If any errors occur
          #     outside the conversions (e.g. auth errors), we return an RPC level error.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::GoogleAds::V3::Services::CallConversionResult>]
          #     Returned for successfully processed conversions. Proto will be empty for
          #     rows that received an error. Results are not returned when validate_only is
          #     true.
          class UploadCallConversionsResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A click conversion.
          # @!attribute [rw] gclid
          #   @return [Google::Protobuf::StringValue]
          #     The Google click ID (gclid) associated with this conversion.
          # @!attribute [rw] conversion_action
          #   @return [Google::Protobuf::StringValue]
          #     Resource name of the conversion action associated with this conversion.
          #     Note: Although this resource name consists of a customer id and a
          #     conversion action id, validation will ignore the customer id and use the
          #     conversion action id as the sole identifier of the conversion action.
          # @!attribute [rw] conversion_date_time
          #   @return [Google::Protobuf::StringValue]
          #     The date time at which the conversion occurred. Must be after
          #     the click time. The timezone must be specified. The format is
          #     "yyyy-mm-dd hh:mm:ss+|-hh:mm", e.g. “2019-01-01 12:32:45-08:00”.
          # @!attribute [rw] conversion_value
          #   @return [Google::Protobuf::DoubleValue]
          #     The value of the conversion for the advertiser.
          # @!attribute [rw] currency_code
          #   @return [Google::Protobuf::StringValue]
          #     Currency associated with the conversion value. This is the ISO 4217
          #     3-character currency code. For example: USD, EUR.
          # @!attribute [rw] order_id
          #   @return [Google::Protobuf::StringValue]
          #     The order ID associated with the conversion. An order id can only be used
          #     for one conversion per conversion action.
          # @!attribute [rw] external_attribution_data
          #   @return [Google::Ads::GoogleAds::V3::Services::ExternalAttributionData]
          #     Additional data about externally attributed conversions. This field
          #     is required for conversions with an externally attributed conversion
          #     action, but should not be set otherwise.
          class ClickConversion
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A call conversion.
          # @!attribute [rw] caller_id
          #   @return [Google::Protobuf::StringValue]
          #     The caller id from which this call was placed. Caller id is expected to be
          #     in E.164 format with preceding '+' sign. e.g. "+16502531234".
          # @!attribute [rw] call_start_date_time
          #   @return [Google::Protobuf::StringValue]
          #     The date time at which the call occurred. The timezone must be specified.
          #     The format is "yyyy-mm-dd hh:mm:ss+|-hh:mm",
          #     e.g. "2019-01-01 12:32:45-08:00".
          # @!attribute [rw] conversion_action
          #   @return [Google::Protobuf::StringValue]
          #     Resource name of the conversion action associated with this conversion.
          #     Note: Although this resource name consists of a customer id and a
          #     conversion action id, validation will ignore the customer id and use the
          #     conversion action id as the sole identifier of the conversion action.
          # @!attribute [rw] conversion_date_time
          #   @return [Google::Protobuf::StringValue]
          #     The date time at which the conversion occurred. Must be after the call
          #     time. The timezone must be specified. The format is
          #     "yyyy-mm-dd hh:mm:ss+|-hh:mm", e.g. "2019-01-01 12:32:45-08:00".
          # @!attribute [rw] conversion_value
          #   @return [Google::Protobuf::DoubleValue]
          #     The value of the conversion for the advertiser.
          # @!attribute [rw] currency_code
          #   @return [Google::Protobuf::StringValue]
          #     Currency associated with the conversion value. This is the ISO 4217
          #     3-character currency code. For example: USD, EUR.
          class CallConversion
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Contains additional information about externally attributed conversions.
          # @!attribute [rw] external_attribution_credit
          #   @return [Google::Protobuf::DoubleValue]
          #     Represents the fraction of the conversion that is attributed to the
          #     Google Ads click.
          # @!attribute [rw] external_attribution_model
          #   @return [Google::Protobuf::StringValue]
          #     Specifies the attribution model name.
          class ExternalAttributionData
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Identifying information for a successfully processed ClickConversion.
          # @!attribute [rw] gclid
          #   @return [Google::Protobuf::StringValue]
          #     The Google Click ID (gclid) associated with this conversion.
          # @!attribute [rw] conversion_action
          #   @return [Google::Protobuf::StringValue]
          #     Resource name of the conversion action associated with this conversion.
          # @!attribute [rw] conversion_date_time
          #   @return [Google::Protobuf::StringValue]
          #     The date time at which the conversion occurred. The format is
          #     "yyyy-mm-dd hh:mm:ss+|-hh:mm", e.g. “2019-01-01 12:32:45-08:00”.
          class ClickConversionResult
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Identifying information for a successfully processed CallConversionUpload.
          # @!attribute [rw] caller_id
          #   @return [Google::Protobuf::StringValue]
          #     The caller id from which this call was placed. Caller id is expected to be
          #     in E.164 format with preceding '+' sign.
          # @!attribute [rw] call_start_date_time
          #   @return [Google::Protobuf::StringValue]
          #     The date time at which the call occurred. The format is
          #     "yyyy-mm-dd hh:mm:ss+|-hh:mm", e.g. "2019-01-01 12:32:45-08:00".
          # @!attribute [rw] conversion_action
          #   @return [Google::Protobuf::StringValue]
          #     Resource name of the conversion action associated with this conversion.
          # @!attribute [rw] conversion_date_time
          #   @return [Google::Protobuf::StringValue]
          #     The date time at which the conversion occurred. The format is
          #     "yyyy-mm-dd hh:mm:ss+|-hh:mm", e.g. "2019-01-01 12:32:45-08:00".
          class CallConversionResult
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
