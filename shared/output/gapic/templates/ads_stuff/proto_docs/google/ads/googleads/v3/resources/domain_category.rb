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
          # A category generated automatically by crawling a domain. If a campaign uses
          # the DynamicSearchAdsSetting, then domain categories will be generated for
          # the domain. The categories can be targeted using WebpageConditionInfo.
          # See: https://support.google.com/google-ads/answer/2471185
          # @!attribute [r] resource_name
          #   @return [String]
          #     Output only. The resource name of the domain category.
          #     Domain category resource names have the form:
          #
          #     `customers/{customer_id}/domainCategories/{campaign_id}~{category_base64}~{language_code}`
          # @!attribute [r] campaign
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The campaign this category is recommended for.
          # @!attribute [r] category
          #   @return [Google::Protobuf::StringValue]
          #     Output only. Recommended category for the website domain. e.g. if you have a website
          #     about electronics, the categories could be "cameras", "televisions", etc.
          # @!attribute [r] language_code
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The language code specifying the language of the website. e.g. "en" for
          #     English. The language can be specified in the DynamicSearchAdsSetting
          #     required for dynamic search ads. This is the language of the pages from
          #     your website that you want Google Ads to find, create ads for,
          #     and match searches with.
          # @!attribute [r] domain
          #   @return [Google::Protobuf::StringValue]
          #     Output only. The domain for the website. The domain can be specified in the
          #     DynamicSearchAdsSetting required for dynamic search ads.
          # @!attribute [r] coverage_fraction
          #   @return [Google::Protobuf::DoubleValue]
          #     Output only. Fraction of pages on your site that this category matches.
          # @!attribute [r] category_rank
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. The position of this category in the set of categories. Lower numbers
          #     indicate a better match for the domain. null indicates not recommended.
          # @!attribute [r] has_children
          #   @return [Google::Protobuf::BoolValue]
          #     Output only. Indicates whether this category has sub-categories.
          # @!attribute [r] recommended_cpc_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. The recommended cost per click for the category.
          class DomainCategory
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
