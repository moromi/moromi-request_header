# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moromi/request_header/version'

Gem::Specification.new do |spec|
  spec.name          = "moromi-request_header"
  spec.version       = Moromi::RequestHeader::VERSION
  spec.authors       = ["Takahiro Oishi"]
  spec.email         = ["takahiro.oishi@dena.jp"]

  spec.summary       = %q{Useful HTTP Header}
  spec.description   = %q{Useful HTTP Header}
  spec.homepage      = "https://github.com/moromi/moromi-request_header"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
