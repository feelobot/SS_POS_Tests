class Opening

	def selectManagerFrame
		$driver.switch_to.default_content
		$driver.switch_to.frame 'content'
		$driver.switch_to.frame 'managers'
	end #of SelectManagerFrame
	
	def checkOpening(status)
		self.selectManagerFrame
		$wait.until {$driver.find_element(:xpath, "/html/body/table/tbody/tr[1]/td/div/b/span").text == status}
	end #of checkOpening

	def setCashCountValues(values)
		self.selectManagerFrame
		count=0
		xpathCounter = 3
		12.times do
			path = "/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[" + xpathCounter.to_s + "]/td[1]/input"
			element = $driver.find_element(:xpath, path)
			element.send_keys values[count][1]
			count += 1
			xpathCounter += 1
		end #of loop 
	end #of setCashCountValues

	def verifyCashCountValues(results)
		self.selectManagerFrame
		count=0
		xpathCounter = 3
		12.times do
			path = "/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[" + xpathCounter.to_s + "]/td[1]/input"
			results[count][1] == $driver.find_element(:xpath, path).text
			path2 = "/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[" +xpathCounter.to_s + "]/td[2]/input"
			results[count][2] == $driver.find_element(:xpath, path2).text
			count += 1
			xpathCounter += 1
		end #of loop 
	end #of setCashCountValues
	def push(button)
		self.selectManagerFrame
		buttons = { "Save" => '(//button[@id="command_button"])[3]', 
					"Open Till" => ''
				}
		path = buttons.fetch(button)
		element = $driver.find_element(:xpath, path)
		$wait.until {element.displayed?}
		element.click
	end

	def getValues(button)
		buttons = { "Total Cash Count" => '/html/body/table/tbody/tr[2]/td[1]/form/table/tbody/tr[15]/td[2]/input', 
					"Counted Till" => '//*[@id="counted_till"]',
					"Expected Till" => '/html/body/table/tbody/tr[2]/td[2]/form/table/tbody/tr[3]/td[2]/input',
					"Difference" => '/html/body/table/tbody/tr[2]/td[2]/form/table/tbody/tr[4]/td[2]/input',
				}
		path = buttons.fetch(button)
		value = $driver.find_element(:xpath, path).text
		return value
	end

end #of ManagerHelper
