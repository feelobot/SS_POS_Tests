@complete
Feature: 003 Add Customer

Scenario: Add a customer with phone number by using search autocomplete
	Given I am on the "Sales" tab 
	When the "New Ticket" button in sales is selected
	And there exists a customer named "Sample Customer"
    And "Julio Rodriguez 9549388184" is entered in customer search
    Then the "No Customers Match Search" message should appear
    When "Add New Customer" is selected in customer selection screen
    Then the New Customer window should contain the following: 
 
	    |  firstname	|  Julio       |
	    |  lastname     |  Rodriguez   |
	    |  homephone	|  9549388184  |

	And if "33334" is entered for the zip code
	Then the Country and State should autopopulate with the following:
		
		|	city 		|	Fort Lauderdale		|
		|	state		|	FL					|
		|	country 	| 	United States 		|

    And if the Save button is pushed in the new customer window
    Then a mandatory gender requirement error should appear

    When the New Customer window is filled with the following:

    	|	middlename		|	Felix				|
	    |	address1		|	313 NE 48th St.		|
	    |	address2		|	9549388184			|
	    |	email			|	julio@email.com 	|
	    |	gender 			| 	male 				|

	And if the Save button is pushed in the new customer window
	Then the customer should save without any errors
	And "Julio Rodriguez" should be entered in the customer database

Scenario: Add another customer from autocomplete
    Given I am on the "Sales" tab 
	When the "New Ticket" button in sales is selected
    And "Felix Rodriguez" is entered in customer search
    Then the "No Customers Match Search" message should appear
    When "Add New Customer" is selected in customer selection screen
    When the New Customer window is filled with the following:

    	|	middlename		|	A 					|
	    |	address1		|	312 NW 49th St.		|
	    |	address2		|	1234567891			|
	    |	email			|	felix@email.com 	|
	    |	gender 			| 	male 				|

	And if the Save and Use button is pushed in the new customer window
	Then "Felix Rodriguez" customer name should be in ticket options

And check if the database needs to be saved