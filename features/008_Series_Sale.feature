@incomplete
Feature: 008 Series Sale

Background: 
    Given any needed databases are loaded

Scenario: Add a new series sale item in the system
    Given I am on the "Manager" tab 
    And I select the "Series Sale" button
    And I create a new series sale item

Scenario: Choose the next available stylist
    Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And "Julio Rodriguez" is entered in customer search
    When I select the customer "Julio Rodriguez" and hit next
    Then the Ticket Options window should appear
    When "Next Available" is set as the requested stylist
    And "Send to Servicing" is pushed from ticket options
    Then the ticket color should be "orange"
    And Adult Haircut service is selected for checkout
    Then complete the ticket

And check if the database needs to be saved