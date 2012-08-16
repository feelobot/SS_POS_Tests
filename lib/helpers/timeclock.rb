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

	def checkClockin
		frame = $b.frame(:name => 'content')
		Watir::Wait.until(120){frame.span(:class => "display_time").exists?}
		time = frame.span(:class => "display_time").text
	end
	
end #of Class