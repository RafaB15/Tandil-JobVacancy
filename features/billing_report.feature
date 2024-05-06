@billing
Feature: Billing Report

  Scenario: b1 - billing report when no active offers
    Given there are no users 
    And there are no offers at all
    When I get the billing report
    Then the total active offers is 0
    And the total amount is 0.0

  Scenario: b2 - billing report when professional subscription with 7 offers
    Given a user "pepe@pepito.com" with "professional" subscription
    And 7 active offers
    When I get the billing report
    Then the subscription for the user "pepe@pepito.com" is "professional"
    Then the active offers count for the user "pepe@pepito.com" is 7
    Then the amount to pay for the user "pepe@pepito.com" is 44.0
    And the total active offers are 7
