@development
Feature: 005 Multi Ticket Tests

Background: 
    Given any needed databases are loaded

Scenario: Merge 4 tickets on a multi-ticket
    Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And "Julio Rodriguez" is entered in customer search
    When I select the customer "Julio Rodriguez" and hit next
    Then the Ticket Options window should appear
    When "Sample Stylist" is set as the requested stylist
    And Adult Haircut service is selected in ticket options
    And "Send to Servicing" is pushed from ticket options
    Then the ticket color should be "orange"

    Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And "Felix Rodriguez" is entered in customer search
    When I select the customer "Felix Rodriguez" and hit next
    Then the Ticket Options window should appear
    When "Sample Stylist 2" is set as the requested stylist
    And Adult Haircut service is selected in ticket options
    And "Send to Servicing" is pushed from ticket options
    Then the ticket color should be "orange"

    Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And "Sample Customer" is entered in customer search
    When I select the customer "Sample Customer" and hit next
    Then the Ticket Options window should appear
    When "Sample Manager" is set as the requested stylist
    And Adult Haircut service is selected in ticket options
    And "Send to Check-Out" is pushed from ticket options

    When all 3 holding tickets are added to the current ticket
    And I ringout the ticket
    And I add $ "30.00" more than the total cost of the multi-ticket
    Then the tip for each stylist should be $ "7.50"
    And the multi-ticket sale is completed.

And check if the database needs to be saved