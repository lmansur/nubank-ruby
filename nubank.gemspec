
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nubank/version"

Gem::Specification.new do |spec|
  spec.name          = "nubank_client"
  spec.version       = Nubank::VERSION
  spec.authors       = ["Lucas Mansur"]
  spec.email         = ["lucas.mansur2@gmail.com"]

  spec.summary       = %q{Unofficial client for the Nubank API}
  spec.description   = %q{This is an unofficial client of the undocumented Nubank API. It may be unstable. You may have your access temporarily blocked if used too much. Use at your own risk.}
  spec.homepage      = "https://github.com/lmansur/nubank-ruby"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http", "~> 4.0"
  spec.add_dependency "dry-struct", "~> 0.6"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
end
