

And /^I type employee ID "(.*?)" to clock in$/ do |arg1|
  @frame.text_field(:id, "employee_code").set(arg1)
  @frame.text_field(:id, "employee_code").fire_event('onfocus')
  @frame.send_keys :enter
end


Then /^the "(.*?)" timecard should appear$/ do |arg1|
   @frame.span(:text => /#{arg1}/).wait_until_present(timeout=60)
  end

Then /^"(.*?)" time and "(.*?)" time should match$/ do |arg1, arg2|
  if arg1 == "Current"
    Watir::Wait.until(120){@frame.span(:xpath => '//*[@id="display_time"]').exists?}
    value = @frame.span(:xpath => '//*[@id="display_time"]').text
  else
    info_data = {
      "Clockin" => '//*[@id="times"]/div[2]',
      "Edited" => '//*[@id="times"]/div[3],',
      "Clockin Position" => '//*[@id="times"]/div[4]',
      "Clockout" => '//*[@id="times"]/div[6]',
      "Clockout Edited" => '//*[@id="times"]/div[7]',
      "Clockout Position" => '//*[@id="times"]/div[8]'
    }
    path = info_data.fetch(arg1)
    Watir::Wait.until(120){@frame.div(:xpath => path).exists?}
    value = @frame.div(:xpath => path).text
    value == arg2
  end
end
  
And /^the clock in as "(.*?)" button is pushed$/ do |arg1|
 @frame.button(:text, /#{arg1}/).when_present(timeout=60).fire_event('onclick')
end