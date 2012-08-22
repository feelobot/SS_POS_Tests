Feature: 002 Clock In
	In Order to clock in and out for work
	As an employee
	I want to show the times save and update correctly
	
Scenario: Clock everyone in
	When I am on the "Reports" Tab
	And I select the "Payroll" Report
	And I select the "Timecard" Report
	Given none of the employees are clocked in 

	When I am on the "Timeclock" Tab
	And I type employee ID "99" to clock in
    Then the "Sample Manager" timecard should appear
	And the clock in as "Stylist" button is pushed
	Then "Current" time and "Clockin" time should match

	When I am on the "Timeclock" Tab
    And the clock in as "Sample Receptionist" button is pushed
    Then the "Sample Receptionist" timecard should appear
	And the clock in as "Stylist" button is pushed
	Then "Current" time and "Clockin" time should match
	
