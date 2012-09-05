@incomplete
Feature: 010 Restrictions

Background: 
    Given any needed databases are loadeds

Scenario: Add a mew discount restriction
    Given I am on the "Manager" tab 
    And I select the "Discounts" button
    And I create a new discount restriction
    Then it should save properly

Scenario: Add multiple variable services to a sale 
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
    And "Sample Stylist 2" should appear under the item in checkout
    And percent discount is added to checkout
    And the discount should be deducted from the total
    Then complete the ticket

And check if the database needs to be saved