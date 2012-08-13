Before do
  $testname = "001_Open"
  require 'helpers/manager/opening'
  @manager = Opening.new
	$ss.dbSnapshots($testname + '\Before')
end

After do
	$ss.dbSnapshots($testname + '\After')
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEP 1
#///////////////////////////////////////////////////////////////////////////////////////////////////
Given /^the status of the till is "(.*?)"$/ do |arg1|
  $ss.nav("Manager")
  $ss.takeScreenShot('Step1a')
  $ss.subNav("Opening")
  $ss.takeScreenShot('Step1b')
  @manager.checkOpening(arg1)
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEP 2
#///////////////////////////////////////////////////////////////////////////////////////////////////
When /^I store the following into cash count helper$/ do |table|
  values = table.raw
  @manager.setCashCountValues(values)
  $ss.takeScreenShot('Step2')
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEP 3
#///////////////////////////////////////////////////////////////////////////////////////////////////
Then /^I should get the following results$/ do |table|
  results = table.raw
  @manager.verifyCashCountValues(results)
end

And /^the "(.*?)" should be "(.*?)"$/ do |arg1, arg2|
  @manager.getValues(arg1) == arg2
end

#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEP 4
#///////////////////////////////////////////////////////////////////////////////////////////////////
When /^I hit "(.*?)" Opening Till Count$/ do |arg1|
  @manager.push(arg1)
end

Then /^the status should change to "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
