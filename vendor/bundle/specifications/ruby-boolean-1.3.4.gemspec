# -*- encoding: utf-8 -*-
# stub: ruby-boolean 1.3.4 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-boolean".freeze
  s.version = "1.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jake Yesbeck".freeze]
  s.date = "2015-04-28"
  s.description = "A way to handle booleans in a terse way for a specific use case.".freeze
  s.email = "yesbeckjs@gmail.com".freeze
  s.homepage = "http://rubygems.org/gems/ruby-boolean".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Boolean for Ruby".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
