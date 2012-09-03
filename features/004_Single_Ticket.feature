@complete
Feature: 004 Single Ticket Tests

Background: 
    Given any needed databases are loadeds

Scenario: 004a Pre Select A Stylist as Request
	Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And "Julio Rodriguez" is entered in customer search
    When I select the customer "Julio Rodriguez" and hit next
    Then the Ticket Options window should appear
    When "Sample Stylist 1" is set as the requested stylist
    And "Send to Waiting" is pushed from ticket options
    When "Julio Rodriguez" ticket appears on the wait/serve screen
    Then the ticket color should be "yellow"
    When the ticket is pushed to "Servicing" from waiting
    And "Sample Stylist 1" is set as the requested employee
    Then the ticket color should be "yellow"
    When the ticket is pushed to "Checkout" from servicing
    Then the ticket should have a request on the checkout screen
    And "Sample Stylist 1" underneath the request
    Then void the ticket

Scenario: 004b Create 3 Seperate Tickets and merge them together on a multi-ticket
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

Scenario: 004c Add multiple services to a sale 
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
    And Shampoo & Style service is selected for checkout
    And "Sample Manager" should appear under the item in checkout
    Then void the ticket

Scenario: 004d Add multiple variable services to a sale 
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
    And Shampoo & Style service is selected for checkout
    And "Sample Stylist 2" should appear under the item in checkout
    Then void the ticket

And check if the database needs to be saved