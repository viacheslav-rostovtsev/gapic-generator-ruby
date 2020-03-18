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
        module Resources
          # A feed.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Immutable. The resource name of the feed.
          #     Feed resource names have the form:
          #
          #     `customers/{customer_id}/feeds/{feed_id}`
          # @!attribute [r] id
          #   @return [Google::Protobuf::Int64Value]
          #     Output only. The ID of the feed.
          #     This field is read-only.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     Immutable. Name of the feed. Required.
          # @!attribute [rw] attributes
          #   @return [Array<Google::Ads::GoogleAds::V3::Resources::FeedAttribute>]
          #     The Feed's attributes. Required on CREATE, unless
          #     system_feed_generation_data is provided, in which case Google Ads will
          #     update the feed with the correct attributes.
          #     Disallowed on UPDATE. Use attribute_operations to add new attributes.
          # @!attribute [rw] attribute_operations
          #   @return [Array<Google::Ads::GoogleAds::V3::Resources::FeedAttributeOperation>]
          #     The list of operations changing the feed attributes. Attributes can only
          #     be added, not removed.
          # @!attribute [rw] origin
          #   @return [Google::Ads::GoogleAds::V3::Enums::FeedOriginEnum::FeedOrigin]
          #     Immutable. Specifies who manages the FeedAttributes for the Feed.
          # @!attribute [r] status
          #   @return [Google::Ads::GoogleAds::V3::Enums::FeedStatusEnum::FeedStatus]
          #     Output only. Status of the feed.
          #     This field is read-only.
          # @!attribute [rw] places_location_feed_data
          #   @return [Google::Ads::GoogleAds::V3::Resources::Feed::PlacesLocationFeedData]
          #     Data used to configure a location feed populated from Google My Business
          #     Locations.
          # @!attribute [rw] affiliate_location_feed_data
          #   @return [Google::Ads::GoogleAds::V3::Resources::Feed::AffiliateLocationFeedData]
          #     Data used to configure an affiliate location feed populated with
          #     the specified chains.
          class Feed
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Data used to configure a location feed populated from Google My Business
            # Locations.
            # @!attribute [rw] oauth_info
            #   @return [Google::Ads::GoogleAds::V3::Resources::Feed::PlacesLocationFeedData::OAuthInfo]
            #     Immutable. Required authentication token (from OAuth API) for the email.
            #     This field can only be specified in a create request. All its subfields
            #     are not selectable.
            # @!attribute [rw] email_address
            #   @return [Google::Protobuf::StringValue]
            #     Email address of a Google My Business account or email address of a
            #     manager of the Google My Business account. Required.
            # @!attribute [rw] business_account_id
            #   @return [Google::Protobuf::StringValue]
            #     Plus page ID of the managed business whose locations should be used. If
            #     this field is not set, then all businesses accessible by the user
            #     (specified by email_address) are used.
            #     This field is mutate-only and is not selectable.
            # @!attribute [rw] business_name_filter
            #   @return [Google::Protobuf::StringValue]
            #     Used to filter Google My Business listings by business name. If
            #     business_name_filter is set, only listings with a matching business name
            #     are candidates to be sync'd into FeedItems.
            # @!attribute [rw] category_filters
            #   @return [Array<Google::Protobuf::StringValue>]
            #     Used to filter Google My Business listings by categories. If entries
            #     exist in category_filters, only listings that belong to any of the
            #     categories are candidates to be sync'd into FeedItems. If no entries
            #     exist in category_filters, then all listings are candidates for syncing.
            # @!attribute [rw] label_filters
            #   @return [Array<Google::Protobuf::StringValue>]
            #     Used to filter Google My Business listings by labels. If entries exist in
            #     label_filters, only listings that has any of the labels set are
            #     candidates to be synchronized into FeedItems. If no entries exist in
            #     label_filters, then all listings are candidates for syncing.
            class PlacesLocationFeedData
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods

              # Data used for authorization using OAuth.
              # @!attribute [rw] http_method
              #   @return [Google::Protobuf::StringValue]
              #     The HTTP method used to obtain authorization.
              # @!attribute [rw] http_request_url
              #   @return [Google::Protobuf::StringValue]
              #     The HTTP request URL used to obtain authorization.
              # @!attribute [rw] http_authorization_header
              #   @return [Google::Protobuf::StringValue]
              #     The HTTP authorization header used to obtain authorization.
              class OAuthInfo
                include Google::Protobuf::MessageExts
                extend Google::Protobuf::MessageExts::ClassMethods
              end
            end

            # Data used to configure an affiliate location feed populated with the
            # specified chains.
            # @!attribute [rw] chain_ids
            #   @return [Array<Google::Protobuf::Int64Value>]
            #     The list of chains that the affiliate location feed will sync the
            #     locations from.
            # @!attribute [rw] relationship_type
            #   @return [Google::Ads::GoogleAds::V3::Enums::AffiliateLocationFeedRelationshipTypeEnum::AffiliateLocationFeedRelationshipType]
            #     The relationship the chains have with the advertiser.
            class AffiliateLocationFeedData
              include Google::Protobuf::MessageExts
              extend Google::Protobuf::MessageExts::ClassMethods
            end
          end

          # FeedAttributes define the types of data expected to be present in a Feed. A
          # single FeedAttribute specifies the expected type of the FeedItemAttributes
          # with the same FeedAttributeId. Optionally, a FeedAttribute can be marked as
          # being part of a FeedItem's unique key.
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     ID of the attribute.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     The name of the attribute. Required.
          # @!attribute [rw] type
          #   @return [Google::Ads::GoogleAds::V3::Enums::FeedAttributeTypeEnum::FeedAttributeType]
          #     Data type for feed attribute. Required.
          # @!attribute [rw] is_part_of_key
          #   @return [Google::Protobuf::BoolValue]
          #     Indicates that data corresponding to this attribute is part of a
          #     FeedItem's unique key. It defaults to false if it is unspecified. Note
          #     that a unique key is not required in a Feed's schema, in which case the
          #     FeedItems must be referenced by their feed_item_id.
          class FeedAttribute
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Operation to be performed on a feed attribute list in a mutate.
          # @!attribute [r] operator
          #   @return [Google::Ads::GoogleAds::V3::Resources::FeedAttributeOperation::Operator]
          #     Output only. Type of list operation to perform.
          # @!attribute [r] value
          #   @return [Google::Ads::GoogleAds::V3::Resources::FeedAttribute]
          #     Output only. The feed attribute being added to the list.
          class FeedAttributeOperation
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # The operator.
            module Operator
              # Unspecified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Add the attribute to the existing attributes.
              ADD = 2
            end
          end
        end
      end
    end
  end
end
