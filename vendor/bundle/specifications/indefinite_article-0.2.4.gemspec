# -*- encoding: utf-8 -*-
# stub: indefinite_article 0.2.4 ruby lib

Gem::Specification.new do |s|
  s.name = "indefinite_article".freeze
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrew Rossmeissl".freeze, "Shane Brinkman-Davis".freeze]
  s.date = "2015-05-28"
  s.description = "Adds indefinite article methods to String and Symbol".freeze
  s.email = ["andy@rossmeissl.net".freeze]
  s.homepage = "http://github.com/rossmeissl/indefinite_article".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Adds indefinite article methods to String and Symbol".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.1"])
      s.add_development_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.1"])
      s.add_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.1"])
    s.add_dependency(%q<i18n>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
