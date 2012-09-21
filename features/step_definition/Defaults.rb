Given /any needed databases are loaded/ do
	if ENV['LOAD'].nil?
		puts "No database to load."
	else
		$b.goto("#{$baseURL}importDB.php?name=#{ENV['LOAD']}")
		$b.p(:text, /Completed/).wait_until_present
		$b.goto $baseURL
		puts "#{ENV['LOAD']} database loaded"
		ENV['LOAD'] = nil
	end
end

When /^I am on the "(.*?)" tab$/ do |arg1|
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
	$b.frame(:name,"menu").img(:id => path).fire_event('onclick')
	@frame = $b.frame(:name => 'content')
	sleep 1
end 

And /^I select the "(.*?)" button$/ do |arg1|
	@frame = $b.frame(:name => "content").frame(:id => "menu")
	@frame.button(:text => /#{arg1}/).when_present.click
end

When /^I select the "(.*?)" report$/ do |arg1|
	@frame = $b.frame(:name => "content").frame(:name => "filter")
	@frame.button(:text => /#{arg1}/).when_present.click
end

#///////////////////////////////////////////////////////////////////////////////////////////////////
# SALES TAB BUTTONS
#///////////////////////////////////////////////////////////////////////////////////////////////////

When /^the "(.*?)" button in sales is selected$/ do |arg1|
	begin
		sleep 1
		@frame = $b.frame(:name => "content")
		@frame.button(:text => /#{arg1}/).when_present(timeout=60).fire_event('onclick')
	rescue 
		sleep 1
		@frame.button(:text => /#{arg1}/).when_present(timeout=60).fire_event('onclick')
	end
end

#///////////////////////////////////////////////////////////////////////////////////////////////////

And /check if the database needs to be saved/ do
	if ENV['SNAPSHOTS']
		$b.goto($baseURL + "exportDB.php?name=#{@feature_name}")
		$b.p(:text, /Completed/).wait_until_present
		puts "#{@feature_name} DB Created"
	end
end