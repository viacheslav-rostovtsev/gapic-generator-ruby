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
          # Matching function associated with a
          # CustomerFeed, CampaignFeed, or AdGroupFeed. The matching function is used
          # to filter the set of feed items selected.
          # @!attribute [rw] function_string
          #   @return [Google::Protobuf::StringValue]
          #     String representation of the Function.
          #
          #     Examples:
          #
          #     1. IDENTITY(true) or IDENTITY(false). All or no feed items served.
          #     2. EQUALS(CONTEXT.DEVICE,"Mobile")
          #     3. IN(FEED_ITEM_ID,\\{1000001,1000002,1000003})
          #     4. CONTAINS_ANY(FeedAttribute[12345678,0],\\{"Mars cruise","Venus cruise"})
          #     5. AND(IN(FEED_ITEM_ID,\\{10001,10002}),EQUALS(CONTEXT.DEVICE,"Mobile"))
          #
          #     For more details, visit
          #     https://developers.google.com/adwords/api/docs/guides/feed-matching-functions
          #
          #     Note that because multiple strings may represent the same underlying
          #     function (whitespace and single versus double quotation marks, for
          #     example), the value returned may not be identical to the string sent in a
          #     mutate request.
          # @!attribute [rw] operator
          #   @return [Google::Ads::GoogleAds::V3::Enums::MatchingFunctionOperatorEnum::MatchingFunctionOperator]
          #     Operator for a function.
          # @!attribute [rw] left_operands
          #   @return [Array<Google::Ads::GoogleAds::V3::Common::Operand>]
          #     The operands on the left hand side of the equation. This is also the
          #     operand to be used for single operand expressions such as NOT.
          # @!attribute [rw] right_operands
          #   @return [Array<Google::Ads::GoogleAds::V3::Common::Operand>]
          #     The operands on the right hand side of the equation.
          class MatchingFunction
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # An operand in a matching function.
          # @!attribute [rw] constant_operand
          #   @return [Google::Ads::GoogleAds::V3::Common::Operand::ConstantOperand]
          #     A constant operand in a matching function.
          # @!attribute [rw] feed_attribute_operand
          #   @return [Google::Ads::GoogleAds::V3::Common::Operand::FeedAttributeOperand]
          #     This operand specifies a feed attribute in feed.
          # @!attribute [rw] function_operand
          #   @return [Google::Ads::GoogleAds::V3::Common::Operand::FunctionOperand]
          #     A function operand in a matching function.
          #     Used to represent nested functions.
          # @!attribute [rw] request_context_operand
          #   @return [Google::Ads::GoogleAds::V3::Common::Operand::RequestContextOperand]
          #     An operand in a function referring to a value in the request context.
          class Operand
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # A constant operand in a matching function.
            # @!attribute [rw] string_value
            #   @return [Google::Protobuf::StringValue]
            #     String value of the operand if it is a string type.
            # @!attribute [rw] long_value
            #   @return [Google::Protobuf::Int64Value]
            #     Int64 value of the operand if it is a int64 type.
            # @!attribute [rw] boolean_value
            #   @return [Google::Protobuf::BoolValue]
            #     Boolean value of the operand if it is a boolean type.
            # @!attribute [rw] double_value
            #   @return [Google::Protobuf::DoubleValue]
            #     Double value of the operand if it is a double type.
            class ConstantOperand
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end

            # A feed attribute operand in a matching function.
            # Used to represent a feed attribute in feed.
            # @!attribute [rw] feed_id
            #   @return [Google::Protobuf::Int64Value]
            #     The associated feed. Required.
            # @!attribute [rw] feed_attribute_id
            #   @return [Google::Protobuf::Int64Value]
            #     Id of the referenced feed attribute. Required.
            class FeedAttributeOperand
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end

            # A function operand in a matching function.
            # Used to represent nested functions.
            # @!attribute [rw] matching_function
            #   @return [Google::Ads::GoogleAds::V3::Common::MatchingFunction]
            #     The matching function held in this operand.
            class FunctionOperand
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end

            # An operand in a function referring to a value in the request context.
            # @!attribute [rw] context_type
            #   @return [Google::Ads::GoogleAds::V3::Enums::MatchingFunctionContextTypeEnum::MatchingFunctionContextType]
            #     Type of value to be referred in the request context.
            class RequestContextOperand
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end
          end
        end
      end
    end
  end
end
