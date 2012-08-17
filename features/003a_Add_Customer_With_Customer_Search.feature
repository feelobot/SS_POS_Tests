Feature: Add Customer Using Customer Search
	In Order to save a customer in the database
	When they are searched and not found
	Then the add customer button should pre-load the information searched.
	
Background:
	Given there exists only a sample customer
	
Scenario:
	When "New Ticket" is pushed
    And  "Add Customer" is pushed
