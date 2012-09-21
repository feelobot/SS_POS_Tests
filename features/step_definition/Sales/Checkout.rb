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
  @frame.button(:title => /#{arg1}/).when_present(timeout=60).fire_event('onclick')
end

And /^"(.*?)" is set as the requested employee$/ do  |arg1|
  @frame.div(:text => /Request Employee/).wait_until_present
  @frame.button(:text => /#{arg1}/).when_present(timeout=60).fire_event('onclick')
  @frame.td(:text => "Sample").wait_until_present
end

When /^the ticket is pushed to "(.*?)" from servicing$/ do |arg1|
  sleep 1
  @frame.button(:title => /#{arg1}/).when_present(timeout=60).fire_event('onclick')
end

Then /^the ticket should have a request on the checkout screen$/ do
  @frame.div(:id => 'transactionDescription_1').when_present(timeout = 60).text == "Request"

end

Then /^"(.*?)" underneath the request$/ do |arg1|
  @frame.div(:id => 'commissionField_1') == /#{arg1}/
end

Then /^void the ticket$/ do 
  @frame.div(:class => "rounded singleTicket_editButtonContainer").when_present(timeout=60).fire_event('onclick')
  @frame.button(:text => /Void Ticket/).when_present(timeout=60).fire_event('onclick')
  @frame.button(:text => /RSD Testing/).when_present(timeout=60).fire_event('onclick')
  @frame.td(:text => /Waiting/).wait_until_present(timeout=60)
  sleep 2
end

When /^Adult Haircut service is selected for checkout$/ do 
  @frame.div(:id => "addItemActionMenu").button(:text => /Service/).when_present.fire_event('onclick')
  @frame.button(:text => /Hair Cut/).when_present(timeout=60).fire_event('onclick')
  @frame.button(:text => /Adult Haircut/).when_present.fire_event('onclick')
end

And /Shampoo & Style service is selected for checkout/ do 
  @frame.div(:id => "addItemActionMenu").button(:text => /Service/).when_present.fire_event('onclick')
  @frame.button(:text => /Style/).when_present(timeout=60).fire_event('onclick')
  @frame.button(:text => /Shampoo & Style/).when_present.fire_event('onclick')
end

Then /^"(.*?)" should appear under the item in checkout$/ do |arg1|
  @frame.div(:text => /#{arg1}/).wait_until_present(timeout=60)
end

Then /^put the ticket on hold$/ do
  @frame.button(:xpath => '//*[@id="receipt_list"]/button[3]').when_present.fire_event('onlick')
  @frame.td(:text => /Waiting/).wait_until_present(timeout=60)
end

When /^all (\d+) holding tickets are added to the current ticket$/ do |arg1|
  begin
    @frame.button(:text => /Add Ticket/).when_present(timeout=60).fire_event('onclick')
  rescue
    sleep 2
    @frame.button(:text => /Add Ticket/).when_present(timeout=60).fire_event('onclick')
  end
  @frame.button(:text => /Felix Rodriguez/).when_present.fire_event('onclick')
  @frame.div(:text => /Felix Rodriguez/).wait_until_present(timeout=60)
  @frame.button(:text => /Add Ticket/).when_present.fire_event('onclick')
  @frame.button(:text => /Julio Rodriguez/).when_present.fire_event('onclick')
  @frame.div(:text => /Julio Rodriguez/).wait_until_present(timeout=60)
end

And /the ticket total is "(.*?)"/ do |arg1|
  @frame.table(:id => "totalsTable").td(:text => "#{arg1}").wait_until_present
end

When /^I ringout the ticket$/ do
  @frame.button(:text => "Send to Payment").when_present.fire_event('onclick')
end

