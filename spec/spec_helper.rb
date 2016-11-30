require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/dsl'
require 'capybara/webkit/matchers'


Capybara.javascript_driver = :webkit

RSpec.configure do |config|

  config.use_transactional_fixtures = false

  config.include(Capybara::Webkit::RspecMatchers, :type => :feature)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

Capybara::Webkit.configure do |config|
  config.allow_url("https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js")
  config.allow_url("https://s-media-cache-ak0.pinimg.com/236x/21/81/31/21813173e73abfbd07a0f83419a7093c.jpg")
  config.allow_url("s-media-cache-ak0.pinimg.com")
end
