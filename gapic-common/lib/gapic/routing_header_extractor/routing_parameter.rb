# Copyright 2022 Google LLC
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

module Gapic
  # @private
  class RoutingHeaderExtractor
    # A collection of connected parameters for creating a routing header
    class RoutingParameter
      attr_reader :field_path
      attr_reader :regex
      attr_reader :key

      def initialize field_path, regex, key
        @field_path = field_path

        if regex.named_captures.count != 1
          raise "A routing parameter regex should contain exactly one named segment"
        end

        @regex = regex
        @key = key
      end
    end
  end
end
