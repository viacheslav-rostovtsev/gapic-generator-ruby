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
        module Errors
          # Container for enum describing possible CustomeClientLink errors.
          class CustomerClientLinkErrorEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible CustomerClientLink errors.
            module CustomerClientLinkError
              # Enum unspecified.
              UNSPECIFIED = 0

              # The received error code is not known in this version.
              UNKNOWN = 1

              # Trying to manage a client that already in being managed by customer.
              CLIENT_ALREADY_INVITED_BY_THIS_MANAGER = 2

              # Already managed by some other manager in the hierarchy.
              CLIENT_ALREADY_MANAGED_IN_HIERARCHY = 3

              # Attempt to create a cycle in the hierarchy.
              CYCLIC_LINK_NOT_ALLOWED = 4

              # Managed accounts has the maximum number of linked accounts.
              CUSTOMER_HAS_TOO_MANY_ACCOUNTS = 5

              # Invitor has the maximum pending invitations.
              CLIENT_HAS_TOO_MANY_INVITATIONS = 6

              # Attempt to change hidden status of a link that is not active.
              CANNOT_HIDE_OR_UNHIDE_MANAGER_ACCOUNTS = 7

              # Parent manager account has the maximum number of linked accounts.
              CUSTOMER_HAS_TOO_MANY_ACCOUNTS_AT_MANAGER = 8
            end
          end
        end
      end
    end
  end
end
