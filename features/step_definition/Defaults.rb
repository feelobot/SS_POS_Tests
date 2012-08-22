When /^I am on the "(.*?)" Tab$/ do |arg1|
	$b.goto $baseURL
	tabs = {
			"Sales" => "a0",  
			"Appointments" => "a1", 
			"Timeclock" => "a2", 
			"Scheduler" => "a3", 
			"Reports" => "a4", 
			"Manager" => "a5", 
			"Setup" => "a6", 
			"Messages" => "a7", 
			"Help" =>"a8"
	}
	path = tabs.fetch(arg1)
	$b.frame(:name,"menu").img(:id => path).click
end 

And /^I select the "(.*?)" Button$/ do |arg1|
	@frame = $b.frame(:name => "content").frame(:id => "menu")
	@frame.button(:text => arg1).click
end

When /^I select the "(.*?)" Report$/ do |arg1|
	@frame = $b.frame(:name => "content").frame(:name => "filter")
	@frame.button(:text => arg1).click
end