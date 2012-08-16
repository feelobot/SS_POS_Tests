class Timeclock
	def employee(name)
		employees = {
			"Sample Manager " => '//div[8]/div/div[3]/button',
			"Sample Receptionst" => '//div[8]/div/div[3]/button[2]',
			"Sample Stylist 1" => '//div[8]/div/div[3]/button[3]',
			"Sample Stylist 2" => '//div[8]/div/div[3]/button[4]',
			"Sample Stylist 3" => '//div[8]/div/div[3]/button[5]',
			"Sample Stylist 4" => '//div[8]/div/div[3]/button[6]',
			"Sample Stylist 5" => '//div[8]/div/div[3]/button[7]'
		}
		path = employees.fetch(employee)
		$driver.switch_to.default_content
		$driver.switch_to.frame 'content'
		$element = $driver.find_element(:xpath, path)
		$element.click
	end #of Run
end #of Class