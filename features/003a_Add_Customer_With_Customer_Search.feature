Feature: Add Customer Using Customer Search
	In Order to store transaction history
	customers should be stored into the database
Background:
	Given there exists only a sample customer
	
Scenario:
	When "New Ticket" is pushed
    And  "Add Customer" is pushed
