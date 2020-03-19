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
          module AdGroupAdService
            # Path helper methods for the AdGroupAdService API.
            module Paths
              ##
              # Create a fully-qualified Ad resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/ads/{ad}`
              #
              # @param customer [String]
              # @param ad [String]
              #
              # @return [String]
              def ad_path customer:, ad:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/ads/#{ad}"
              end

              ##
              # Create a fully-qualified AdGroup resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/adGroups/{ad_group}`
              #
              # @param customer [String]
              # @param ad_group [String]
              #
              # @return [String]
              def ad_group_path customer:, ad_group:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/adGroups/#{ad_group}"
              end

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
            end
          end
        end
      end
    end
  end
end
