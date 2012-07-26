begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 
require 'selenium-webdriver'
# change the condition to fit your setup'
require 'capybara/cucumber'
Capybara.default_driver = :selenium
require 'timeout'
require 'headless'
headless = Headless.new
at_exit do
  headless.destroy
end

Before("@selenium,@javascript", "~@no-headless") do
  headless.start if Capybara.current_driver == :selenium
end

After("@selenium,@javascript", "~@no-headless") do
  headless.stop if Capybara.current_driver == :selenium
end
	

