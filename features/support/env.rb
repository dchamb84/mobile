require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'cucumber'
require 'rspec'
require 'selenium-webdriver'

#setup config for browser
Capybara.configure do |config|
  config.default_driver = :selenium
  config.run_server = false
  config.default_selector = :css
  config.default_wait_time = 10
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

World(Capybara)