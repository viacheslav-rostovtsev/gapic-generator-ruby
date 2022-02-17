# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'

module Model
  module Package
    ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

    ##
    # Message Classes
    #
    class FileDescriptorSet < ::Protobuf::Message; end
    class FileDescriptorProto < ::Protobuf::Message
      class OptimizeMode < ::Protobuf::Enum
        define :UNKNOWN, 0
        define :SPEED, 1
        define :CODE_SIZE, 2
        define :LITE_RUNTIME, 3
      end

    end



    ##
    # Message Fields
    #
    class FileDescriptorSet
      optional :uint64, :id, 6952
      optional :string, :design_name, 6953
      repeated ::Model::Package::FileDescriptorProto, :file_descriptor_protos, 1
    end

    class FileDescriptorProto
      optional :uint64, :id, 6952
      optional :string, :design_name, 6953
      optional :uint64, :descriptor_set_id, 6954
      optional :string, :name, 1
      optional :string, :package, 2
      optional :string, :syntax, 12
      optional :string, :java_package, 101
      optional :string, :java_outer_classname, 108
      optional :bool, :java_multiple_files, 110
      optional :bool, :java_string_check_utf8, 127
      optional ::Model::Package::FileDescriptorProto::OptimizeMode, :optimize_for, 109
      optional :string, :go_package, 111
      optional :bool, :cc_generic_services, 116
      optional :bool, :java_generic_services, 117
      optional :bool, :py_generic_services, 118
      optional :bool, :php_generic_services, 142
      optional :bool, :deprecated, 123
      optional :bool, :cc_enable_arenas, 131
      optional :string, :objc_class_prefix, 136
      optional :string, :csharp_namespace, 137
      optional :string, :swift_prefix, 139
      optional :string, :php_class_prefix, 140
      optional :string, :php_namespace, 141
      optional :string, :php_metadata_namespace, 144
      optional :string, :ruby_package, 145
    end

  end

end

