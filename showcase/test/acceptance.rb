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
require "google/showcase/v1beta1/echo"

class EchoTest < Minitest::Test
  def setup client=nil
    @client = client
  end

  def test_echo
    return unless @client

    response = @client.echo content: "hi there!"
    assert_equal "hi there!", response.content
  end
end

class EchoRestTest < EchoTest
  def setup
    super new_echo_rest_client
  end

  def new_echo_rest_client
    Google::Showcase::V1beta1::Echo::Rest::Client.new do |config|
      config.endpoint = "http://localhost:7469"
      config.credentials = :this_channel_is_insecure
    end
  end
end
