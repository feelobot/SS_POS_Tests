class Timeclock

	def employee(name)
		$ss.nav("Setup")
		$ss.subNav("Utilities")
		employees = {
						"Upload Options" => '//button[1]', 
						"Import Data" => '//button[2]', 
						"Fix Inventory Count" => '//button[3]', 
						"Check Employee Payperiod" => '//button[4]',  
						"Move Employee Sales" => '//button[5]', 
						"Customer Merge" => '//button[6]', 
						"Clear Permissions" => '//button[7]', 
						"Fix Permissions" => '//button[8]', 
						"Clear Session Variables" => '//button[9]', 
						"DBChecker" => '//button[10]',
						"Check Database for Errors" => '//button[11]', 
						"Make all Products Variable Priced" => '//button[12]', 
						"Make all Products Not Variable Priced" => '//button[13]', 
						"Generic Import" => '//button[14]',  
						"Re-Close Date Range" => '//button[15]', 
						"Recover Checkout" => '//button[16]', 
						"Unify System Identities" => '//button[17]', 
						"Apply All Service Catagories" => '//button[18]'
					}
		path = employees.fetch(employee)
		$driver.switch_to.default_content
		$driver.switch_to.frame 'content'
		$driver.switch_to.frame 'setupcontent'
		$element = $driver.find_element(:xpath, path)
		$element.click
	end #of Run
end #of Class