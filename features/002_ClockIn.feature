Feature: Clock In
	In Order to clock in and out for work
	As an employee
	I want to show the times save and update correctly

Background:
	Given No one has clocked in for the day
	
Scenario:
	When I select the 'Sample Manager'
	And I clock in as 'Stylist'
	Then the current time should show
	And 'Sample Manager' should be able to ringout sales
	
