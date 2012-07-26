class LoadSS
	
	#///////////////////////////////////////////////////////////
	def loadDriver
		@headless = Headless.new
		@headless.start
		#@driver = Selenium::WebDriver.for :chrome
		@driver = Selenium::WebDriver.for :chrome
		@driver.manage.timeouts.implicit_wait = 3#Seconds
		@wait = Selenium::WebDriver::Wait.new(:timeout => 60) # seconds
	end
	#of loadDriver///////////////////////////////////////////////
	
	#///////////////////////////////////////////////////////////
	def gotoSS
		@driver.navigate.to "http://rogerspos:be81f6@173.242.122.14"
	end
	#of loadDriver///////////////////////////////////////////////

	#///////////////////////////////////////////////////////////
	def killDriver
		#@driver.quit
		@headless.destroy
	end
	#of killDriver /////////////////////////////////////////////
	
	#///////////////////////////////////////////////////////////
	def reloadDB
		@driver.navigate.to "http://rogerspos:be81f6@173.242.122.14/reloadBase.php"
		@wait.until { @driver.find_element(:id, 'results').text =~ /^[\s\S]*Done![\s\S]*$/ }
		#@driver.save_screenshot("screenshots/db_reloaded.png")
	end
	#of killDriver /////////////////////////////////////////////
	
	
	#///////////////////////////////////////////////////////////
	def setupTab
		@driver.switch_to.default_content
		@driver.switch_to.frame "menu"
		@element = @driver.find_element(:id,'a6')
		@element.click
	end
	#of setupTab /////////////////////////////////////////////
		#///////////////////////////////////////////////////////////
		def utilitiesBtn
			@driver.switch_to.default_content
			@driver.switch_to.frame 'content'
			@driver.switch_to.frame 'menu'
			@element = @driver.find_element(:id,'Utilities')
			@element.click
		end
		#of utilitiesBtn /////////////////////////////////////////////
			
			#///////////////////////////////////////////////////////////
			def dbCheckerBtn
				@driver.switch_to.default_content
				@driver.switch_to.frame 'content'
				@driver.switch_to.frame 'setupcontent'
				@element = @driver.find_element(:xpath,'//button[10]')
				@element.click
			end
			#of dbCheckerBtn /////////////////////////////////////////////
			
			#///////////////////////////////////////////////////////////
			def waitForResults
				@wait.until { @driver.find_element(:xpath, "//b[2]").text == "Database check completed"}
				#@driver.save_screenshot("screenshots/db_checker_results1.png")
			end
			#of waitForResults /////////////////////////////////////////////
			
			#///////////////////////////////////////////////////////////
			def runDBChecker
				self.setupTab
				self.utilitiesBtn
				self.dbCheckerBtn
				self.waitForResults
			end
			#of runDBChecker /////////////////////////////////////////////
			
			#///////////////////////////////////////////////////////////
			def dbCheckerResults
				@wait.until { @driver.find_element(:xpath, "//li").text == "0 Table changes made" }
				@wait.until { @driver.find_element(:xpath, '//li[2]').text == "0 Field changes made" }
				@wait.until { @driver.find_element(:xpath, "//li[3]").text == "0 Index changes made" }
				#@driver.save_screenshot("screenshots/db_checker_results2.png")
			end
			#of runDBChecker /////////////////////////////////////////////
			
end
