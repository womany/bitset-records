# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "bitset-records"
  spec.version       = Bitset::Records::VERSION
  spec.authors       = ["wildjcrt"]
  spec.email         = ["wildjcrt@gmail.com"]
  spec.summary       = %q{Bitset records, and can run operators with different length records.}
  spec.description   = %q{Bitset records, and can run operators with different length records.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
