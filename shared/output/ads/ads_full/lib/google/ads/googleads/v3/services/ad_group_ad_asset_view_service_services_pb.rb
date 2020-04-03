# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v3/services/ad_group_ad_asset_view_service.proto for package 'Google.Ads.GoogleAds.V3.Services'
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
require 'google/ads/googleads/v3/services/ad_group_ad_asset_view_service_pb'

module Google
  module Ads
    module GoogleAds
      module V3
        module Services
          module AdGroupAdAssetViewService
            # Proto file describing the ad group ad asset view service.
            #
            # Service to fetch ad group ad asset views.
            class Service

              include GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v3.services.AdGroupAdAssetViewService'

              # Returns the requested ad group ad asset view in full detail.
              rpc :GetAdGroupAdAssetView, Google::Ads::GoogleAds::V3::Services::GetAdGroupAdAssetViewRequest, Google::Ads::GoogleAds::V3::Resources::AdGroupAdAssetView
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
