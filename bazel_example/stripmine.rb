#!/usr/bin/env ruby
require 'pp'
commands = %x[bazel query "..." | grep -- -ruby].split
pp commands

repos = commands.map do |target|
  
  [target.split(":")[1], "bazel build #{target}"]
end.to_h
pp repos


require 'open3'

rlen = repos.length
i = 0

repos.each do |repo, cmd|
  i+=1
  puts "Running #{i}/#{rlen} :: Build> #{cmd}"
  stdout, stderr, status = Open3.capture3(cmd)

  tar_file = /bazel-bin.*\.tar\.gz/.match(stderr)[0]
  model_file = "#{repo}/model.json"
  tar_cmd = "tar xvfz #{tar_file} #{model_file}"
  puts "Running #{i}/#{rlen} :: Tar> #{tar_cmd}"
  stdout, stderr, status = Open3.capture3(tar_cmd)

  final_file = "#{repo[0...-5]}.model.json"
  mv_cmd = "mv ./#{model_file} ./#{final_file}"
  puts "Running #{i}/#{rlen} :: Mv> #{mv_cmd}"
  stdout, stderr, status = Open3.capture3(mv_cmd)

  rm_cmd = "rm -r ./#{repo}"
  puts "Running #{i}/#{rlen} :: Rm> #{rm_cmd}"
  stdout, stderr, status = Open3.capture3(rm_cmd)
end
