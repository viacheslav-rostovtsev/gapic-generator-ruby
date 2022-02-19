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

require "protoc/ruby/presenters/table_presenter"

module Protoc
  module Ruby
    module Presenters
      class DbPresenter
        def initialize namespace, messages
          @namespace = namespace
          @messages = messages
        end

        def tables
          @messages.map { |m| TablePresenter.new m }
        end

        def create_namespace
          "#{@namespace}::Create"
        end

        def insert_namespace
          "#{@namespace}::Insert"
        end
      end
    end
  end
end
  