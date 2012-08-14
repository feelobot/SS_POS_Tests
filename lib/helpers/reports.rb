class Reports
	def load(report)
		allreports = {
						#SALES
						#SERVICES
						#PRODUCTS
						#DISCOUNTS
						#GIFTS
						#PAYROLL
						"Payroll" => '//*[@id="payroll"]'
							"Employee List" => "(//button[@type='button'])[59]",
							"Employee Points" => "(//button[@type='button'])[60]",
							"Schedule Forcasting" => "(//button[@type='button'])[61]",
							"Schedule Forcasting" => "(//button[@type='button'])[62]",
							"Timecard" => "(//button[@type='button'])[63]",
							"Labor and Sales" => "",
							"Time Clock Audit" => "",
							"Annnual Bonus" => "",
							"Employee Contact List" => "",
							"Tip Detail" => "",
							"Tip Adjust" => "",
						#CUSTOMERS
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#AUDIT
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#MINI-REPORTS
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#TECHNICIAN DAILY SALES
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#TRANSACTION DETAIL
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#TAXES
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						#RETAIL
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => "",
						"" => ""
					}
		path = allreports.fetch(report)
		$driver.switch_to.default_content
		$driver.switch_to.frame 'content'
		$driver.switch_to.frame 'setupcontent'
		$element = $driver.find_element(:xpath, path)
		$element.click
	end #of Run
end #of Class