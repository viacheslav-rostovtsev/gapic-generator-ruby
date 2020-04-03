# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v3/services/display_keyword_view_service.proto for package 'Google.Ads.GoogleAds.V3.Services'
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
require 'google/ads/googleads/v3/services/display_keyword_view_service_pb'

module Google
  module Ads
    module GoogleAds
      module V3
        module Services
          module DisplayKeywordViewService
            # Proto file describing the Display Keyword View service.
            #
            # Service to manage display keyword views.
            class Service

              include GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v3.services.DisplayKeywordViewService'

              # Returns the requested display keyword view in full detail.
              rpc :GetDisplayKeywordView, Google::Ads::GoogleAds::V3::Services::GetDisplayKeywordViewRequest, Google::Ads::GoogleAds::V3::Resources::DisplayKeywordView
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
