# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/common/matching_function.proto

require 'google/protobuf'

require 'google/ads/googleads/v3/enums/matching_function_context_type_pb'
require 'google/ads/googleads/v3/enums/matching_function_operator_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/common/matching_function.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.common.MatchingFunction" do
      optional :function_string, :message, 1, "google.protobuf.StringValue"
      optional :operator, :enum, 4, "google.ads.googleads.v3.enums.MatchingFunctionOperatorEnum.MatchingFunctionOperator"
      repeated :left_operands, :message, 2, "google.ads.googleads.v3.common.Operand"
      repeated :right_operands, :message, 3, "google.ads.googleads.v3.common.Operand"
    end
    add_message "google.ads.googleads.v3.common.Operand" do
      oneof :function_argument_operand do
        optional :constant_operand, :message, 1, "google.ads.googleads.v3.common.Operand.ConstantOperand"
        optional :feed_attribute_operand, :message, 2, "google.ads.googleads.v3.common.Operand.FeedAttributeOperand"
        optional :function_operand, :message, 3, "google.ads.googleads.v3.common.Operand.FunctionOperand"
        optional :request_context_operand, :message, 4, "google.ads.googleads.v3.common.Operand.RequestContextOperand"
      end
    end
    add_message "google.ads.googleads.v3.common.Operand.ConstantOperand" do
      oneof :constant_operand_value do
        optional :string_value, :message, 1, "google.protobuf.StringValue"
        optional :long_value, :message, 2, "google.protobuf.Int64Value"
        optional :boolean_value, :message, 3, "google.protobuf.BoolValue"
        optional :double_value, :message, 4, "google.protobuf.DoubleValue"
      end
    end
    add_message "google.ads.googleads.v3.common.Operand.FeedAttributeOperand" do
      optional :feed_id, :message, 1, "google.protobuf.Int64Value"
      optional :feed_attribute_id, :message, 2, "google.protobuf.Int64Value"
    end
    add_message "google.ads.googleads.v3.common.Operand.FunctionOperand" do
      optional :matching_function, :message, 1, "google.ads.googleads.v3.common.MatchingFunction"
    end
    add_message "google.ads.googleads.v3.common.Operand.RequestContextOperand" do
      optional :context_type, :enum, 1, "google.ads.googleads.v3.enums.MatchingFunctionContextTypeEnum.MatchingFunctionContextType"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Common
          MatchingFunction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.MatchingFunction").msgclass
          Operand = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.Operand").msgclass
          Operand::ConstantOperand = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.Operand.ConstantOperand").msgclass
          Operand::FeedAttributeOperand = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.Operand.FeedAttributeOperand").msgclass
          Operand::FunctionOperand = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.Operand.FunctionOperand").msgclass
          Operand::RequestContextOperand = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.Operand.RequestContextOperand").msgclass
        end
      end
    end
  end
end
