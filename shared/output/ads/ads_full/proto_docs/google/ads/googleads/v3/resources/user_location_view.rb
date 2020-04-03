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
          # A user location view.
          #
          # User Location View includes all metrics aggregated at the country level,
          # one row per country. It reports metrics at the actual physical location of
          # the user by targeted or not targeted location. If other segment fields are
          # used, you may get more than one row per country.
          # @!attribute [r] resource_name
          #   @return [String]
          #     Output only. The resource name of the user location view.
          #     UserLocation view resource names have the form:
          #
          #     `customers/{customer_id}/userLocationViews/{country_criterion_id}~{targeting_location}`
          # @!attribute [r] country_criterion_id
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. Criterion Id for the country.
          # @!attribute [r] targeting_location
          #   @return [Google::Protobuf::BoolValue]
          #     Output only. Indicates whether location was targeted or not.
          class UserLocationView
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
