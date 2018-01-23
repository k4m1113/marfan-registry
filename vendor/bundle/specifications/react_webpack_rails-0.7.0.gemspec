# -*- encoding: utf-8 -*-
# stub: react_webpack_rails 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "react_webpack_rails".freeze
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rafa\u{142} Gawlik".freeze, "Rados\u{142}aw Pi\u{105}tek".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-03-30"
  s.description = "".freeze
  s.email = ["gawlikraf@gmail.com".freeze, "radek.nekath@gmail.com".freeze]
  s.homepage = "https://github.com/netguru/react_webpack_rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "React and Rails integration done with webpack".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.14.6"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_runtime_dependency(%q<rails>.freeze, [">= 3.2"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.14.6"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_dependency(%q<rails>.freeze, [">= 3.2"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.14.6"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
    s.add_dependency(%q<rails>.freeze, [">= 3.2"])
  end
end
