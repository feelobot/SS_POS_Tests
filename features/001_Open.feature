Feature: Open Till
	In Order to count and the opening till
	As stylist
	I want to show the values add up correctly and save properly

Background:
	Given the status of the till is "Incomplete"
	
Scenario:
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

	Then I should get the following results

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

	And the "Total Cash Count" should be "250.00"
	And the "Counted Till" should be "250.00"
	And the "Expected Till" should be "100.00"
	And the "Difference" should be "150.00"
	When I hit "Save" Opening Till Count
	Then the status should change to "Completed"
