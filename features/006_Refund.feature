@incomplete
Feature: 006 Refund Tests

Background: 
    Given any needed databases are loaded

Scenario: A customer comes in and requests a refund
    Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And "Julio Rodriguez" is entered in customer search
    When I select the customer "Julio Rodriguez" and hit next
    Then the Ticket Options window should appear
    When "Next Available" is set as the requested stylist
    And Refund is set in ticket options
    And "Send to Checkout" is pushed from ticket options
    And refund is selected for checkout
    And Adult Haircut service is selected for checkout
    And a negative balance of "" should appear
    Then Complete the ticket
And check if the database needs to be saved