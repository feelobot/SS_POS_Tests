@complete
Feature: 000b DBChecker

Background: 
	Given The Database is New and Untouched

Scenario: Verify Check Database Structure Utility is working properly	
	When I am on the "Setup" tab
	And I select the "Utilities" button
	When I run the "Check Database Structure" utility
	And Wait for "Database Check Completed"
	And I select the "Utilities" button
	And I run the "Check Database Structure" utility
	And Wait for "Database Check Completed"
	Then there should be no database changes
	
And check if the database needs to be saved
