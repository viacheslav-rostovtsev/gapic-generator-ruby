# Copyright 2021 Google LLC
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

require "gapic/routing_header_extractor/routing_parameter"

module Gapic
  # Extracts routing headers from a proto request message
  # according to the parameter setup
  class RoutingHeaderExtractor
    def initialize routing_parameters = nil
      @routing_parameters = routing_parameters || []
    end

    def with_extracted_parameter field_path:, regex:, key:
      RoutingHeaderExtractor.new @routing_parameters << RoutingParameter.new(field_path, regex, key)
    end

    def extract request_hash
      header_params = {}
      @routing_parameters.map do |routing_parameter|
        value = extract_value routing_parameter.field_path, routing_parameter.regex, request_hash
        header_params[routing_parameter.key] = value unless value.nil? || value.empty?
      end

      URI.encode_www_form header_params
    end

    private

    def extract_value field_path, regex, request_hash
      value = find_value field_path, request_hash
      regex.match(value)&.captures&.[](0)
    end

    def find_value field_path, request_hash
      return request_hash[field_path.to_sym] unless field_path.include? "."
      path_split = field_path.split(".").map(&:to_sym)

      value = request_hash
      path_split.each do |curr_field|
        # covers the case when in `foo.bar.baz`, `bar` is not a submessage field
        # or is a submessage field initialized with nil
        return nil unless value.is_a? ::Hash
        value = value[curr_field]
      end

      # covers the case where in `foo.bar.baz`, `baz` is still a submessage
      return value unless value.is_a? ::Hash
    end
  end
end
