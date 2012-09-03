@complete
Feature: 001 Open Till

Background: 
	Given any needed databases are loaded
	
Scenario: Open the till with $250
	When I am on the "Manager" tab 
	And I select the "Opening" button
	Then the status of the till is "Incomplete"
	When I store the following into cash count helper
	
	|  Hundreds     |  1    |
	|  Fifties      |  1    |
	|  Twenties     |  2    |
	|  Tens         |  1    |
	|  Fives        |  2    |
	|  Two Dollar   |  5    |
	|  Dollar       |  10   |
	|  Half-Dollar  |  20   |
	|  Quarters     |  10   |
	|  Dimes        |  20   |
	|  Nickles      |  50   |
	|  Cents        |  300  |

	Then the cash count helper should show the following results

	|  Hundreds     |  1    |  100.00  |
	|  Fifties      |  1    |  50.00   |
	|  Twenties     |  2    |  40.00   |
	|  Tens         |  1    |  10.00   |
	|  Fives        |  2    |  10.00   |
	|  Two Dollar   |  5    |  10.00   |
	|  Dollar       |  10   |  10.00   |
	|  Half-Dollar  |  20   |  10.00   |
	|  Quarters     |  10   |  2.50    |
	|  Dimes        |  20   |  2.00    |
	|  Nickles      |  50   |  2.50    |
	|  Cents        |  300  |  3.00    |

	And the Opeing Till Cash should show
	|  Total Cash Count  |  250.00  |
	|  Counted Till      |  250.00  |
	|  Expected Till     |  100.00  |
	|  Difference        |  150.00  |

	When I hit "Save" Opening Till Count
	Then the status of the till is "Completed"

And check if the database needs to be saved
