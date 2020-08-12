# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""
Rules for generating ruby code with protoc
including rules for ruby, grpc-ruby, and various flavors of gapic-generator-ruby
"""
load("@com_google_api_codegen//rules_gapic:gapic.bzl", "proto_custom_library", "GapicInfo")

##
# An implementation of the _ruby_gapic_library_add_gapicinfo
#
def _ruby_gapic_library_add_gapicinfo_impl(ctx):
  return [
    DefaultInfo(files = depset(direct = [ctx.file.output])),
    GapicInfo(),
  ]

##
# A rule that adds the GapicInfo provider to the input
# used to mark the result of the gapic-generator-ruby plugin
# to distinguish it from the output of other plugins (e.g. grpc)
#
_ruby_gapic_library_add_gapicinfo = rule(
  _ruby_gapic_library_add_gapicinfo_impl,
  attrs = {
    "output": attr.label(allow_single_file = True)
  }
)

##
# A macro over the proto_custom_library that generates a library
# using the provided entrypoint
#
# name: name of the rule
# srcs: proto files wrapped in the proto_library rule
# plugin: a label to the ruby_binary rule wrapping the plugin entrypoint
# generator_params: a string-string dictionary of the generator parameters
#   (e.g. :gem.:name)
# yml_configs: a list of labels of the yaml configs (or an empty list)
# grpc_service_config: a label to the grpc service config
#
def _ruby_gapic_library(
  name,
  srcs,
  plugin,
  generator_params,
  yml_configs,
  grpc_service_config,
  **kwargs):

  srcjar_target_name = name
  srcjar_output_suffix = ".srcjar"

  name_srcjar = "{name}_srcjar".format(name = name)

  opt_args = []
  if generator_params:
    for key, value in generator_params.items():
      escaped_value = _escape_config_value(value)
      opt_args.append("{key}={value}".format(key = key, value = escaped_value))

  opt_file_args = {}
  if grpc_service_config:
    opt_file_args[grpc_service_config] = "grpc_service_config"

  if yml_configs:
    for file_label in yml_configs:
      opt_file_args[file_label] = "configuration"

  proto_custom_library(
    name = name_srcjar,
    deps = srcs,
    plugin = plugin,
    opt_args = opt_args,
    opt_file_args = opt_file_args,
    output_type = "ruby_gapic",
    output_suffix = srcjar_output_suffix,
    **kwargs
  )
  _ruby_gapic_library_add_gapicinfo(
    name = name,
    output = ":{name_srcjar}".format(name_srcjar = name_srcjar),
  )

##
# A macro over the proto_custom_library that generates a library
# using the gapic-generator entrypoint
#
# name: name of the rule
# generator_params: a string-string dictionary of the generator parameters
#   (e.g. :gem.:name)
# srcs: proto files wrapped in the proto_library rule
# yml_configs: a list of labels of the yaml configs (or an empty list)
# grpc_service_config: a label to the grpc service config
#
def ruby_gapic_library(
  name,
  srcs,
  generator_params = {},
  yml_configs = [],
  grpc_service_config = None,
  **kwargs):
  
  _ruby_gapic_library(
    name,
    srcs,
    Label("@gapic_generator_ruby//rules_ruby_gapic:gapic_generator_ruby"),
    generator_params,
    yml_configs,
    grpc_service_config
  )

def ruby_gapic_bundler_library(
  name,
  srcs,
  generator_params = {},
  yml_configs = [],
  grpc_service_config = None,
  **kwargs):
  
  _ruby_gapic_library(
    name,
    srcs,
    Label("@gapic_generator_ruby//rules_ruby_gapic/gapic-generator:gapic_generator_ruby_bundler"),
    generator_params,
    yml_configs,
    grpc_service_config
  )

##
# A macro over the proto_custom_library that generates a library
# using the gapic-generator-cloud entrypoint
#
# name: name of the rule
# srcs: proto files wrapped in the proto_library rule
# ruby_cloud_params a string-string dictionary of the cloud generator parameters
#   (e.g. :gem.:name)
# grpc_service_configs: a list of labels of the grpc service configs (or an empty list)
#
def ruby_gapic_cloud_library(
  name,
  srcs,
  ruby_cloud_params = {},
  grpc_service_config = None,
  **kwargs):
  
  _ruby_gapic_library(
    name,
    srcs,
    Label("@gapic_generator_ruby//rules_ruby_gapic:gapic_generator_cloud"),
    ruby_cloud_params,
    [],
    grpc_service_config
  )

def ruby_gapic_cloud_bundler_library(
  name,
  srcs,
  ruby_cloud_params = {},
  grpc_service_config = None,
  **kwargs):
  
  _ruby_gapic_library(
    name,
    srcs,
    Label("@gapic_generator_ruby//rules_ruby_gapic/gapic-generator-cloud:gapic_generator_cloud_bundler"),
    ruby_cloud_params,
    [],
    grpc_service_config
  )

##
# A macro over the proto_custom_library that generates a library
# using the gapic-generator-ads entrypoint
#
# name: name of the rule
# srcs: proto files wrapped in the proto_library rule
# yml_configs: a list of labels of the yaml configs (or an empty list)
# grpc_service_config: a label to the grpc service config
#
def ruby_gapic_ads_library(
  name,
  srcs,
  ruby_ads_params = {},
  grpc_service_config = None,
  **kwargs):
  
  _ruby_gapic_library(
    name,
    srcs,
    Label("@gapic_generator_ruby//rules_ruby_gapic:gapic_generator_ads"),
    ruby_ads_params,
    [],
    grpc_service_config
  )

def ruby_gapic_ads_library(
  name,
  srcs,
  ruby_ads_params = {},
  grpc_service_config = None,
  **kwargs):
  
  _ruby_gapic_library(
    name,
    srcs,
    Label("@gapic_generator_ruby//rules_ruby_gapic/gapic-generator-ads:gapic_generator_ads_bundler"),
    ruby_ads_params,
    [],
    grpc_service_config
  )

##
# A macro over the proto_custom_library that runs protoc with a ruby plugin
#
# name: name of the rule
# deps: proto files wrapped in the proto_library rule
#
def ruby_proto_library(name, deps, **kwargs):
  # Build zip file of protoc output
  proto_custom_library(
    name = name,
    deps = deps,
    output_type = "ruby",
    output_suffix = ".srcjar",
    **kwargs
  )

##
# A macro over the proto_custom_library that runs protoc with a grpc-ruby plugin
#
# name: name of the rule
# srcs: proto files wrapped in the proto_library rule
# deps: a ruby_proto_library output
#
def ruby_grpc_library(name, srcs, deps, **kwargs):
  # Build zip file of grpc output
  proto_custom_library(
    name = name,
    deps = srcs,
    plugin = Label("@com_github_grpc_grpc//src/compiler:grpc_ruby_plugin"),
    output_type = "grpc",
    output_suffix = ".srcjar",
    **kwargs
  )

##
# Escapes symbols in the config parameters values that would break the command line
# when folded into the --opt_ruby_gapic protoc command line parameter
#
def _escape_config_value(value):
  return value.replace("\\", "\\\\").replace(",", "\\,").replace( "=", "\\=")
