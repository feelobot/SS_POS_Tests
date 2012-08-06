class Bttns

	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# SETUP TAB BUTTONS
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def setupBttns(bttnName)
		bttnNames = {	
						"Payment Methods"=> "", 
						"Positions"=>"", 
						"Payroll/Bonuses"=>"", 
						"Company Info"=>"", 
						"Software Settings"=>"", 
						"School Settings"=>"", 
						"Local Settings"=>"", 
						"Internet Setup"=>"", 
						"Utilities"=>"Utilities",
						"Permissions"=>"", 
						"Cash Drawer"=>"", 
						"Receipt Printer"=>"", 
						"Label Printer"=>"", 
						"Pole Display"=>"", 
						"Finger Scanner"=>"", 
						"Owner Password"=>""
					}
		idPath = bttnNames.fetch(bttnName)
		$driver.switch_to.default_content
		$driver.switch_to.frame 'content'
		$driver.switch_to.frame 'setupmenu'
		$element = $driver.find_element(:id,idPath)
		$element.click
	end# of setupBttns
	#///////////////////////////////////////////////////////////////////////////////////////////////////
end#of Class
