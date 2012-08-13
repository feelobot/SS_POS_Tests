Before do
  require 'helpers/timeclock'
  @manager = Timeclock.new
  $ss.dbSnapshots(File.basename(__FILE__,".rb") + '\Before')
end

After do
  $ss.dbSnapshots(File.basename(__FILE__,".rb") + '\After')
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEP 1
#///////////////////////////////////////////////////////////////////////////////////////////////////

Given /^No one has clocked in for the day$/ do
  pending # express the regexp above with the code you wish you had
end
When /^I select the 'Sample Manager'$/ do
  pending # express the regexp above with the code you wish you had
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
