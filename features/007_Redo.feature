@incomplete
Feature: 007 Refund

Background: 
    Given any needed databases are loaded

Scenario: A customer comes in and asks for a refund for a product
    Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And "Felix Rodriguez" is entered in customer search
    When I select the customer "Felix Rodriguez" and hit next
    Then the Ticket Options window should appear
    When "Next Available" is set as the requested stylist
    And Redo is set in ticket options
    And "Send to Servicing" is pushed from ticket options
    Then the ticket color should be "pink"
    And redo is selected for checkout
    And Adult Haircut service is selected for checkout
    And a zero balance on the service should appear
    Then Complete the ticket

And check if the database needs to be saved