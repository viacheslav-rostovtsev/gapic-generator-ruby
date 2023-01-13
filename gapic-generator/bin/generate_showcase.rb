$LOAD_PATH.unshift ::File.expand_path("../lib", __dir__)

require 'pry'
require "gapic/schema/api"
require "gapic/schema/request_param_parser"
require "gapic/schema/service_config_parser"
require "gapic/generator"
require "gapic/generators/default_generator"

##
# @param service [Symbol]
# @return [String]
def proto_input service
  File.binread "proto_input/#{service}_desc.bin"
end

##
# @param service [Symbol]
# @param params_override [Hash<String, String>, Hash{String(frozen)=>String(frozen)}, nil]
# @param params_purge [Array<String>, Array{String(frozen)}]
# @return [Google::Protobuf::Compiler::CodeGeneratorRequest]
def request service, params_override: nil, params_purge: nil
  request = Google::Protobuf::Compiler::CodeGeneratorRequest.decode proto_input(service)

  unless params_override.nil? && params_purge.nil?
    params_override ||= {}
    params_purge ||= []
    # create a parameter string for the override
    params_str = params_override.map { |name, value| "#{name}=#{value}" }.join(",")

    schema = Gapic::Generators::DefaultGeneratorParameters.default_schema
    params = Gapic::Schema::RequestParamParser.parse_parameters_string(request.parameter,
                                                                        param_schema: schema)
    # filter out parameters that are going to be overridden and purged and reconstruct the param string
    filtered_params = params.filter { |p| !params_override.key?(p.config_name) && !params_purge.include?(p.config_name)}
    filtered_params_str = Gapic::Schema::RequestParamParser.reconstruct_parameters_string filtered_params

    # comma to separate only if there are parameters left
    separator = filtered_params_str.empty? || params_str.empty? ? "" : ","

    # new param string with the overrides
    request.parameter = "#{filtered_params_str}#{separator}#{params_str}"
  end

  request
end

##
# @param service [Symbol]
# @param params_override [Hash<String, String>, Hash{String(frozen)=>String(frozen)}, nil]
# @param params_purge [Array<String>, Array{String(frozen)}]
# @return [Gapic::Schema::Api]
def api service, params_override: nil, params_purge: nil
  default_params = case service 
    when :showcase
      { "service-yaml" => "protofiles_input/google/showcase/v1beta1/showcase_v1beta1.yaml".freeze }
    when :testing
      grpc_service_config_paths = [
        "protofiles_input/testing/grpc_service_config/grpc_service_config.json",
        "protofiles_input/testing/grpc_service_config/grpc_service_config2.json"
      ]
      {
        "grpc_service_config" =>  grpc_service_config_paths.join(";"),
        "service-yaml" => "protofiles_input/testing/mixins/testing_service.yaml".freeze
      }
    else
      { }
    end

  params_override = default_params.merge(params_override || {})

  Gapic::Schema::Api.new request(service, params_override: params_override, params_purge: params_purge)
end

#ENV["GAPIC_RUBOCOP_SERVER"] = "1"
files = []

require 'ruby-prof'


profile = RubyProf::Profile.new()
profile.exclude_common_methods!

result = profile.profile do
  generator = Gapic::Generators::DefaultGenerator.new api(:showcase)
  files = generator.generate
end

p "#{files.count} files generated in #{result.threads.map(&:total_time).max.round(2)} seconds"

files.each do |file|
  File.write(File.join("expected_output/templates/showcase", file.name), file.content)
end

#printer = RubyProf::GraphPrinter.new(result)
printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.open("/tmp/report.html", "w"), :min_percent => 2)
