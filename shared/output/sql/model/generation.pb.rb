# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'

module Model
  module Generation
    ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

    ##
    # Message Classes
    #
    class GemModel < ::Protobuf::Message; end
    class PackageModel < ::Protobuf::Message; end
    class ServiceModel < ::Protobuf::Message; end
    class RpcModel < ::Protobuf::Message; end


    ##
    # Message Fields
    #
    class GemModel
      optional :uint64, :id, 6952
      optional :string, :design_name, 6953
      optional :string, :name, 1
      repeated ::Model::Generation::PackageModel, :packages, 2
    end

    class PackageModel
      optional :uint64, :id, 6952
      optional :string, :design_name, 6953
      optional :uint64, :gem_model_id, 6954
      optional :string, :name, 1
      repeated ::Model::Generation::ServiceModel, :services, 2
      optional :string, :ruby_namespace, 101
    end

    class ServiceModel
      optional :uint64, :id, 6952
      optional :string, :design_name, 6953
      optional :uint64, :package_model_id, 6954
      optional :string, :name, 1
      repeated ::Model::Generation::RpcModel, :rpcs, 2
    end

    class RpcModel
      optional :uint64, :id, 6952
      optional :string, :design_name, 6953
      optional :uint64, :service_model_id, 6954
      optional :string, :rpc_name, 1
      optional :string, :input_name, 2
      optional :string, :output_name, 3
      optional :bool, :generate_implicit_headers, 4
      optional :bool, :generate_explicit_headers, 5
      optional :string, :arity, 6
    end

  end

end

