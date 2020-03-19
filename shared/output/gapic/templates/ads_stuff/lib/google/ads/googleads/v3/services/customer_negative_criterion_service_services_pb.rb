# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v3/services/customer_negative_criterion_service.proto for package 'Google.Ads.GoogleAds.V3.Services'
# Original file comments:
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/ads/googleads/v3/services/customer_negative_criterion_service_pb'

module Google
  module Ads
    module GoogleAds
      module V3
        module Services
          module CustomerNegativeCriterionService
            # Proto file describing the Customer Negative Criterion service.
            #
            # Service to manage customer negative criteria.
            class Service

              include GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v3.services.CustomerNegativeCriterionService'

              # Returns the requested criterion in full detail.
              rpc :GetCustomerNegativeCriterion, Google::Ads::GoogleAds::V3::Services::GetCustomerNegativeCriterionRequest, Google::Ads::GoogleAds::V3::Resources::CustomerNegativeCriterion
              # Creates or removes criteria. Operation statuses are returned.
              rpc :MutateCustomerNegativeCriteria, Google::Ads::GoogleAds::V3::Services::MutateCustomerNegativeCriteriaRequest, Google::Ads::GoogleAds::V3::Services::MutateCustomerNegativeCriteriaResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
