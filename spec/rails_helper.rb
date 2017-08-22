# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'support/factory_girl'
require 'rack/utils'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/dsl'
require 'capybara_helper'
require 'rails/all'
require 'database_cleaner'

ActiveRecord::Migration[5.0].maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    Rails.application.load_seed
  end

  config.before(:each, type: :feature) do
    driver_shares_db_connection_with_specs = true
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation, { except: %w[topics patients clinicians] }
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
