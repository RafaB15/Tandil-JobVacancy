@billing @wip
Feature: Billing Report

  Background:
    Given user "oscar@test.com" with an on-demand susbcription

  Scenario: billing report when no active offers
    Given there are no offers at all
    When I get the billing report
    Then the total active offers is 0
    And the total amount is 0.0
