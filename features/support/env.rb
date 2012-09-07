require 'rubygems'
require 'bundler/setup'	
require 'capybara/cucumber'
require 'timeout'
require 'watir-webdriver'
#///////////////////////////////////////////////////////////////////////////////////////////////////
# ADDED CUSTOM LIB
#///////////////////////////////////////////////////////////////////////////////////////////////////
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'load'
#///////////////////////////////////////////////////////////////////////////////////////////////////

#///////////////////////////////////////////////////////////////////////////////////////////////////
# REQUIREMENTS FOR HEADLESS MODE (NO VISIBLE BROWSER)
#///////////////////////////////////////////////////////////////////////////////////////////////////
#require 'headless'
#headless = Headless.new
#headless.start 
#

#Selenium::WebDriver::Chrome.path = "/home/feelobot/.chromedriver-helper/linux32/chromedriver"
require 'headless'
require 'selenium-webdriver'
`rm -rvf /home/feelobot/Code/SS_POS_Tests/screenshots/`

headless = Headless.new
headless.start
headless.video.start_capture

at_exit do
  headless.video.stop_and_save("sspos_cukes#{Time.now.to_s}.mov")
end
#capabilities = WebDriver::Remote::Capabilities.htmlunit(:javascript_enabled => true)
#$b = Watir::Browser.new(:remote, :url => 'http://127.0.0.1:4444/wd/hub', :desired_capabilities => capabilities)
$b = Watir::Browser.start :chrome

if Cucumber.wants_to_quit	
  if ENV['MAIL']
    require 'mail'
    `/usr/bin/zip -r -9 --exclude=*.zip* /home/feelobot/SS_POS_Tests/screenshots/lastrun.zip /home/feelobot/SS_POS_Tests/screenshots`
    mail = Mail.new do
      from    'QA@rogerspos.com'
      to      'felix.rodriguez@rogerspos.com'
      subject 'AutoTest Failures'
      add_file 'screenshots/lastrun.zip'
      html_part do
        content_type 'text/html; charset=UTF-8'
        body  '<h3>Failed Features:</h3>' + File.read('cukeResults.txt') + 
              '<p><a href="http://testing.supersalon.com/cukeResults.html">See Full Report</a></p>' +
              '<p><a href="http://testing.supersalon.com/screenshots">See Screenshots</a></p>' +
              '<p><a href="#{baseURL}/coverage/index.php" Coverage</a></p>'
      end #of html_part
    end #end of mail
    mail.deliver
    `mv /home/feelobot/SS_POS_Tests/screenshots/lastrun.zip /home/feelobot/SS_POS_Tests/screenshots/date +%Y%m%d-%T .zip`
    `cd /home/feelobot/SS_POS_Tests/screenshots`
    `find . -type f -iname \*.png -delete`
    ENV['MAIL']=nil
  end # of MAIL ENV
  headless.destroy
end # of AT EXIT
#///////////////////////////////////////////////////////////////////////////////////////////////////
# WATIR START AND CONFIG 
#///////////////////////////////////////////////////////////////////////////////////////////////////
#$b = Watir::Browser.new :chrome
$b.driver.manage.timeouts.implicit_wait = 1 #3 seconds
$baseURL= "http://rogerspos:be81f6@173.242.122.14/"
$ss = Load.new	

#///////////////////////////////////////////////////////////////////////////////////////////////////
# DATABASE SNAPSHOT CONTROL
#///////////////////////////////////////////////////////////////////////////////////////////////////

Before do |scenario|
	@current_scenario = scenario
	@feature_name = @current_scenario.feature.name
end
AfterStep do |scenario|
	$ss.takeScreenShot(@feature_name + Time.now.to_s)
end
#///////////////////////////////////////////////////////////////////////////////////////////////////


