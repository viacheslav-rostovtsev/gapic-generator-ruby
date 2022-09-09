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

require "test_helper"
require "faraday"
require "pp"
require 'pry'
require "googleauth"

#
# Tests for the REST server stream.
#
class FirestoreSimpleTest < Minitest::Test
  def test_simple
    @endpoint = "https://firestore.googleapis.com/v1/projects/client-debugging/databases/(default)/documents:runQuery"
    @conn = Faraday.new url: @endpoint do |conn|
        conn.headers = { "Content-Type" => "application/json" }
        conn.request :google_authorization,  ::Google::Auth::Credentials.default
        conn.request :retry
        conn.response :raise_error
        conn.adapter :net_http
    end

    request = <<-JSON 
    { parent: "projects/client-debugging/databases/(default)/documents",
      structuredQuery: {
        endAt: {
          before: true,
          values: [{
            referenceValue: "projects/client-debugging/databases/(default)/documents/ruby_enumberable_stream/V3AeKDzil93uEDN2Kl1S"
          }]
        },
        from: [{
          allDescendants: true,
          collectionId: "ruby_enumberable_stream",
        }],
        orderBy: [{
          direction: 'ASCENDING',
          field: {
            fieldPath: '__name__'
          }
        }],
      }
    }
    JSON

    @conn.post(@endpoint, request) do |req|
      i = 0
      req.options.on_data = Proc.new do |chunk, overall_received_bytes|
        i += 1
        p "Chunk #{i}/??, size: #{chunk.length}"
      end
    end

    fiber = Fiber.new do
      @conn.post(@endpoint, request) do |req|
        i = 0
        req.options.on_data = Proc.new do |chunk, overall_received_bytes|
          i += 1
          p "Chunk #{i}/??, size: #{chunk.length}"
          Fiber.yield chunk
        end
      end
    end

    fiber.resume
    fiber.resume
    fiber.resume

    puts "done"
  end
end
