Feature: Clock In
	In Order to clock in and out for work
	As an employee
	I want to show the times save and update correctly

Background:
	Given none of the employees are clocked in
	
Scenario:
	When I type employee ID "99" 
    Then the "Sample Manager" timecard should appear
    And if I click "Sample Manager" button
    Then the "Sample Manager" timecard should appear
	When clock in as "Stylist" button is pushed
	Then "Current Time" and "Clockin Time" should match
	
