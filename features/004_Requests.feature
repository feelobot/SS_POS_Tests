Feature: 004 Request

Background: 
    Given any needed databases are loadeds

Scenario: Pre Select A Stylist as Request
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