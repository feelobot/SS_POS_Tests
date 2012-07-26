begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 
require 'cucumber/formatter/unicode'
require 'selenium-webdriver'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'loadSS'

Before do
	@load = LoadSS.new
	@load.loadDriver
end

After do
	@load.killDriver	
end


Given /^The Database is New and Untouched$/ do
	@load.reloadDB
	@load.gotoSS
end

When /^I run dbchecker utility$/ do
	@load.runDBChecker
end

When /^I run dbchecker again$/ do
	@load.runDBChecker
end

Then /^there should be no index changes$/ do 
	@load.dbCheckerResults
end

