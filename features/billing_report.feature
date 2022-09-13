@billing @wip
Feature: Billing Report

  Scenario: on-demand subscription with no offers
    Given a user with an on-demand susbcription
    And 0 active offers
    When I get the billing report
    Then the billing for this use is 0


  Scenario: on-demand subscription with one offer
    Given a user with an on-demand susbcription
    And 1 active offers
    When I get the billing report
    Then the billing for this use is 10.0

  # Scenario: professional subscription with no offers
  # Scenario: professional subscription with 5 offers
  # Scenario: professional subscription with more than 5 offers
    