Feature: Add Customer Using Customer Search
	In Order to save a customer in the database
	When they are searched and not found
	Then the add customer button should pre-load the information searched.
	
Background:
	Given there exists a "Sample Customer"
	
Scenario:
	When "New Ticket" is pushed from sales tab
    When "Julio Rodriguez 9549388184" is entered in customer search
    Then the "No Customers Match Search" message should appear
    When "Add Customer" is selected
    Then "Julio" should show for first name
    And "Rodriguez" should show for last name
    And "9549388184" should show for home phone

