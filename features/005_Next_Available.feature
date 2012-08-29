Feature: 005 Next Available

Background: 
    Given any needed databases are loaded

Scenario: Create 3 Seperate Tickets and merge them together on a multi-ticket
    Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And  I skip customer selection
    Then the Ticket Options window should appear
    When "Next Available" is set as the requested stylist
    And "Send to Waiting" is pushed from ticket options
    Then the ticket color should be "orange"
    When the ticket is pushed to "Servicing" from waiting
    And "Next available" is set as the requested employee
    Then the ticket color should be "orange"
    When the ticket is pushed to "Checkout" from servicing
    And Adult Haircut service is selected for checkout
    And "Sample Receptionist" should appear under the item in checkout
    Then void the ticket 