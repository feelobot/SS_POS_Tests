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
    And the ticket total is "$32.85"
    And I ringout the ticket
    And $ "50.00" "Cash" is added on payment screen
    Then the tip for "Sample Stylist 1" should be $ "0"
    Then the tip for "Sample Stylist 2" should be $ "0.00"
    Then the tip for "Sample Manager" should be $ "0.00"
    And the Split Tips button is pushed
    Then the tip for Sample Stylist 1 should be $ "5.72"
    Then the tip for Sample Stylist 2 should be $ "5.72"
    Then the tip for Sample Manager should be $ "5.71"
    Then select continue on the tip screen
    And the multi-ticket sale is completed

And check if the database needs to be saved