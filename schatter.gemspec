# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'schatter/version'

Gem::Specification.new do |spec|
  spec.name          = "schatter"
  spec.version       = Schatter::VERSION
  spec.authors       = ["Mark Ryall"]
  spec.email         = ["mark@ryall.name"]
  spec.description   = %q{command line interface to schatter}
  spec.summary       = %q{api wrapper and command line binary for interaction with schatter rails application}
  spec.homepage      = "http://github.com/markryall/schatter_gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
