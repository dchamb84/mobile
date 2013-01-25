require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'cucumber'
require 'rspec'
require 'selenium/webdriver'

#setup config for browser
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.current_driver = :iphone_chrome
  config.run_server = false
  config.default_selector = :css
  config.default_wait_time = 10
end

Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :iphone_chrome do |app|
  profile1 = Selenium::WebDriver::Chrome::Profile.new
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :profile => profile1, :switches=>['--user-agent=Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_2 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8H7 Safari/6533.18.5'] )
end

Capybara.register_driver :iphone_firefox do |app|
  profile2 = Selenium::WebDriver::Firefox::Profile.new
  profile2['general.useragent.override'] = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7"
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile2)
end

World(Capybara)

