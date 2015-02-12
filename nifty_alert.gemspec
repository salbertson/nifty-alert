# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nifty_alert/version'

Gem::Specification.new do |spec|
  spec.name          = "nifty_alert"
  spec.version       = NiftyAlert::VERSION
  spec.authors       = ["Scott Albertson"]
  spec.email         = ["hello@scottalbertson.com"]
  spec.summary       = %q{Keep an eye on anything with a threshold, especially queues.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "faraday", "~> 0.9.0"
end
