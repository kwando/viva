# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'viva/version'

Gem::Specification.new do |spec|
  spec.name    = "viva-collector"
  spec.version = Viva::VERSION
  spec.authors = ["Hannes Nevalainen"]
  spec.email   = ["kwando@merciless.me"]

  spec.summary     = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description = %q{TODO: Write a longer description or delete this line.}
  spec.homepage    = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "http", '~> 2.0.1'
  spec.add_runtime_dependency 'dry-types', '~> 0.7.2'
  spec.add_runtime_dependency 'rufus-scheduler', '~> 3.2'
  spec.add_runtime_dependency 'mysql2', '~> 0.4.4'
  spec.add_runtime_dependency 'sequel', '~> 4.35'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
