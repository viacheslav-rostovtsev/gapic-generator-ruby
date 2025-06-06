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

lib = File.expand_path "lib", __dir__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib
require "gapic/generator/cloud/version"

Gem::Specification.new do |spec|
  spec.name          = "gapic-generator-cloud"
  spec.version       = Gapic::Generator::Cloud::VERSION
  spec.authors       = ["Ernest Landrito", "Chris Smith", "Mike Moore"]
  spec.email         = ["landrito@google.com", "quartzmo@gmail.com",
                        "mike@blowmage.com"]

  spec.licenses      = ["Apache-2.0"]

  spec.summary       = "An API Client Generator for Ruby in Ruby!"
  spec.homepage      = "https://github.com/googleapis/gapic-generator-ruby"

  spec.files         = Dir.glob("bin/*") + Dir.glob("lib/**/*.rb") +
                       Dir.glob("templates/**/*.{rb,erb}") +
                       Dir.glob("*.md") +
                       ["LICENSE", "cloud-rubocop.yml"]
  spec.bindir        = "bin"
  spec.executables   = ["protoc-gen-ruby_cloud", "ruby-cloud-docker-entrypoint"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.1"

  spec.add_dependency "gapic-generator", "= #{Gapic::Generator::Cloud::VERSION}"
end
