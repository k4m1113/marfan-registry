require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/dsl'
require 'capybara_helper'
require 'database_cleaner'
require 'rake'

RSpec.configure do |config|

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    load "#{Rails.root}/db/seeds.rb"
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # config.before(:each, type: :feature) do
  #   # :rack_test driver's Rack app under test shares database connection
  #   # with the specs, so we can use transaction strategy for speed.
  #   driver_shares_db_connection_with_specs = Capybara.current_driver == Capybara.javascript_driver
  #
  #   if driver_shares_db_connection_with_specs
  #     DatabaseCleaner.strategy = :transaction
  #   else
  #     # Non-:rack_test driver is probably a driver for a JavaScript browser
  #     # with a Rack app under test that does *not* share a database
  #     # connection with the specs, so we must use truncation strategy.
  #     DatabaseCleaner.strategy = :truncation, { except: %w[topics] }
  #   end
  # end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
