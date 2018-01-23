# -*- encoding: utf-8 -*-
# stub: capybara-webkit 1.14.0 ruby lib
# stub: extconf.rb

Gem::Specification.new do |s|
  s.name = "capybara-webkit".freeze
  s.version = "1.14.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["thoughtbot".freeze, "Joe Ferris".freeze, "Matt Horan".freeze, "Matt Mongeau".freeze, "Mike Burns".freeze, "Jason Morrison".freeze]
  s.date = "2017-03-26"
  s.email = "support@thoughtbot.com".freeze
  s.extensions = ["extconf.rb".freeze]
  s.files = ["extconf.rb".freeze]
  s.homepage = "http://github.com/thoughtbot/capybara-webkit".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0".freeze)
  s.requirements = ["Qt >= 4.8".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Headless Webkit driver for Capybara".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capybara>.freeze, ["< 2.14.0", ">= 2.3.0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_development_dependency(%q<sinatra>.freeze, [">= 0"])
      s.add_development_dependency(%q<mini_magick>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["< 12.0.0"])
      s.add_development_dependency(%q<appraisal>.freeze, ["~> 0.4.0"])
      s.add_development_dependency(%q<launchy>.freeze, [">= 0"])
    else
      s.add_dependency(%q<capybara>.freeze, ["< 2.14.0", ">= 2.3.0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_dependency(%q<sinatra>.freeze, [">= 0"])
      s.add_dependency(%q<mini_magick>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["< 12.0.0"])
      s.add_dependency(%q<appraisal>.freeze, ["~> 0.4.0"])
      s.add_dependency(%q<launchy>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<capybara>.freeze, ["< 2.14.0", ">= 2.3.0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
    s.add_dependency(%q<sinatra>.freeze, [">= 0"])
    s.add_dependency(%q<mini_magick>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["< 12.0.0"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 0.4.0"])
    s.add_dependency(%q<launchy>.freeze, [">= 0"])
  end
end
