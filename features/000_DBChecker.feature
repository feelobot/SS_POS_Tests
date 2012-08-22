Feature: 000b DBChecker
	As a database cleanup utility
	I want to show 0 changes made the second pass


Background:
	Given The Database is New and Untouched
	When I am on the "Setup" Tab
	And I select the "Utilities" Button

Scenario: 
	When I run the "Check Database Structure" utility
	And Wait for "Database Check Completed"
	And I select the "Utilities" Button
	And I run the "Check Database Structure" utility
	And Wait for "Database Check Completed"
	Then there should be no database changes
	
