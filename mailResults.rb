require 'mail'
mail = Mail.new do
  from    'QA@rogerspos.com'
  to      'felix.rodriguez@rogerspos.com,david.waters@rogerspos.com'
  subject 'AutoTest Failures'
  add_file '/home/code/SS_POS_Tests/screenshots/lastrun.zip'
  html_part do
    content_type 'text/html; charset=UTF-8'
 	body    '<h3>Failed Features:</h3>' + File.read('cukeResults.txt') + 
 			'<p><a href="http://208.115.198.53/cukeResults.html">See Full Report</a></p>' +
 			'<p><a href="http://208.115.198.53/screenshots">See Screenshots</a></p>'
 end
end
mail.deliver

