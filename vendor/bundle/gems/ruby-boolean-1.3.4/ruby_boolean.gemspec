lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

MAJOR = 1
MINOR = 3
TINY = 4
VERSION = [MAJOR, MINOR, TINY].join('.').freeze

Gem::Specification.new do |s|
  s.name          = 'ruby-boolean'
  s.version       = VERSION
  s.date          = '2015-04-28'
  s.summary       = 'Boolean for Ruby'
  s.description   = 'A way to handle booleans in a terse way for a specific use case.'
  s.authors       = ['Jake Yesbeck']
  s.email         = 'yesbeckjs@gmail.com'
  s.require_paths = ['lib']
  s.files         = `git ls-files`.split("\n")
  s.homepage      = 'http://rubygems.org/gems/ruby-boolean'
  s.license       = 'MIT'

  s.add_development_dependency 'rspec', '~> 3.0'
end
