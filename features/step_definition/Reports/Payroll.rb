#///////////////////////////////////////////////////////////////////////////////////////////////////
# Timecard Report
#///////////////////////////////////////////////////////////////////////////////////////////////////
Given /^none of the employees are clocked in$/ do
	@frame = $b.frame(:name => "content").frame(:name => "filter")
	#@frame.select_list(:name, "FILTER[period]").option(:index, 0).when_present(timeout=60).select
	@frame.button(:name => "cmd").when_present.click
	$b.frame(:name => "content").frame(:name => "preview").div(:text => "No Employees found to display")
end
#///////////////////////////////////////////////////////////////////////////////////////////////////

