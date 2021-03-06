Then /^the Ticket Options window should appear$/ do
  @frame.div(:text => "Ticket Options").wait_until_present
  sleep 3
end

Then /^"(.*?)" is pushed from ticket options$/ do |arg1|
  @frame.button(:text => /#{arg1}/).when_present.fire_event('onclick')
  sleep 1
end

When /"(.*?)" is set as the requested stylist/ do |arg1|
 @frame.button(:id => "ticket_employeeTicketOptionsSelector_button").when_present.fire_event('onclick')
 @frame.div(:text => /Request Employee/).wait_until_present
 @frame.button(:text => /#{arg1}/).when_present.fire_event('onclick')
 @frame.td(:text => /#{arg1}/).wait_until_present
end

And /"(.*?)" top service is selected in ticket options/ do |arg1|
	@frame.button(:text => /Service Select/).when_present.fire_event('onclick')
	@frame.button(:text => /#{arg1}/).when_present.fire_event('onclick')
	@frame.span(:text => /1 of 10 selected/).wait_until_present
	@frame.button(:text => "Done").when_present.fire_event('onclick')
end

And /Adult Haircut service is selected in ticket options/ do
	@frame.button(:text => /Service Select/).wait_until_present
	@frame.button(:text => /Service Select/).when_present.fire_event('onclick')
	@frame.button(:text => /Hair Cut/).when_present(timeout=60).fire_event('onclick')
	@frame.button(:text => /Adult Haircut/).when_present(timeout=60).fire_event('onclick')
	#@frame.span(:text => /1 of 10 selected/).wait_until_present
	@frame.button(:text => /Done/).when_present.fire_event('onclick')
end

Then /^"(.*?)" customer name should be in ticket options$/ do |arg1|
	@frame.text_field( :id => "customer_name").when_present.text == arg1
end