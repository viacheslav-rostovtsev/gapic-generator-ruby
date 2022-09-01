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

require "json"

module Gapic
  module Rest
    class StreamingParser
      def initialize
        @current_partial_json = ""
        @parsed_objects = []
      end
      
      def append_parse! chunk
        # Invariant: @_obj is always either a part of a single JSON object or the entire JSON object.
        # Hence, it's safe to strip whitespace, commans and array brackets. These characters
        # are only added before @_obj is a complete JSON object and essentially can be flushed.
        if @current_partial_json == ""
          chunk = chunk.lstrip # strip whitespace.
          # Eat array delimiter characters.
          if chunk[0] == "[" || chunk[0] == "," || chunk[0] == "]"
            chunk = chunk[1..-1]
          end
        end

        chunk.chars.each do |char|
          @current_partial_json += char
          next unless char == "}"

          begin
            # Two choices here: append a Ruby object into
            # ready_objs or a string. Going with the latter here.
            JSON.parse(@_obj)
            @parsed_objects.append @_obj
            @current_partial_json = ""
          rescue JSON::ParserError
            next
          end
        end
      end

      def any?
        @parsed_objects.any?
      end

      def next!
        @parsed_objects.shift
      end
    end
  end
end
