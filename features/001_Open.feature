Feature: Open Till
	In Order to count and the opening till
	As stylist
	I want to show the values add up correctly and save properly

Background:
	Given The till has not been opened prior
	
Scenario:
	When I select the 'Manager' tab
	And I select the 'Opening' button
	And I enter amounts in all the fields
	Then the counter should tally up all the values
	And when I hit save
	Then the opening till should be complete
	
