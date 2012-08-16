class SetupHelper

	def runUtility(name)
		$ss.nav("Setup")
		frame = $b.frame(:name => "content").frame(:name => "setupmenu")
		frame.button(:id => "Utilities").click
		utilities = {
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
		path = utilities.fetch(name)
		frame = $b.frame(:name => "content").frame(:name => "setupcontent")
		frame.button(:xpath, path).click
	end #of Run
	
	def dBcheckerStatus
		frame = $b.frame(:name => "content").frame(:name => "setupcontent")
		Watir::Wait.until(120){
			frame.b(:text, "Database check completed").exists?
		}
	end

	def dBcheckerResults
		frame = $b.frame(:name => "content").frame(:name => "setupcontent")
		Watir::Wait.until(120){
			frame.li(:text, "0 Table changes made").exists?
			frame.li(:text, "0 Field changes made").exists?
			frame.li(:text, "0 Index changes made").exists?
		}
	end

end #of Class