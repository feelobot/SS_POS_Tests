class Manager

	def checkOpening(status)
		frame = $b.frame(:name => 'content').frame(:name => 'menu')
		frame.button(:id => "Opening").click
		frame = $b.frame(:name => 'content').frame(:name => 'managers')
		Watir::Wait.until(120){
			frame.span(:text, status).exists?
		}
	end #of checkOpening

	def setCashCountValues(values)
		frame = $b.frame(:name => 'content').frame(:name => 'managers')
		count=0
		xpathCounter = 3
		12.times do
			Watir::Wait.until(10){
				path = "/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[" + xpathCounter.to_s + "]/td[1]/input"
				frame.text_field(:xpath, path).set(values[count][1])
			}
			count += 1
			xpathCounter += 1
		end #of loop 
	end #of setCashCountValues

	def verifyCashCountValues(results)
		frame = $b.frame(:name => 'content').frame(:name => 'managers')
		count=0
		xpathCounter = 3
		12.times do
			path = "/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[" + xpathCounter.to_s + "]/td[1]/input"
			results[count][1] == frame.text_field(:xpath, path).text
			path2 = "/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[" +xpathCounter.to_s + "]/td[2]/input"
			results[count][2] == frame.text_field(:xpath, path2).text
			count += 1
			xpathCounter += 1
		end #of loop 
	end #of setCashCountValues
	def push(button)
		frame = $b.frame(:name => 'content').frame(:name => 'managers')
		buttons = { "Save" => '(//button[@id="command_button"])[3]', 
					"Open Till" => ''
				}
		path = buttons.fetch(button)
		frame.button(:xpath, path).click
	end
	
	def getValues(button)
		buttons = { "Total Cash Count" => '/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[15]/td[2]/input', 
					"Counted Till" => '//*[@id="counted_till"]',
					"Expected Till" => '/html/body/table/tbody/tr[2]/td[2]/form/table/tbody/tr[3]/td[2]/input',
					"Difference" => '/html/body/table/tbody/tr[2]/td[2]/form/table/tbody/tr[4]/td[2]/input',
				}
		frame = $b.frame(:name => 'content').frame(:name => 'managers')
		frame.text_field(:name, "counted_till").click
		path = buttons.fetch(button)
		value =frame.text_field(:xpath, path).text
		return value
	end

end #of ManagerHelper
