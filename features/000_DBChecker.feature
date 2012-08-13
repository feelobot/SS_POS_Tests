

Feature: Database checker utility
	In Order to verify the checker works
	As a database cleanup utility
	I want to show 0 changes made the second pass

Background:
	Given The Database is New and Untouched
	
Scenario:
	When I run the "dbchecker" utility 2 times
	Then there should be no index changes
	
