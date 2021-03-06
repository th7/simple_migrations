# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_migrations/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_migrations"
  spec.version       = SimpleMigrations::VERSION
  spec.authors       = ["Tyler Hartland"]
  spec.email         = ["tylerhartland7@gmail.com"]

  spec.summary       = 'SQL only migrations'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rake", "~> 12.1"

  spec.add_development_dependency 'pg', '~> 0.15'
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rspec", "~> 3.0"
end
