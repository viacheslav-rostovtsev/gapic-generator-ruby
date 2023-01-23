# frozen_string_literal: true

# Copyright 2019 Google LLC
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

require "tmpdir"
require "fileutils"
require "open3"

module Gapic
  ##
  # File Formatter
  class FileFormatter
    attr_reader :configuration
    attr_reader :files

    ##
    # Create a new file formatter object
    #
    def initialize configuration, files
      @configuration = configuration
      @files = format! configuration, files
    end

    protected

    def format! configuration, files
      starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

      add_args = ""
      out_files = if ENV["GAPIC_RUBOCOP_SERVER"]
        # STDERR.puts "Spawning and using rubocop server"
        # system("pkill -f rubocop")
        #Open3.capture2("rubocop", "--stop-server")

        #Process.spawn("rubocop --start-server")

        #STDERR.puts "Running inner format"
        #return inner_format! configuration, files, " --server"

        out_files = []
        Open3.popen3("rubocop --stdin --stderr --fix-layout --config #{configuration}") do |stdin, stdout, stderr, wait_thr|
          STDERR.puts "Running inner format"
          
          files.each do |file|
            STDERR.puts "#{file.name}"
            binding.pry
            stdin.write file.content
            content = stdout.read

            binding.pry
            content
          end

          STDERR.puts "stdout"
          STDERR.puts stdout.readlines
          STDERR.puts "stderr"
          STDERR.puts stderr.readlines
        end

        #STDERR.puts "Success: #{wait_thr.success?}, stdout: #{stdout}"
        # STDERR.puts "Running stop rubocop server"
        # system("pkill -f rubocop")
        out_files
      else
        inner_format! configuration, files
      end

      elapsed = (Process.clock_gettime(Process::CLOCK_MONOTONIC) - starting).round(2)
      STDERR.puts "formatting took #{elapsed}s"
      out_files
    end

    def inner_format! configuration, files, add_args=""
      Dir.mktmpdir do |dir|
        Dir.mktmpdir do |dir2|
          files.each do |file|
            write_file dir, file
          end

          stdout_str, status = Open3.capture2("rubocop#{add_args} -o /dev/null --cache false --fix-layout --config #{configuration} #{dir}")
          STDERR.puts "status: #{status.success?}"
          # STDERR.puts File.readlines("#{dir}/foo")

          files.each do |file|
            read_file dir, file
          end
        end
      end
    end

    def write_file dir, file
      tmp_file = File.join dir, file.name
      FileUtils.mkdir_p File.dirname tmp_file
      File.write tmp_file, file.content
    end

    def read_file dir, file
      tmp_file = File.join dir, file.name
      file.content = File.read tmp_file
    end
  end
end
