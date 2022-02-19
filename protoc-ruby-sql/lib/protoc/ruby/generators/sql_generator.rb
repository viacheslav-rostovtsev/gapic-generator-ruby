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

require "gapic/generators/default_generator"
require "gapic/presenters"

require "protoc/ruby/presenters"

module Protoc
  module Ruby
    module Generators
        # The generator orchestrates the rendering of templates for Google Cloud
        # projects.
        class SqlGenerator < ::Gapic::Generators::DefaultGenerator
        # Initializes the generator.
        #
        # @param api [Gapic::Schema::Api] The API model/context to
        #   generate.
        def initialize api
            super

            # Configure to use prefer Google Cloud templates
            use_templates! File.join __dir__, "../../../../templates"
        end

        # Generates all the files for the API.
        #
        # @return [Array<
        #   Google::Protobuf::Compiler::CodeGeneratorResponse::File>]
        #   The files that were generated for the API.
        def generate
          files = []
  
          gem = Gapic::Presenters.gem_presenter @api
  
          gem.proto_files.each do |proto_file|
            presenter = ::Protoc::Ruby::Presenters::DbPresenter.new gem.namespace, proto_file.messages

            files << g("sql_create.erb", "sql_create.rb", db_presenter: presenter)
            files << g("sql_insert.erb", "sql_insert.rb", db_presenter: presenter)
          end
  
          format_files files
  
          files
        end

      end
    end
  end
end

