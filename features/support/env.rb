require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'cucumber'
require 'rspec'
require 'capybara/iphone'
require 'selenium/webdriver'

#setup config for browser
Capybara.configure do |config|
  config.default_driver = :selenium
  #config.current_driver = :iphone
  config.run_server = false
  config.default_selector = :css
  config.default_wait_time = 10
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :iphone do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['general.useragent.override'] = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7"
   
  Capybara::Selenium::Driver.new(app, :profile => profile, :browser => :chrome)
end


World(Capybara)