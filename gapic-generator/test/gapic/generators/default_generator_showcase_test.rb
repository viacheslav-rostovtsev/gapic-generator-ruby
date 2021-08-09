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

require "test_helper"
require "gapic/generators/default_generator"

class DefaultGeneratorShowcaseTest < GeneratorTest
  def test_showcase_generate
    showcase_api = api(:showcase)

    service = showcase_api.services.find { |s| s.name == "Messaging" }
    refute_nil service
    method = service.methods.find { |s| s.name == "ListBlurbs" }
    refute_nil method

    gem_presenter = Gapic::Presenters::GemPresenter.new showcase_api
    service_presenter = Gapic::Presenters::ServicePresenter.new gem_presenter, showcase_api, service
    presenter = Gapic::Presenters::MethodPresenter.new service_presenter, showcase_api, method

    require 'pry'
    binding.pry

    routing = presenter.routing_params
    refute_nil routing

    generator = Gapic::Generators::DefaultGenerator.new showcase_api
    generator.generate.each do |file|
      assert_equal expected_content(:showcase, file.name), file.content
    end
  end
end
