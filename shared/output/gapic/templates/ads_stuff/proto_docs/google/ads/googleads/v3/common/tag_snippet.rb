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
          # The site tag and event snippet pair for a TrackingCodeType.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::TrackingCodeTypeEnum::TrackingCodeType]
          #     The type of the generated tag snippets for tracking conversions.
          # @!attribute [rw] page_format
          #   @return [Google::Ads::GoogleAds::V3::Enums::TrackingCodePageFormatEnum::TrackingCodePageFormat]
          #     The format of the web page where the tracking tag and snippet will be
          #     installed, e.g. HTML.
          # @!attribute [rw] global_site_tag
          #   @return [Google::Protobuf::StringValue]
          #     The site tag that adds visitors to your basic remarketing lists and sets
          #     new cookies on your domain.
          # @!attribute [rw] event_snippet
          #   @return [Google::Protobuf::StringValue]
          #     The event snippet that works with the site tag to track actions that
          #     should be counted as conversions.
          class TagSnippet
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
