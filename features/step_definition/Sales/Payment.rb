When /^\$ "(.*?)" "(.*?)" is added on payment screen$/ do |arg1, arg2|
	@frame.text_field(:id => "payment_amount").when_present.set arg1
	@frame.button(:text => /#{arg2}/)
	warning = "Successfully added $#{arg1} #{arg2} payment to sale"
	@frame.td(:class => "Warning").wait_until_present(timeout=60).text == warning
	sleep 2
	@frame.button(:text => /Ring Out/).when_present.click
end

Then /^the tip for each stylist should be \$ "(.*?)"$/ do |arg1|
  @frame.button(:text => /Split Tips/).when_present.click
  @frame.div(:id => "tip_employees").td(:index => 1).text == arg1
end

Then /^the multi\-ticket sale is completed\.$/ do
  pending # express the regexp above with the code you wish you had
end

