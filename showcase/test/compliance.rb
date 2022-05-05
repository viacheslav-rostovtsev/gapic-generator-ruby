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

require "minitest/autorun"
require "minitest/focus"
require "google/showcase/v1beta1/compliance"
require "pp"
require 'pry'
#binding.pry

class ComplianceTest < Minitest::Test
  def setup
    @client = new_compliance_rest_client
  end

  def new_compliance_rest_client
    ::Google::Showcase::V1beta1::Compliance::Rest::Client.new do |config|
      config.endpoint = "http://localhost:7469"
      config.credentials = :this_channel_is_insecure
    end
  end

  def test_compliance
    return unless @client

    compliance = JSON.load(File.open "./test/compliance_suite.json")
    compliance["group"].each do |group|
      puts "Group: #{group["name"]}"
      group["requests"].each do |request|
        reqjson = request.to_json
        req = ::Google::Showcase::V1beta1::RepeatRequest.decode_json reqjson
        puts "Request: #{request["name"]}"
        group["rpcs"].each do |rpc_full_name|
          rpc_name = underscore(rpc_full_name.split(".")[1])
          puts "Rpc: #{rpc_name}"
          res = @client.send rpc_name.to_sym, req
          pp res
        end
      end
    end
    assert true
  end

  def underscore str
    str = str.gsub(/::/, '/')
    str = str.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
    str = str.gsub(/([a-z\d])([A-Z])/,'\1_\2')
    str.downcase
  end

end
