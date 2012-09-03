Feature: 007 Refund

Background: 
    Given any needed databases are loaded

Scenario: A customer comes in and asks for a refund for a product
    Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And "Julio Rodriguez" is entered in customer search
    When I select the customer "Julio Rodriguez" and hit next
    Then the Ticket Options window should appear
    When "Next Available" is set as the requested stylist
    And "Send to Servicing" is pushed from ticket options
    Then the ticket color should be "orange"
    And Adult Haircut service is selected for checkout
    Then put the ticket on hold

And check if the database needs to be saved