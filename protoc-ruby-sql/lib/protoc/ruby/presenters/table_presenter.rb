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

require "protoc/ruby/presenters/column_presenter"

module Protoc
  module Ruby
    module Presenters
      class TablePresenter
        def initialize message
          @message = message
        end

        def name
          @message.name + "s"
        end

        def method_name
          @message.underscored_name
        end

        def columns
          columns_all.select(&:should_be_generated?)
        end

        def columns_all
          @message.fields.map { |f| ColumnPresenter.new f }
        end

        def foreign_keys?
          columns.any?(&:foreign_key?)
        end

        def foreign_keys
          columns.select(&:foreign_key?)
        end
      end
    end
  end
  end
  