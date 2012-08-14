class Timeclock
	def employee(name)
		employees = {
						"Sample Manager " => '',
						"Sample Receptionst" => '',
						"" => '',
						"" => ''
					}
		path = employees.fetch(employee)
		$driver.switch_to.default_content
		$driver.switch_to.frame 'content'
		$driver.switch_to.frame 'setupcontent'
		$element = $driver.find_element(:xpath, path)
		$element.click
	end #of Run
end #of Class