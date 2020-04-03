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
        module Services
          module KeywordPlanCampaignService
            # Path helper methods for the KeywordPlanCampaignService API.
            module Paths
              ##
              # Create a fully-qualified GeoTargetConstant resource string.
              #
              # The resource will be in the following format:
              #
              # `geoTargetConstants/{geo_target_constant}`
              #
              # @param geo_target_constant [String]
              #
              # @return [String]
              def geo_target_constant_path geo_target_constant:
                "geoTargetConstants/#{geo_target_constant}"
              end

              ##
              # Create a fully-qualified KeywordPlan resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/keywordPlans/{keyword_plan}`
              #
              # @param customer [String]
              # @param keyword_plan [String]
              #
              # @return [String]
              def keyword_plan_path customer:, keyword_plan:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/keywordPlans/#{keyword_plan}"
              end

              ##
              # Create a fully-qualified KeywordPlanCampaign resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer}/keywordPlanCampaigns/{keyword_plan_campaign}`
              #
              # @param customer [String]
              # @param keyword_plan_campaign [String]
              #
              # @return [String]
              def keyword_plan_campaign_path customer:, keyword_plan_campaign:
                raise ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

                "customers/#{customer}/keywordPlanCampaigns/#{keyword_plan_campaign}"
              end

              ##
              # Create a fully-qualified LanguageConstant resource string.
              #
              # The resource will be in the following format:
              #
              # `languageConstants/{language_constant}`
              #
              # @param language_constant [String]
              #
              # @return [String]
              def language_constant_path language_constant:
                "languageConstants/#{language_constant}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
