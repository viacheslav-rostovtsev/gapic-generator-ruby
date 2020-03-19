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
          module AdGroupAdLabelService
            # Path helper methods for the AdGroupAdLabelService API.
            module Paths
              ##
              # Create a fully-qualified AdGroupAd resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/adGroupAds/{ad_group_ad}`
              #
              # @param customer [String]
              # @param ad_group_ad [String]
              #
              # @return [String]
              def ad_group_ad_path customer:, ad_group_ad:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/adGroupAds/#{ad_group_ad}"
              end

              ##
              # Create a fully-qualified AdGroupAdLabel resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/adGroupAdLabels/{ad_group_ad_label}`
              #
              # @param customer [String]
              # @param ad_group_ad_label [String]
              #
              # @return [String]
              def ad_group_ad_label_path customer:, ad_group_ad_label:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/adGroupAdLabels/#{ad_group_ad_label}"
              end

              ##
              # Create a fully-qualified Label resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/labels/{label}`
              #
              # @param customer [String]
              # @param label [String]
              #
              # @return [String]
              def label_path customer:, label:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/labels/#{label}"
              end
            end
          end
        end
      end
    end
  end
end
