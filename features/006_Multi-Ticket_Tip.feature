Feature: 006 Multi Ticket Tip 

Background: 
    Given any needed databases are loaded

Scenario: Choose the next available stylist
    Given I am on the "Sales" tab 
    When the "New Ticket" button in sales is selected
    And "Julio Rodriguez" is entered in customer search
    When I select the customer "Julio Rodriguez" and hit next
    Then the Ticket Options window should appear
    When "Next Available" is set as the requested stylist
    And "Send to Waiting" is pushed from ticket options
    When "Next Available" ticket appears on the wait/serve screen
    Then the ticket color should be "orange"
    When the ticket is pushed to "Servicing" from waiting
    And "Next available" is set as the requested employee
    Then the ticket color should be "orange"
    When the ticket is pushed to "Checkout" from servicing
    And Adult Haircut service is selected for checkout
    And "Sample Receptionist" should appear under the item in checkout
    Then put the ticket on hold

     When the "New Ticket" button in sales is selected
    And "Felix Rodriguez" is entered in customer search
    When I select the customer "Felix Rodriguez" and hit next
    Then the Ticket Options window should appear
    When "Next Available" is set as the requested stylist
    And "Send to Waiting" is pushed from ticket options
    When "Next Available" ticket appears on the wait/serve screen
    Then the ticket color should be "orange"
    When the ticket is pushed to "Servicing" from waiting
    And "Next available" is set as the requested employee
    Then the ticket color should be "orange"
    When the ticket is pushed to "Checkout" from servicing
    And Adult Haircut service is selected for checkout
    And "Sample Receptionist" should appear under the item in checkout
    Then put the ticket on hold

    When the "New Ticket" button in sales is selected
    And "Sample Customer" is entered in customer search
    When I select the customer "Sample Customer" and hit next
    Then the Ticket Options window should appear
    When "Next Available" is set as the requested stylist
    And "Send to Waiting" is pushed from ticket options
    When "Next Available" ticket appears on the wait/serve screen
    Then the ticket color should be "orange"
    When the ticket is pushed to "Servicing" from waiting
    And "Next available" is set as the requested employee
    Then the ticket color should be "orange"
    When the ticket is pushed to "Checkout" from servicing
    And Adult Haircut service is selected for checkout
    And "Sample Receptionist" should appear under the item in checkout
    Then put the ticket on hold