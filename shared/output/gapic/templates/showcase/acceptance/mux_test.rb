require "minitest/autorun"
require "minitest/focus"
require "minitest/rg"
require "google/showcase/v1beta1/compliance"

class ComplianceTest < Minitest::Test
  def setup client=nil
    @client = new_compliance_rest_client
  end

  def new_compliance_rest_client
    Google::Showcase::V1beta1::Compliance::Rest::Client.new do |config|
      config.endpoint = "http://localhost:7469"
      config.credentials = :this_channel_is_insecure
    end
  end

  def test_mux
    mux_req = ::Google::Showcase::V1beta1::RepeatRequest.new
    mux_req.name = "One"
    mux_req.server_verify = false
    mux_req.info = ::Google::Showcase::V1beta1::ComplianceData.new
    mux_req.info.f_string = "foo"
    mux_req.info.f_child = ::Google::Showcase::V1beta1::ComplianceDataChild.new
    mux_req.info.f_child.f_string = "bar"

    response = @client.repeat_data_path_mux mux_req
    assert_equal "One", response.request.name

    mux_req = ::Google::Showcase::V1beta1::RepeatRequest.new
    mux_req.name = "Two"
    mux_req.server_verify = false
    mux_req.info = ::Google::Showcase::V1beta1::ComplianceData.new
    mux_req.info.f_string = "first/foo"
    mux_req.info.f_child = ::Google::Showcase::V1beta1::ComplianceDataChild.new
    mux_req.info.f_child.f_string = "second/bar"

    response = @client.repeat_data_path_mux mux_req
    assert_equal "Two", response.request.name
  end
end
