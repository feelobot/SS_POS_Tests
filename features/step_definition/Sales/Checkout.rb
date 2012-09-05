When /^"(.*?)" ticket appears on the wait\/serve screen$/ do |arg1|
  @frame.span(:text => /#{arg1}/).when_present(timeout=60).click
end

Then /^the ticket color should be "(.*?)"$/ do |arg1|
  colorkeys ={
    "yellow" => "request",
    "orange" => "new"
  }
  key = colorkeys.fetch(arg1)
  @frame.tr(:class => key).when_present(timeout=60).fire_event('onclick')
end

When /^the ticket is pushed to "(.*?)" from waiting$/ do |arg1|
  @frame.button(:title => /#{arg1}/).when_present.click
end

And /^"(.*?)" is set as the requested employee$/ do  |arg1|
  @frame.div(:text => /Request Employee/).wait_until_present
  @frame.button(:text => /#{arg1}/).when_present(timeout=60).fire_event('onclick')
  @frame.td(:text => "Sample").wait_until_present
end

When /^the ticket is pushed to "(.*?)" from servicing$/ do |arg1|
  @frame.th(:text => /0h 00m/).when_present.click
  @frame.button(:title => /#{arg1}/).when_present(timeout=60).fire_event('onclick')
end

Then /^the ticket should have a request on the checkout screen$/ do
  @frame.td(:xpath => '//*[@id="trans_1"]/tbody/tr[1]/td[2]').when_present(timeout = 60).text == "Request"
end

Then /^"(.*?)" underneath the request$/ do |arg1|
  @frame.div(:xpath => '//*[@id="trans_1"]/tbody/tr[2]/td/div') == /#{arg1}/
end

Then /^void the ticket$/ do 
  @frame.button(:text => "Void").when_present.click
  @frame.div(:text => "Void").wait_until_present
  @frame.button(:text => "RSD Testing").when_present.click
  @frame.td(:text => /Waiting/).wait_until_present
end

When /^Adult Haircut service is selected for checkout$/ do 
  @frame.button(:text => "Services").when_present.fire_event('onclick')
  @frame.td(:xpath => '//*[@id="item_1"]/td').when_present.fire_event('onclick')
  @frame.img(:xpath => '//*[@id="img_item_2667"]').when_present.fire_event('onclick')
  @frame.td(:text => /Adult Haircut/).wait_until_present
  @frame.button(:text => "Back").when_present.click
end

And /Shampoo & Style service is selected for checkout/ do 
  @frame.td(:xpath => '//*[@id="item_4"]/td').when_present.fire_event('onclick')
  @frame.img(:xpath => '//*[@id="img_item_2677"]').when_present.fire_event('onclick')
  @frame.td(:text => /Shampoo & Style/).wait_until_present
  @frame.button(:text => "Back").when_present.click
end

Then /^"(.*?)" should appear under the item in checkout$/ do |arg1|
  @frame.div(:text => "Commission: #{arg1}").wait_until_present
end

Then /^put the ticket on hold$/ do
  @frame.button(:xpath => '//*[@id="receipt_list"]/button[3]').when_present.fire_event('onlick')
  @frame.td(:text => /Waiting/).wait_until_present(timeout=60)
end

When /^all (\d+) holding tickets are added to the current ticket$/ do |arg1|
  @frame.button(:text => /Add Ticket/).when_present.click
  @frame.button(:text => /Felix Rodriguez/).when_present.click
  @frame.th(:text => /Felix Rodriguez/).wait_until_present
  @frame.button(:text => /Add Ticket/).when_present.click
  @frame.button(:text => /Julio Rodriguez/).when_present.click
  @frame.th(:text => /Julio Rodriguez/).wait_until_present
end

When /^I ringout the ticket$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I add \$ "(.*?)" more than the total cost of the multi\-ticket$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the tip for each stylist should be \$ "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the multi\-ticket sale is completed\.$/ do
  pending # express the regexp above with the code you wish you had
end
