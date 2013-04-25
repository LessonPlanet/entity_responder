# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'entity_responder/version'

Gem::Specification.new do |spec|
  spec.name          = "entity_responder"
  spec.version       = EntityResponder::VERSION
  spec.authors       = ["Jason Rust"]
  spec.email         = ["jason@lessonplanet.com"]
  spec.description   = %q{A Rails responder that returns an entity in the response body rather than the :no_content header.}
  spec.summary       = %q{A Rails responder that returns an entity in the response body rather than the :no_content header.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest-ansi"
  spec.add_development_dependency "actionpack"
end
