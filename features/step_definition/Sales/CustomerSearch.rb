#///////////////////////////////////////////////////////////////////////////////////////////////////
# CUSTOMER SEARCH
#///////////////////////////////////////////////////////////////////////////////////////////////////

@frame = $b.frame(:name => "content")


And /^there exists a customer named "(.*?)"$/ do |arg1|
  @frame .text_field(:xpath => "//td[2]/input[2]").when_present.set(arg1)
  @frame.button(:text => /#{arg1}/).wait_until_present
end

And /^"(.*?)" is entered in customer search$/ do |arg1|
  @frame.text_field(:xpath => "//td[2]/input[2]").when_present.set(arg1)
end

Then /^the "(.*?)" message should appear$/ do |arg1|
  @frame.div(:id => "customer_search_error_complete").when_present.text == arg1
end

When /^"(.*?)" is selected in customer selection screen$/ do |arg1|
  @frame.button(:text => /#{arg1}/).when_present(timeout=45).fire_event('onclick')
end

Then /^the New Customer window should contain the following:$/ do |table|
  results = table.raw
  @frame.div(:text => "New Customer").wait_until_present
  #Checks That Values in Column 1 == values in column2
  @frame.text_field(:id => /#{results[0][0]}/) == /#{results[0][1]}/
  @frame.text_field(:id => /#{results[1][0]}/) == /#{results[1][1]}/
  @frame.text_field(:id => /#{results[2][0]}/) == /#{results[2][1]}/
end

And /^if "(.*?)" is entered for the zip code$/ do |arg1|
  @frame.text_field(:id => "customer_zip").when_present.set "#{arg1}"
  @frame.send_keys :tab
end

Then /^the Country and State should autopopulate with the following:$/ do |table|
  results = table.raw
  @frame.div(:text => "New Customer").wait_until_present
  @frame.text_field(:id => /#{results[0][0]}/) == /#{results[0][1]}/
  @frame.text_field(:id => /#{results[1][0]}/) == /#{results[1][1]}/
  @frame.text_field(:id => /#{results[2][0]}/) == /#{results[2][1]}/
end

And /^if the Save button is pushed in the new customer window$/ do 
  @frame.button(:id => "newCustomer_done").when_present.fire_event('onclick')
end

And /^if the Save and Use button is pushed in the new customer window$/ do 
  @frame.button(:id => "newCustomer_l").when_present.fire_event('onclick')
end

Then /^a mandatory gender requirement error should appear$/ do
  @frame.div(:text => "Error").wait_until_present
  @frame.li(:text => "Gender").wait_until_present
  @frame.button(:id => /GenericAlert/).when_present(timeout=60).fire_event('onclick')
end

When /^the New Customer window is filled with the following:$/ do |table|
  results = table.raw
  @frame.div(:text => "New Customer").wait_until_present
  #Sets Fields in Column 1 to values in Column2"
  @frame.text_field(:id => /#{results[0][0]}/).when_present.set "#{results[0][1]}"
  @frame.text_field(:id => /#{results[1][0]}/).set "#{results[1][1]}"
  @frame.text_field(:id => /#{results[2][0]}/).set "#{results[2][1]}"
  @frame.text_field(:id => /#{results[3][0]}/).set "#{results[3][1]}"
  @frame.button(:id => "customer_sex_button").fire_event('onclick')
  @frame.div(:text => "Gender").wait_until_present
  @frame.button(:text => "Male").when_present.fire_event('onclick')
end

Then /^the customer should save without any errors$/ do
  @frame.div(:text => "Error").exists? == false
end

And /^"(.*?)" should be entered in the customer database$/ do |arg1|
  @frame.button(:text => /#{arg1}/).wait_until_present(timeout=60)
  @frame.td(:text => /#{arg1}/).wait_until_present(timeout=60)
end

When /^I select the customer "(.*?)" and hit next$/ do |arg1|
  sleep 3
  @frame.button(:text => /#{arg1}/).when_present(timeout=60).fire_event('onclick')
  @frame.td(:text => /#{arg1}/).wait_until_present
  @frame.button(:id => "customer_popup_selector_done").when_present.fire_event('onclick')
end

When /^I skip customer selection$/ do
  @frame.button(:text => /Skip/).when_present(timeout=60).fire_event('onclick')
end
