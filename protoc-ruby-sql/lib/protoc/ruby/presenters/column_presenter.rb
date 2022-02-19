# frozen_string_literal: true

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

module Protoc
  module Ruby
    module Presenters
      class ColumnPresenter
        def initialize field
          @field = field
        end

        def name
          @field.name
        end

        def should_be_generated?
          !type_name.nil?
        end

        def not_null?
          name == "id" || name == "design_name" || foreign_key?
        end

        def foreign_key?
          name =~ /_id$/
        end

        def insert_invocation
          type_name == "BOOLEAN" ? "#{name} ? 1:0" : name
        end

        def foreign_key_table
          return nil unless foreign_key?
          ActiveSupport::Inflector.camelize(name.gsub(/_id$/, "")) + "s"
        end

        def type_name
          case @field.type
          when 1, 2                              then "DOUBLE"
          when 3, 4, 5, 6, 7, 13, 15, 16, 17, 18 then "INTEGER"
          when 9, 12                             then "TEXT"
          when 8                                 then "BOOLEAN"
          else
            return nil
          end
        end
      end
    end
  end
  end
  