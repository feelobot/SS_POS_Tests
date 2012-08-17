class Timeclock
	def searchID(id)
		frame = $b.frame(:name => 'content')
		frame.text_field(:id, "employee_code").set(id)
		$b.send_keys :enter
	end

	def employee(name)
		employees = {
			"Sample Manager" => '//div[8]/div/div[3]/button',
			"Sample Receptionst" => '//div[8]/div/div[3]/button[2]',
			"Sample Stylist 1" => '//div[8]/div/div[3]/button[3]',
			"Sample Stylist 2" => '//div[8]/div/div[3]/button[4]',
			"Sample Stylist 3" => '//div[8]/div/div[3]/button[5]',
			"Sample Stylist 4" => '//div[8]/div/div[3]/button[6]',
			"Sample Stylist 5" => '//div[8]/div/div[3]/button[7]'
		}
		path = employees.fetch(name)
		frame = $b.frame(:name => 'content')
		frame.button(:xpath, path).click
	end #of Run


	def checkEmployee
		frame = $b.frame(:name => 'content')
		Watir::Wait.until(120){frame.span(:class => "header_text").exists?}
		employee = frame.span(:class => "header_text").text
		return employee
	end

	def get(info)
		frame = $b.frame(:name => 'content')
		if info == "Current Time"
			Watir::Wait.until(120){frame.span(:xpath => '//*[@id="display_time"]').exists?}
			value = frame.span(:xpath => '//*[@id="display_time"]').text
		else
			info_data = {
				"Clockin Time" => '//*[@id="times"]/div[2]',
				"Edited Time" => '//*[@id="times"]/div[3],',
				"Clockin Position" => '//*[@id="times"]/div[4]',
				"Clockout Time" => '//*[@id="times"]/div[6]',
				"Clockout Position" => '//*[@id="times"]/div[8]'
			}
			path = info_data.fetch(info)
			Watir::Wait.until(120){frame.div(:xpath => path).exists?}
			value = frame.div(:xpath => path).text
		end
		return value
	end
	
end #of Class