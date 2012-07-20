class LoadSS
	
	#///////////////////////////////////////////////////////////
	def loadDriver
		@driver = Selenium::WebDriver.for :chrome
		@driver.navigate.to "http://rogerspos:be81f6@173.242.122.14"
		@driver.manage.timeouts.implicit_wait = 3#Seconds
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
		
	end
	#of loadDriver///////////////////////////////////////////////

	#///////////////////////////////////////////////////////////
	def killDriver
		@driver.quit
	end
	#of killDriver /////////////////////////////////////////////
	
	#///////////////////////////////////////////////////////////
	def element_present?(how, what)
    @driver.find_element(how, what)
    true
 		 rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  #///////////////////////////////////////////////////////////
  
  #///////////////////////////////////////////////////////////
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
	#///////////////////////////////////////////////////////////
	
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
				@element = @driver.find_element(:xpath, "//b[2]").text == "Database check completed"
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
				#@element = @driver.find_element(:xpath, "//li").text.should == "0 Table changes made" 
				@element = @driver.find_element(:xpath, "//li[2]")
				@wait until @element.getElementText == "0 Field changes made"
				#@element = @driver.find_element(:xpath, "//li[3]").text.should == "0 Index changes made" 
			end
			#of runDBChecker /////////////////////////////////////////////
			
end
