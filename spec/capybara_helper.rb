require 'selenium/webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu) }
  )

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities
end

Selenium::WebDriver::Chrome.driver_path = '/Users/Andromeda/.rubies/ruby-2.3.4/bin/chromedriver'

Capybara.configure do |config|
  config.asset_host = 'http://localhost:3000'
  config.javascript_driver = :headless_chrome
end
