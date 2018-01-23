# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require "react_webpack_rails/rwr_view_helpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rwr-view_helpers"
  s.version     = ReactWebpackRails::RWRViewHelpers::VERSION
  s.authors     = ["Oskar Cieslik"]
  s.email       = ["react@netguru.co"]
  s.license     = 'MIT'
  s.homepage    = "https://github.com/netguru/rwr-view_helpers"
  s.summary     = ""
  s.description = ""
  s.require_paths = ["lib"]
  s.files = `git ls-files`.split("\n")
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'react_webpack_rails', '>= 0.6.0'
  s.add_dependency 'rails'
  s.add_dependency 'sprockets', '>= 3.0'

  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency "yard"
end
