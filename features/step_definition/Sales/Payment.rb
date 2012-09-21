When /^\$ "(.*?)" "(.*?)" is added on payment screen$/ do |arg1, arg2|
	@frame.text_field(:id => "payment_amount").when_present.set arg1
	@frame.button(:class => "large_button selected",:text => /#{arg2}/).when_present.fire_event('onclick')
	warning = "Successfully added"
	@frame.td(:text => /#{warning}/).wait_until_present(timeout=60)
	@frame.button(:text => /Ring Out/).when_present.click
end


Then /^the tip for "(.*?)" should be \$ "(.*?)"$/ do |arg1,arg2|
	begin
  		@frame.td(:class => "active_input" , :index => 1, :text => arg2).wait_until_present
      value = @frame.tr(:text => /#{arg1}/).td(:index => 1).text
  rescue "Actual Value: #{value}"
  end
end

And /the Split Tips button is pushed/ do
  @frame.button(:text => /Split Tips/).when_present.fire_event("onclick")
end

Then /select continue on the tip screen/ do
	@frame.button(:text => "Ok").when_present.fire_event("onclick")
end 

Then /^the multi\-ticket sale is completed\$/ do
  pending # express the regexp above with the code you wish you had
end