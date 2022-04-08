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
require "gapic/routing_header_extractor"

##
# Input matching ('given annotation X and input message Y, header should be Z')
# tests for the Explicit Routing Headers.
# The structure of these tests is lifted from the `routing.proto`.
# The tests mirror routing header tests in the gapic-generator.
#
class RoutingHeaderExtractorTest < Minitest::Test
  # Extracting a field from the request to put into the routing header
  # unchanged, with the key equal to the field name.
  def test_simple_extraction
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
        field_path: "app_profile_id",
        regex: %r{^(?<app_profile_id>.*)$},
        key: "app_profile_id"
      )

    test_cases = [
      {
        request: example_request(app_profile_id: "foo.123"),
        expected: "app_profile_id=foo.123"
      },
      {
        request: example_request(app_profile_id: "projects/100"),
        expected: "app_profile_id=projects%2F100"
      },
      {
        request: example_request(app_profile_id: ""),
        expected: ""
      }
    ]

    assert_header_matches extractor, test_cases
  end

  # Extracting a field from the request to put into the routing header
  # unchanged, with the key different from the field name.
  def test_rename_extraction
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
      field_path: "app_profile_id",
      regex: %r{^(?<routing_id>.*)$},
      key: "routing_id"
    )

    test_cases = [
      {
        request: example_request(app_profile_id: "foo.123"),
        expected: "routing_id=foo.123"
      },
      {
        request: example_request(app_profile_id: "projects/100"),
        expected: "routing_id=projects%2F100"
      },
      {
        request: example_request(app_profile_id: ""),
        expected: ""
      }
    ]

    assert_header_matches extractor, test_cases
  end

  # Extracting a field from the request's sub-message.
  # Using a header key with a `.` in it.
  def test_nested_field
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
      field_path: "sub.name",
      regex: %r{^subs/(?<sub_name>[^/]+)$},
      key: "sub_name"
    ).with_extracted_parameter(
      field_path: "app_profile_id",
      regex: %r{^(?<legacy.routing_id>.*)$},
      key: "legacy.routing_id"
    )

    test_cases = [
      {
        request: example_request(app_profile_id: "routes/200"),
        expected: "legacy.routing_id=routes%2F200"
      },
      {
        request: example_request(app_profile_id: "routes/200", sub_name: ""),
        expected: "legacy.routing_id=routes%2F200"
      },
      {
        request: example_request(app_profile_id: "routes/200", sub_name: "subs/100"),
        expected: "sub_name=100&legacy.routing_id=routes%2F200"
      }
    ]

    assert_header_matches extractor, test_cases
  end

  # Extracting a field from the request to put into the routing
  # header, while matching a path template syntax on the field's value.
  def test_field_match
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
        field_path: "table_name",
        regex: %r{^(?<table_name>projects/[^/]+/instances/[^/]+(?:/.*)?)$},
        key: "table_name"
      ).with_extracted_parameter(
        field_path: "table_name",
        regex: %r{^(?<table_name>regions/[^/]+/zones/[^/]+(?:/.*)?)$},
        key: "table_name"
      )

    test_cases = [
      {
        request: example_request(table_name: "projects/100/instances/200"),
        expected: "table_name=projects%2F100%2Finstances%2F200"
      },
      {
        request: example_request(table_name: "projects/100/instances/200/whatever"),
        expected: "table_name=projects%2F100%2Finstances%2F200%2Fwhatever"
      },
      {
        request: example_request(table_name: "regions/100/zones/200"),
        expected: "table_name=regions%2F100%2Fzones%2F200"
      },
      {
        request: example_request(table_name: "foo"),
        expected: ""
      },
    ]

    assert_header_matches extractor, test_cases
  end

  # Extracting a single routing header key-value pair by matching a
  # template syntax on (a part of) a single request field.
  def test_simple_match
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<routing_id>projects/[^/]+)(?:/.*)?$},
      key: "routing_id"
    )

    test_cases = [
      {
        request: example_request(table_name: "projects/100"),
        expected: "routing_id=projects%2F100"
      },
      {
        request: example_request(table_name: "projects/100/instances/200"),
        expected: "routing_id=projects%2F100"
      },
      {
        request: example_request(table_name: "regions/10/projects/100"),
        expected: ""
      },
      {
        request: example_request(table_name: "foo"),
        expected: ""
      }
    ]

    assert_header_matches extractor, test_cases
  end

  # Extracting a single routing header key-value pair by matching
  # several conflictingly named path templates on (parts of) a single request
  # field. The last template to match "wins" the conflict.
  def test_overlapping_patterns
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<routing_id>projects/[^/]+)(?:/.*)?$},
      key: "routing_id"
    ).with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<routing_id>projects/[^/]+/instances/[^/]+)(?:/.*)?$},
      key: "routing_id"
    )

    test_cases = [
      {
        request: example_request(table_name: "projects/100"),
        expected: "routing_id=projects%2F100"
      },
      {
        request: example_request(table_name: "projects/100/shards/300"),
        expected: "routing_id=projects%2F100%2Fshards%2F300"
      },
      {
        request: example_request(table_name: "projects/100/instances/200"),
        expected: "routing_id=projects%2F100%2Finstances%2F200"
      },
      {
        request: example_request(table_name: "projects/100/instances/200/shards/300"),
        expected: "routing_id=projects%2F100%2Finstances%2F200"
      },
      {
        request: example_request(table_name: "orgs/1/projects/100/instances/200"),
        expected: ""
      },
      {
        request: example_request(table_name: "foo"),
        expected: ""
      }
    ]
  end

  # Extracting multiple routing header key-value pairs by matching
  # several non-conflicting path templates on (parts of) a single request field.
  # Make the templates strict, so that if the `table_name` does not
  # have an instance information, nothing is sent.
  def test_multiple_keyvaluepairs_strict
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
        field_path: "table_name",
        regex: %r{^(?<project_id>projects/[^/]+)/instances/[^/]+(?:/.*)?$},
        key: "project_id"
      ).with_extracted_parameter(
        field_path: "table_name",
        regex: %r{^projects/[^/]+/(?<instance_id>instances/[^/]+)(?:/.*)?$},
        key: "instance_id"
      )

    test_cases = [
      {
        request: example_request(table_name: "projects/100/instances/200/tables/300"),
        expected: "project_id=projects%2F100&instance_id=instances%2F200"
      },
      {
        request: example_request(table_name: "projects/100"),
        expected: ""
      }
    ]

    assert_header_matches extractor, test_cases
  end

  # Extracting multiple routing header key-value pairs by matching
  # several non-conflicting path templates on (parts of) a single request field.
  # Make the templates loose, so that if the `table_name` does not
  # have an instance information, just the project id part is sent.
  def test_multiple_keyvaluepairs_loose
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<project_id>projects/[^/]+)(?:/.*)?$},
      key: "project_id"
    ).with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^projects/[^/]+/(?<instance_id>instances/[^/]+)(?:/.*)?$},
      key: "instance_id"
    )

    test_cases = [
      {
        request: example_request(table_name: "projects/100/instances/200/tables/300"),
        expected: "project_id=projects%2F100&instance_id=instances%2F200"
      },
      {
        request: example_request(table_name: "projects/100"),
        expected: "project_id=projects%2F100"
      }
    ]

    assert_header_matches extractor, test_cases
  end


  # Extracting multiple routing header key-value pairs by matching
  # several path templates on multiple request fields.
  def test_multple_request_fields
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<project_id>projects/[^/]+)(?:/.*)?$},
      key: "project_id"
    ).with_extracted_parameter(
      field_path: "app_profile_id",
      regex: %r{^(?<routing_id>.*)$},
      key: "routing_id"
    )

    test_cases = [
      {
        request: example_request(table_name: "projects/100/instances/200/tables/300",
                                 app_profile_id: "profiles/profile_17"),
        expected: "project_id=projects%2F100&routing_id=profiles%2Fprofile_17"
      },
      {
        request: example_request(table_name: "projects/100"),
        expected: "project_id=projects%2F100"
      }
    ]

    assert_header_matches extractor, test_cases
  end

  # Extracting a single routing header key-value pair by matching
  # several conflictingly named path templates on several request fields. The
  # last template to match "wins" the conflict.
  def test_multple_conflicts_and_request_fields
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<routing_id>projects/[^/]+)(?:/.*)?$},
      key: "routing_id"
    ).with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<routing_id>regions/[^/]+)(?:/.*)?$},
      key: "routing_id"
    ).with_extracted_parameter(
      field_path: "app_profile_id",
      regex: %r{^(?<routing_id>.*)$},
      key: "routing_id"
    )

    test_cases = [
      {
        request: example_request(table_name: "projects/100/instances/200/tables/300",
                                 app_profile_id: "profiles/profile_17"),
        expected: "routing_id=profiles%2Fprofile_17"
      },
      {
        request: example_request(table_name: "regions/100"),
        expected: "routing_id=regions%2F100"
      }
    ]

    assert_header_matches extractor, test_cases
  end

  # Test a complex scenario with a kitchen sink of concerns
  def test_complex_scenario
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^projects/[^/]+/(?<table_location>instances/[^/]+)/tables/[^/]+$},
      key: "table_location"
    ).with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<table_location>regions/[^/]+/zones/[^/]+)/tables/[^/]+$},
      key: "table_location"
    ).with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<routing_id>projects/[^/]+)(?:/.*)?$},
      key: "routing_id"
    ).with_extracted_parameter(
      field_path: "app_profile_id",
      regex: %r{^(?<routing_id>.*)$},
      key: "routing_id"
    ).with_extracted_parameter(
      field_path: "app_profile_id",
      regex: %r{^profiles/(?<routing_id>[^/]+)$},
      key: "routing_id"
    )

    test_cases = [
      {
        request: example_request(table_name: "projects/100/instances/200/tables/300",
                                 app_profile_id: "profiles/profile_17"),
        expected: "table_location=instances%2F200&routing_id=profile_17"
      },
      {
        request: example_request(table_name: "projects/100/instances/200/tables/300",
                                 app_profile_id: "profile_17"),
        expected: "table_location=instances%2F200&routing_id=profile_17"
      },
      {
        request: example_request(table_name: "projects/100/instances/200/tables/300",
                                 app_profile_id: ""),
        expected: "table_location=instances%2F200&routing_id=projects%2F100"
      }
    ]

    assert_header_matches extractor, test_cases
  end

  # Test percent-encoding
  def test_encoding
    extractor = Gapic::RoutingHeaderExtractor.new.with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^(?<project_id>projects/[^/]+)(?:/.*)?$},
      key: "project_id"
    ).with_extracted_parameter(
      field_path: "table_name",
      regex: %r{^projects/[^/]+/(?<instance_id>instances/[^/]+)(?:/.*)?$},
      key: "instance_id"
    )

    test_cases = [
      {
        request: example_request(table_name: "projects/100/instances/200/tables/300"),
        expected: "project_id=projects%2F100&instance_id=instances%2F200"
      },
      {
        request: example_request(table_name: "projects/_-_._/instances/_=_#_"),
        expected: "project_id=projects%2F_-_._&instance_id=instances%2F_%3D_%23_"
      }
    ]

    assert_header_matches extractor, test_cases
  end

  private

  def assert_header_matches extractor, test_cases
    test_cases.each do |test_case|
      request = test_case[:request].to_h
      expected = test_case[:expected]

      err_str = "Test case:\nRequest: \n#{request.pretty_inspect}\nExpected: \n#{expected}"

      header = extractor.extract request
      err_str = "#{err_str}\nHeader formed: \n #{header}"

      assert_equal expected, header, err_str
    end
  end

  def example_request(table_name: nil, app_profile_id: nil, sub_name: nil)
    sub = Gapic::Examples::Routing::SubRequest.new name: sub_name unless sub_name.nil?
    Gapic::Examples::Routing::Request.new table_name: table_name, app_profile_id: app_profile_id, sub: sub
  end
end
