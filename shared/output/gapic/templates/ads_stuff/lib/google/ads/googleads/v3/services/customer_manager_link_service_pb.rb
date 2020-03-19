# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/services/customer_manager_link_service.proto

require 'google/protobuf'

require 'google/ads/googleads/v3/resources/customer_manager_link_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/protobuf/field_mask_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/services/customer_manager_link_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.services.GetCustomerManagerLinkRequest" do
      optional :resource_name, :string, 1
    end
    add_message "google.ads.googleads.v3.services.MutateCustomerManagerLinkRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v3.services.CustomerManagerLinkOperation"
    end
    add_message "google.ads.googleads.v3.services.MoveManagerLinkRequest" do
      optional :customer_id, :string, 1
      optional :previous_customer_manager_link, :string, 2
      optional :new_manager, :string, 3
    end
    add_message "google.ads.googleads.v3.services.CustomerManagerLinkOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :update, :message, 2, "google.ads.googleads.v3.resources.CustomerManagerLink"
      end
    end
    add_message "google.ads.googleads.v3.services.MutateCustomerManagerLinkResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v3.services.MutateCustomerManagerLinkResult"
    end
    add_message "google.ads.googleads.v3.services.MoveManagerLinkResponse" do
      optional :resource_name, :string, 1
    end
    add_message "google.ads.googleads.v3.services.MutateCustomerManagerLinkResult" do
      optional :resource_name, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Services
          GetCustomerManagerLinkRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.GetCustomerManagerLinkRequest").msgclass
          MutateCustomerManagerLinkRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MutateCustomerManagerLinkRequest").msgclass
          MoveManagerLinkRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MoveManagerLinkRequest").msgclass
          CustomerManagerLinkOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.CustomerManagerLinkOperation").msgclass
          MutateCustomerManagerLinkResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MutateCustomerManagerLinkResponse").msgclass
          MoveManagerLinkResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MoveManagerLinkResponse").msgclass
          MutateCustomerManagerLinkResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.services.MutateCustomerManagerLinkResult").msgclass
        end
      end
    end
  end
end
