require_relative 'lib/gapic/info/scoop/version'

Gem::Specification.new do |spec|
  spec.name          = "gapic-info-scoop"
  spec.version       = Gapic::Info::Scoop::VERSION
  spec.authors       = ["Viacheslav Rostovtsev"]
  spec.email         = ["virost@google.com"]

  spec.summary       = %q{gapic-info-scoop.}
  spec.homepage      = "https://example.com/gapic-info-scoop"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://example.com/gapic-info-scoop"
  spec.metadata["changelog_uri"] = "https://example.com/gapic-info-scoop"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
