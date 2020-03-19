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
          module CustomerExtensionSettingService
            # Path helper methods for the CustomerExtensionSettingService API.
            module Paths
              ##
              # Create a fully-qualified CustomerExtensionSetting resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/customerExtensionSettings/{customer_extension_setting}`
              #
              # @param customer [String]
              # @param customer_extension_setting [String]
              #
              # @return [String]
              def customer_extension_setting_path customer:, customer_extension_setting:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/customerExtensionSettings/#{customer_extension_setting}"
              end

              ##
              # Create a fully-qualified ExtensionFeedItem resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/extensionFeedItems/{extension_feed_item}`
              #
              # @param customer [String]
              # @param extension_feed_item [String]
              #
              # @return [String]
              def extension_feed_item_path customer:, extension_feed_item:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/extensionFeedItems/#{extension_feed_item}"
              end
            end
          end
        end
      end
    end
  end
end
