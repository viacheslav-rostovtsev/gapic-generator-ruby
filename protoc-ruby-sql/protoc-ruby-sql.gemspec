# frozen_string_literal: true

require_relative "lib/protoc/ruby/sql/version"

Gem::Specification.new do |spec|
  spec.name = "protoc-ruby-sql"
  spec.version = Protoc::Ruby::Sql::VERSION
  spec.authors = ["Viacheslav Rostovtsev"]
  spec.email = ["virost@google.com"]

  spec.summary = "~"
  spec.description = "~"
  spec.homepage = "https://example.com/protoc-sql"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://example.com/protoc-sql"
  spec.metadata["changelog_uri"] = "https://example.com/protoc-sql"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gapic-generator", ">= 0.10"
  spec.add_dependency "protobuf", "~> 3.8"

  spec.add_development_dependency "google-style", "~> 1.25.1"
  spec.add_development_dependency "grpc-tools", "~> 1.41.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-autotest", "~> 1.0"
  spec.add_development_dependency "minitest-focus", "~> 1.0"
  spec.add_development_dependency "pry", ">= 0.14"
  spec.add_development_dependency "rake", ">= 12.0"
end
