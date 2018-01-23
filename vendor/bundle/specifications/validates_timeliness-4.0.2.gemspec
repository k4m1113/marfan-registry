# -*- encoding: utf-8 -*-
# stub: validates_timeliness 4.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "validates_timeliness".freeze
  s.version = "4.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Adam Meehan".freeze]
  s.date = "2016-01-06"
  s.description = "Adds validation methods to ActiveModel for validating dates and times. Works with multiple ORMS.".freeze
  s.email = "adam.meehan@gmail.com".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze, "CHANGELOG.rdoc".freeze, "LICENSE".freeze]
  s.files = ["CHANGELOG.rdoc".freeze, "LICENSE".freeze, "README.rdoc".freeze]
  s.homepage = "http://github.com/adzap/validates_timeliness".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Date and time validation plugin for Rails which allows custom formats".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<timeliness>.freeze, ["~> 0.3.7"])
    else
      s.add_dependency(%q<timeliness>.freeze, ["~> 0.3.7"])
    end
  else
    s.add_dependency(%q<timeliness>.freeze, ["~> 0.3.7"])
  end
end
