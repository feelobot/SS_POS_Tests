begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 
require 'selenium-webdriver'
# change the condition to fit your setup'
require 'capybara/cucumber'
Capybara.default_driver = :selenium
	

