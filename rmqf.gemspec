# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rmqf/version'

Gem::Specification.new do |spec|
  spec.name          = 'rmqf'
  spec.version       = Rmqf::VERSION
  spec.authors       = ['Martin Fernandez']
  spec.email         = ['me@bilby91.com']

  spec.summary       = %q{ Ruby wrapper for Globalnet MQF API. }
  spec.homepage      = 'https://www.github.com/g8labs/rmqf'
  spec.license       = 'MIT'


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'oauth', '~> 0.4'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
