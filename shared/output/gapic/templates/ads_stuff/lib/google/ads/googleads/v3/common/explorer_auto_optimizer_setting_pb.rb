# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/common/explorer_auto_optimizer_setting.proto

require 'google/protobuf'

require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/common/explorer_auto_optimizer_setting.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.common.ExplorerAutoOptimizerSetting" do
      optional :opt_in, :message, 1, "google.protobuf.BoolValue"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Common
          ExplorerAutoOptimizerSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.common.ExplorerAutoOptimizerSetting").msgclass
        end
      end
    end
  end
end
