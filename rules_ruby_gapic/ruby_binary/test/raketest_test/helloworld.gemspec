require_relative 'lib/helloworld/version'

Gem::Specification.new do |spec|
  spec.name          = "helloworld"
  spec.version       = Helloworld::VERSION
  spec.authors       = ["Viacheslav Rostovtsev"]
  spec.email         = ["virost@google.com"]

  spec.summary       = "simple lib to test rake test"
  spec.homepage      = "http://example.com/helloworld"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://example.com/helloworld"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://example.com/helloworld"
  spec.metadata["changelog_uri"] = "http://example.com/helloworld"
  spec.require_paths = ["lib"]
end
