# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trader/version'

Gem::Specification.new do |spec|
  spec.name          = "trader"
  spec.version       = Trader::VERSION
  spec.authors       = ["Aaron Kromer"]
  spec.description   = %q{Command line tool for calculating item sales across various currencies.}
  spec.summary       = %q{CLI for calculating item sales}
  spec.homepage      = "https://github.com/cupakromer/tao-of-tdd"
  spec.license       = "GPL-3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>=2.0.0'

  spec.add_runtime_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "rspec", "3.0.0.beta1"
  spec.add_development_dependency "emoji-rspec"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "activesupport"
end
