require "helper"
require "garbage/garbage_pb"
require "garbage/garbage_services_pb"

class Anytest < Minitest::Test
  WithAny = ::So::Much::Trash::WithAny

  # Testing that a message with Any but no content works
  # (trivial case)
  def test_any_nocontent
    withany_no_content = ::So::Much::Trash::WithAny.new name: "foo"
    to_json_no_content = withany_no_content.to_json emit_defaults: true
    withany_nocontent_readback = ::So::Much::Trash::WithAny.decode_json to_json_no_content
    assert_equal "foo", withany_nocontent_readback.name
    assert_nil withany_nocontent_readback.content
  end

  # Testing that a message with Any of a known message type packs-unpacks
  # (baseline)
  def test_any_pack_unpack_decode
    # pack-unpack test
    require "google/protobuf/well_known_types"
    any = ::Google::Protobuf::Any.new
    ts = Google::Protobuf::Duration.new(seconds: 123, nanos: 456)
    any.pack ts

    withany_message_content = ::So::Much::Trash::WithAny.new name: "foo", content: any
    json_message_content = withany_message_content.to_json emit_defaults: true
    withany_message_readback = ::So::Much::Trash::WithAny.decode_json json_message_content
    assert_equal withany_message_readback.content.type_url, "type.googleapis.com/google.protobuf.Duration"

    # unpack without explicitly packing from a variable of the type
    json_timestamp_content = '{"name":"foo","content":{"@type":"type.googleapis.com/google.protobuf.Timestamp","value":"1970-01-01T03:25:45.000006789Z"}}'
    withany_timestamp_decode = ::So::Much::Trash::WithAny.decode_json json_timestamp_content
    assert_equal withany_timestamp_decode.content.type_url, "type.googleapis.com/google.protobuf.Timestamp"
  end

  # Testing behaviour around types unknown at the time of unpacking
  def test_any_unknown_type
    json_color_content = '{"name":"foo","content":{"@type":"type.googleapis.com/google.type.Color","red":255,"green":0,"blue":0}}'
    ex = assert_raises(Google::Protobuf::ParseError) do
      withany_color_decode = ::So::Much::Trash::WithAny.decode_json json_color_content
    end
    assert_match /Error parsing JSON.+Type was not found/, ex.message
   
    json_color_content = '{"name":"foo","content":{"@type":"type.googleapis.com/google.type.Color","red":255,"green":0,"blue":0}}'

    assert_raises do
      withany_color_decode = WithAny.decode_json json_color_content
    end

    require 'google/type/color_pb'
    # does not throw
    withany_color_decode = WithAny.decode_json json_color_content

    assert_equal withany_color_decode.content.type_url, "type.googleapis.com/google.type.Color"
  end
end
