# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ogino_method/version'

Gem::Specification.new do |spec|
  spec.name          = "ogino_method"
  spec.version       = OginoMethod::VERSION
  spec.authors       = ["KURASAWA Nozomu"]
  spec.email         = ["nabetaro@caldron.jp"]
  spec.description   = %q{TODO: Write a gem descript}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
