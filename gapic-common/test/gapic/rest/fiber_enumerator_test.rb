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

class FiberEnumeratorTest < Minitest::Test
  def test_threaded_fiber_enumerator
    iterator = Gapic::Rest::FiberEnumerator.new do 
      10.times do |ix|
        Fiber.yield ix
      end
    end

    stop_iteration_triggered = false
    vals = []
    loop do
      val = iterator.next
      vals << val
    rescue StopIteration
      stop_iteration_triggered = true
      break
    end
    assert stop_iteration_triggered
    assert_equal (0..9).to_a, vals
  end
end
