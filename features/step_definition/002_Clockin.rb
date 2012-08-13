Before do
  $testname = "001_Open"
	$ss.dbSnapshots($testname + '\Before')
end

After do
	$ss.dbSnapshots($testname + '\After')
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# BACKGROUND
#///////////////////////////////////////////////////////////////////////////////////////////////////
Given /^No one has clocked in for the day$/ do
  pending
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEPS
#///////////////////////////////////////////////////////////////////////////////////////////////////
When /^I select the 'Sample Manager'$/ do
  #$ss.nav("Timeclock")
  #$ss.takeScreenShot('Step1a')
  #$ss.subNav("Opening")
  #$ss.takeScreenShot('Step1b')
  #@manager.checkOpening("Incomplete")
  pending
end

When /^I clock in as 'Stylist'$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the current time should show$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^'Sample Manager' should be able to ringout sales$/ do
  pending # express the regexp above with the code you wish you had
end
