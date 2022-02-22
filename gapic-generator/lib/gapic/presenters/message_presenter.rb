# frozen_string_literal: true

# Copyright 2018 Google LLC
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

require "active_support/inflector"

require "gapic/helpers/namespace_helper"

require "model/generation.pb"

module Gapic
  module Presenters
    ##
    # A presenter for proto messages.
    #
    class MessagePresenter
      include Gapic::Helpers::NamespaceHelper

      attr_accessor :message

      attr_accessor :self_model

      def initialize api, message, rpc_presenter: nil
        @api = api
        @message = message

        rpc_design_name = rpc_presenter.nil? ? "" : rpc_presenter.self_model.design_name
        rpc_id = rpc_presenter.nil? ? 0 : rpc_presenter.self_model.id

        @self_model = ::Model::Generation::MessageModel.new
        @self_model.design_name = "#{rpc_design_name}.#{@message.name}"
        @self_model.id =  Gapic::Schema::Api.string_to_stable_id self_model.design_name
        @self_model.rpc_model_id = rpc_id
        @self_model.name = @message.name
      end

      def model
        @model ||= begin
          model = ::Model::Generation::MessageModel.new
          model.design_name = self_model.design_name
          model.id =  self_model.id
          model.rpc_model_id = self_model.rpc_model_id
          model.name = self_model.name

          model.fields = fields.map(&:model)

          model
        end
      end

      def name
        @message.name
      end

      def doc_types
        type_name_full
      end

      def doc_description
        @message.docs_leading_comments
      end

      def default_value
        "{}"
      end

      def type_name_full
        message_ruby_type @message
      end

      def underscored_name
        ActiveSupport::Inflector.underscore name
      end

      def fields
        @fields = @message.fields.map { |f| FieldPresenter.new @api, self, f }
      end

      def nested_enums
        @nested_enums ||= @message.nested_enums.map { |e| EnumPresenter.new e }
      end

      def nested_messages
        @nested_messages ||= @message.nested_messages.map { |m| MessagePresenter.new @api, m }
      end

      protected

      def message_ruby_type message
        ruby_namespace @api, message.address.join(".")
      end
    end
  end
end
