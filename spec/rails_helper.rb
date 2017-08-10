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
require 'spec_helper'
require 'capybara/webkit/matchers'
require 'rails/all'
require 'database_cleaner'

ActiveRecord::Migration[5.0].maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    # RAILS_ENV=test webpack --config client/webpack.config.js
    # `bin/webpack --config client/webpack.config.js`
    `RAILS_ENV=test webpack --config client/webpack.config.js`
    Webpacker::Manifest.load
    binding.remote_pry
    DatabaseCleaner.clean_with(:truncation)
    load "#{Rails.root}/db/seeds.rb"
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    # :rack_test driver's Rack app under test shares database connection
    # with the specs, so continue to use transaction strategy for speed.
    driver_shares_db_connection_with_specs = Capybara.current_driver == Capybara.javascript_driver

    # if !driver_shares_db_connection_with_specs
    #   # Driver is probably for an external browser with an app
    #   # under test that does *not* share a database connection with the
    #   # specs, so use truncation strategy.
    #   DatabaseCleaner.strategy = :truncation, { except: %w[topics] }
    # end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include Capybara::DSL
end

Capybara.configure do |config|
  config.javascript_driver = :webkit
  config.run_server = true
  config.default_max_wait_time = 30
  config.always_include_port = true
  config.default_host = 'http://localhost'
  config.server_port = 3000
  config.app_host = 'http://localhost:3000'
  config.asset_host = 'http://localhost:3000'
  config.app = Rack::ShowExceptions.new(NMFTool::Application)
end

Capybara::Webkit.configure do |config|
  # config.debug = true
  config.allow_url('https://cdn.rawgit.com/MyScript/myscript-math-web/12aedcb7/docs/components/myscript/dist/myscript.min.js')
  config.allow_url('cdn.rawgit.com')
  config.allow_url('https://cdn.rawgit.com/MyScript/myscript-math-web/12aedcb7/docs/components/KaTeX/dist/katex.min.css')
  config.allow_url('https://s-media-cache-ak0.pinimg.com/236x/21/81/31/21813173e73abfbd07a0f83419a7093c.jpg')
 end
