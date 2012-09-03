require 'rubygems'
require 'bundler/setup'	
require 'capybara/cucumber'
require 'timeout'
require 'selenium-webdriver'
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
if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new
  headless.start 
  headless.video.start_capture
 
  at_exit do
  	headless.video.stop_and_save("sspos_cukes#{Time.now}.mov")
    headless.destroy
  end
end
#///////////////////////////////////////////////////////////////////////////////////////////////////
# WATIR START AND CONFIG 
#///////////////////////////////////////////////////////////////////////////////////////////////////
$b = Watir::Browser.new :chrome
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
	if @current_scenario.failed?
		Cucumber.wants_to_quit = true 
	end
end
#///////////////////////////////////////////////////////////////////////////////////////////////////

if ENV['MAIL']
  at_exit do
    require 'mail'
    `zip -r -9 --exclude=*.zip* /home/felix/Code/SS_POS_Tests/screenshots/lastrun.zip /home/felix/Code/SS_POS_Tests/screenshots`
      mail = Mail.new do
      from    'QA@rogerspos.com'
      to      'felix.rodriguez@rogerspos.com'
      subject 'AutoTest Failures'
      add_file '/home/felix/Code/SS_POS_Tests/screenshots/lastrun.zip'
      html_part do
        content_type 'text/html; charset=UTF-8'
        body  '<h3>Failed Features:</h3>' + File.read('cukeResults.txt') + 
              '<p><a href="http://testing.supersalon.com/cukeResults.html">See Full Report</a></p>' +
              '<p><a href="http://testing.supersalon.com/screenshots">See Screenshots</a></p>' +
              '<p><a href="#{baseURL}/coverage/index.php">Code Coverage</a></p>'
      end
    end
    mail.deliver
    `mv /home/felix/Code/SS_POS_Tests/screenshots/lastrun.zip /home/felix/Code/SS_POS_Tests/screenshots/date +%Y%m%d-%T .zip`
    `cd /home/felix/Code/SS_POS_Tests/screenshots && find . -type f -iname \*.png -delete`
  end
  
end


