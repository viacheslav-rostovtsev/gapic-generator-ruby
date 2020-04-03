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
          # A geographic view.
          #
          # Geographic View includes all metrics aggregated at the country level,
          # one row per country. It reports metrics at either actual physical location of
          # the user or an area of interest. If other segment fields are used, you may
          # get more than one row per country.
          # @!attribute [r] resource_name
          #   @return [String]
          #     Output only. The resource name of the geographic view.
          #     Geographic view resource names have the form:
          #
          #     `customers/{customer_id}/geographicViews/{country_criterion_id}~{location_type}`
          # @!attribute [r] location_type
          #   @return [Google::Ads::GoogleAds::V3::Enums::GeoTargetingTypeEnum::GeoTargetingType]
          #     Output only. Type of the geo targeting of the campaign.
          # @!attribute [r] country_criterion_id
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. Criterion Id for the country.
          class GeographicView
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
