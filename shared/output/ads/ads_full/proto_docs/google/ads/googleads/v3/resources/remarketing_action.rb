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
        module Resources
          # A remarketing action. A snippet of JavaScript code that will collect the
          # product id and the type of page people visited (product page, shopping cart
          # page, purchase page, general site visit) on an advertiser's website.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Immutable. The resource name of the remarketing action.
          #     Remarketing action resource names have the form:
          #
          #     `customers/{customer_id}/remarketingActions/{remarketing_action_id}`
          # @!attribute [r] id
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. Id of the remarketing action.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     The name of the remarketing action.
          #
          #     This field is required and should not be empty when creating new
          #     remarketing actions.
          # @!attribute [r] tag_snippets
          #   @return [Array<Google::Ads::GoogleAds::V3::Common::TagSnippet>]
          #     Output only. The snippets used for tracking remarketing actions.
          class RemarketingAction
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
