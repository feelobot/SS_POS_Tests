Before do
  require 'helpers/manager/opening'
  @manager = Opening.new
	$ss.dbSnapshots(File.basename(__FILE__,".rb") + '\Before')
end

After do
	$ss.dbSnapshots(File.basename(__FILE__,".rb") + '\After')
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEP 1
#///////////////////////////////////////////////////////////////////////////////////////////////////
Given /^the status of the till is "(.*?)"$/ do |arg1|
  $ss.nav("Manager")
  $ss.takeScreenShot(File.basename(__FILE__,".rb"),'Step1a')
  $ss.subNav("Opening")
  @manager.checkOpening(arg1)
  $ss.takeScreenShot(File.basename(__FILE__,".rb"),'Step1b')
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEP 2
#///////////////////////////////////////////////////////////////////////////////////////////////////
When /^I store the following into cash count helper$/ do |table|
  values = table.raw
  @manager.setCashCountValues(values)
  $ss.takeScreenShot(File.basename(__FILE__,".rb"),'Step2')
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
  $ss.takeScreenShot(File.basename(__FILE__,".rb"), 'Step3')
end

#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEP 4
#///////////////////////////////////////////////////////////////////////////////////////////////////
When /^I hit "(.*?)" Opening Till Count$/ do |arg1|
  @manager.push(arg1)
  $ss.takeScreenShot(File.basename(__FILE__,".rb"),'Step4a')
end

Then /^the status should change to "(.*?)"$/ do |arg1|
  @manager.checkOpening(arg1)
  $ss.takeScreenShot(File.basename(__FILE__,".rb"),'Step4b')
end
