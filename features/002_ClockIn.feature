Feature: 002 Clock In

Background: 
	Given any needed databases are loaded

Scenario: Clock everyone in
	When I am on the "Reports" tab
	And I select the "Payroll" report
	And I select the "Timecard" report
	Given none of the employees are clocked in 

	When I am on the "Timeclock" tab
	And I type employee ID "99" to clock in
    Then the "Sample Manager" timecard should appear
	And the clock in as "Manager" button is pushed
	Then "Current" time and "Clockin" time should match

	When I am on the "Timeclock" tab
    And the clock in as "Sample Receptionist" button is pushed
    Then the "Sample Receptionist" timecard should appear
	And the clock in as "Receptionist" button is pushed
	Then "Current" time and "Clockin" time should match

	When I am on the "Timeclock" tab
    And the clock in as "Sample Stylist 1" button is pushed
    Then the "Sample Stylist 1" timecard should appear
	And the clock in as "Stylist" button is pushed
	Then "Current" time and "Clockin" time should match

	When I am on the "Timeclock" tab
    And the clock in as "Sample Stylist 2" button is pushed
    Then the "Sample Stylist 2" timecard should appear
	And the clock in as "Stylist" button is pushed
	Then "Current" time and "Clockin" time should match
	
