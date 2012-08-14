class Load
	 $baseURL= "http://rogerspos:be81f6@173.242.122.14/"
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# CONFIGURE WEB DRIVER SETUP
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def loadDriver
		$driver = Selenium::WebDriver.for :chrome
		$driver.manage.timeouts.implicit_wait = 3#Seconds
		$wait = Selenium::WebDriver::Wait.new(:timeout => 90) # seconds
	end #of loadDriver
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# LOAD SUPERSALON WEBSITE & LOGIN
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def home
		$driver.navigate.to $baseURL
	end
	#of loadDriver
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# RELOAD DATABASE TO BLANK STATE
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def reloadDB
		$driver.navigate.to($baseURL + "reloadBase.php")
		$wait.until { $driver.find_element(:id, 'results').text =~ /^[\s\S]*Done![\s\S]*$/ }
	end# of reloadDB
	#///////////////////////////////////////////////////////////////////////////////////////////////////

	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# ENABLE/DISABLE DB SNAPSHOTS
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def dbSnapshots (dirname)
		if ENV['SNAPSHOTS'] == 'true'
			$driver.navigate.to($baseURL + "exportDB.php?dirname=" + dirname)
			$wait.until { $driver.find_element(:id, 'results').text =~ /^[\s\S]*Done![\s\S]*$/ }
		end
	end# of reloadDB
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# LOAD DB SNAPSHOTS
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def loadDBSnapshots (dirname)
		if ENV['LOADSNAPSHOTS'] == 'true'
			$driver.navigate.to($baseURL + "import.php?dirname=" + dirname)
			$wait.until { $driver.find_element(:id, 'results').text =~ /^[\s\S]*Done![\s\S]*$/ }
		end
	end# of reloadDB
	#///////////////////////////////////////////////////////////////////////////////////////////////////

	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# SCREEN SHOT FUNCION
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def takeScreenShot(testname,file)
		path = "screenshots/" + testname
		Dir.mkdir(path) unless File.exists?(path)
		$driver.save_screenshot(path + "/" + file + ".png")
	end #of takeScreenShot
	#///////////////////////////////////////////////////////////////////////////////////////////////////

	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# Navigation
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def nav(link)
		links = {
						"Sales" => "a0",  
						"Appointments" => "a1", 
						"Timeclock" => "a2", 
						"Scheduler" => "a3", 
						"Reports" => "a4", 
						"Manager" => "a5", 
						"Setup" => "a6", 
						"Messages" => "a7", 
						"Help" =>"a8"
					}
		idPath = links.fetch(link)
		self.home
		$driver.switch_to.default_content
		$driver.switch_to.frame "menu"
		$element = $driver.find_element(:id, idPath)
		$element.click
	end #of Nav
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# SUB NAV
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def subNav(idPath)
=begin links = {	
						#SALES
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#APPOINTMENTS
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#TIMECLOCK
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#SCHEDULER
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#REPORTS
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#MANAGER
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"Opening" => "Opening",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#SETUP
						"Payment Methods" => "", 
						"Positions" => "", 
						"Payroll/Bonuses" => "", 
						"Company Info" => "", 
						"Software Settings" => "", 
						"School Settings" => "", 
						"Local Settings" => "", 
						"Internet Setup" => "", 
						"Utilities" => "Utilities",
						"Permissions" => "", 
						"Cash Drawer" => "", 
						"Receipt Printer" => "", 
						"Label Printer" => "", 
						"Pole Display" => "", 
						"Finger Scanner" => "", 
						"Owner Password" => ""
						#MESSAGES
						#HELP
					}
		idPath = links.fetch(link)
=end
		$driver.switch_to.default_content
		$driver.switch_to.frame 'content'
		$driver.switch_to.frame 'menu'
		$element = $driver.find_element(:id,idPath)
		$element.click
	end #of subNav
	#///////////////////////////////////////////////////////////////////////////////////////////////////
end