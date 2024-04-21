@billing
Feature: Billing Report

  Scenario: b1 - billing report when no active offers
    Given there are no users 
    And there are no offers at all
    When I get the billing report
    Then the total active offers is 0
    And the total amount is 0.0
