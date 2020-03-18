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
        module Errors
          # Container for enum describing possible customer feed errors.
          class CustomerFeedErrorEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible customer feed errors.
            module CustomerFeedError
              # Enum unspecified.
              UNSPECIFIED = 0

              # The received error code is not known in this version.
              UNKNOWN = 1

              # An active feed already exists for this customer and place holder type.
              FEED_ALREADY_EXISTS_FOR_PLACEHOLDER_TYPE = 2

              # The specified feed is removed.
              CANNOT_CREATE_FOR_REMOVED_FEED = 3

              # The CustomerFeed already exists. Update should be used to modify the
              # existing CustomerFeed.
              CANNOT_CREATE_ALREADY_EXISTING_CUSTOMER_FEED = 4

              # Cannot update removed customer feed.
              CANNOT_MODIFY_REMOVED_CUSTOMER_FEED = 5

              # Invalid placeholder type.
              INVALID_PLACEHOLDER_TYPE = 6

              # Feed mapping for this placeholder type does not exist.
              MISSING_FEEDMAPPING_FOR_PLACEHOLDER_TYPE = 7

              # Placeholder not allowed at the account level.
              PLACEHOLDER_TYPE_NOT_ALLOWED_ON_CUSTOMER_FEED = 8
            end
          end
        end
      end
    end
  end
end
