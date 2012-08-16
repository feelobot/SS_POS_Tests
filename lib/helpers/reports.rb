class Reports

	def run(report)
		allreports = {
			#SALES
			#SERVICES
			#PRODUCTS
			#DISCOUNTS
			#GIFTS
			#PAYROLL
			"Payroll" => '//*[@id="payroll"]',
				"Employee List" => "(//button[@type='button'])[59]",
				"Employee Points" => "(//button[@type='button'])[60]",
				"Schedule Forcasting" => "(//button[@type='button'])[61]",
				"Schedule Forcasting" => "(//button[@type='button'])[62]",
				"Timecard" => "(//button[@type='button'])[63]",
				"Labor and Sales" => "(//button[@type='button'])[64]",
				"Time Clock Audit" => "(//button[@type='button'])[65]",
				"Annnual Bonus" => "(//button[@type='button'])[66]",
				"Employee Contact List" => "(//button[@type='button'])[67]",
				"Tip Detail" => "(//button[@type='button'])[68]",
				"Tip Adjust" => "(//button[@type='button'])[69]",
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
		$b.frame(:name => "content").frame(:name => "filter").button(:xpath => path).click
	end #of Run

	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# SET TIMECARD OPTIONS
	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	def setPeriod(index)
		$b.frame(:name => "content").frame(:name => "filter").select_list(:name, "FILTER[period]").option(:index, index).select
	end

	def generate
		$b.frame(:name => "content").frame(:name => "filter").button(:name => "cmd").click
	end
end #of Class