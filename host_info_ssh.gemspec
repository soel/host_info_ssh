# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'host_info_ssh/version'

Gem::Specification.new do |spec|
  spec.name          = "host_info_ssh"
  spec.version       = HostInfoSsh::VERSION
  spec.authors       = ["kanbara"]
  spec.email         = ["kanbara@bbtower.co.jp"]
  spec.summary       = %q{host information tool}
  spec.description   = %q{host information tool created by kanbara}
  spec.homepage      = ""
  spec.license       = "MIT"

  #spec.files         = `git ls-files -z`.split("\x0")
  spec.files         = Dir.glob("**/*").select{|path| !(path =~ /^doc|^pkg/) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'net-ssh', '~> 2.9.1'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'yard', '~> 0.8.7.4'
  spec.add_development_dependency 'redcarpet', '~> 3.2.0'
end
