Before do
  require 'helpers/timeclock'
  require 'helpers/reports'
  @time = Timeclock.new
  @report = Reports.new
  $ss.dbSnapshots(File.basename(__FILE__,".rb") + '\Before')
end

After do
  $ss.dbSnapshots(File.basename(__FILE__,".rb") + '\After')
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# STEP 1
#///////////////////////////////////////////////////////////////////////////////////////////////////

Given /^none of the employees are clocked in$/ do
  @testname = File.basename(__FILE__,".rb")
  $b.goto($baseURL) 
  $ss.nav("Reports")
  @report.run("Payroll")
  @report.run("Timecard")
  @report.setPeriod(0)
  @report.generate
  results = $b.frame(:name => "content").frame(:name => "preview").div(:class => "foreground")
  results.text.include? "No Employees found to display"
  $ss.takeScreenShot(@testname, "Given")
  
end

When /^I type employee ID "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the "(.*?)" timecard should appear$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^if I click "(.*?)" button$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^clock in as 'Stylist' button is pushed$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^"(.*?)" and "(.*?)" should match$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

