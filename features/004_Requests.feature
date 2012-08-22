Feature: Request a Specific Stylist
	As a customer I want to request a cetain stylist
	So that she will recieve commissions for my haircut

Background:
	Given the requested stylist is clocked in
	
Scenario:
	When "New Ticket" is pushed from sales tab
    And "Sample Customer" is selected from customer search
    When "Sample Stylist 1" is preselected from ticket options
    And "Send to Waiting" is pushed from ticket options
    When the ticket appears on the wait/serve screen
    Then the ticket color should be "Yellow"
    When the ticket is pushed to "Servicing" from waiting
    Then the ticket color should be "Yellow"
    When the ticket is pushed to "Checkout" from servicing
    Then the ticket should have a request on the checkout screen
    And "Sample Stylist 1" underneath the request