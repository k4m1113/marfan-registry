# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'react_webpack_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'react_webpack_rails'
  spec.version       = ReactWebpackRails::VERSION
  spec.authors       = ['Rafał Gawlik', 'Radosław Piątek']
  spec.email         = ['gawlikraf@gmail.com', 'radek.nekath@gmail.com']

  spec.summary       = 'React and Rails integration done with webpack'
  spec.description   = ''
  spec.homepage      = 'https://github.com/netguru/react_webpack_rails'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14.6'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.5'

  spec.add_dependency 'rails', '>= 3.2'
end
