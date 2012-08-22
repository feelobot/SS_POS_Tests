#OPENING BACKGROUND
Then /^the status of the till is "(.*?)"$/ do |arg1|
  @frame = $b.frame(:name => 'content').frame(:name => 'managers')
  Watir::Wait.until(120){@frame.span(:text, arg1).exists?}
end 
#END OF OPENING BACKGROUND
  #///////////////////////////////////////////////////////////////////////////////////////////////////
  # OPENING
  #///////////////////////////////////////////////////////////////////////////////////////////////////
  When /^I store the following into cash count helper$/ do |table|
    values = table.raw
    count=0
    xpathCounter = 3
    12.times do
      Watir::Wait.until(10){
        path = "/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[" + xpathCounter.to_s + "]/td[1]/input"
        @frame.text_field(:xpath, path).set(values[count][1])
      }
      count += 1
      xpathCounter += 1
    end #of loop 
  end
  
  Then /^the cash count helper should show the following results$/ do |table|
    results = table.raw
    count=0
    xpathCounter = 3
    12.times do
      path = "/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[" + xpathCounter.to_s + "]/td[1]/input"
      results[count][1] == @frame.text_field(:xpath, path).text
      path2 = "/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[" +xpathCounter.to_s + "]/td[2]/input"
      results[count][2] == @frame.text_field(:xpath, path2).text
      count += 1
      xpathCounter += 1
    end #of loop 
  end

  Then /^the Opeing Till Cash should show$/ do |table|
    results = table.raw
    @frame.text_field(:name, "counted_till").click
    results[0][1] == @frame.text_field(:name, "total").text
    results[1][1] == @frame.text_field(:name, "counted_till").text
    results[2][1] == @frame.text_field(:name, "expected_till").text
    results[3][1] == @frame.text_field(:name, "till_difference").text
  end

  When /^I hit "(.*?)" Opening Till Count$/ do |arg1|
    @frame.button(:xpath, '(//button[@id="command_button"])[3]').click
  end