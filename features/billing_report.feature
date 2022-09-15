@billing @wip
Feature: Billing Report

  Scenario: on-demand subscription with no offers
    Given a user with an on-demand susbcription
    And 0 active offers
    When I get the billing report
    Then the billing for this user is 0

  Scenario: on-demand subscription with one active offer
    Given a user with an on-demand susbcription
    And 1 active offers
    When I get the billing report
    Then the billing for this use is 10.0

  Scenario: profesional subscription with no active offers
    Given a user with a profesional susbcription
    And 0 active offers in the whole month 
    When I get the billing report
    Then the billing for this use is 30

  Scenario: profesional subscription with 5 offers
    Given a user with a profesional susbcription
    And 5 active offers in the whole month 
    When I get the billing report
    Then the billing for this use is 30

  Scenario: profesional subscription with more than 5 offers
    Given a user with a profesional susbcription
    And 7 active offers in the whole month 
    When I get the billing report
    Then the billing for this use is 44

  Scenario: profesional subscription with 5 offers but only 3 active
    Given a user with a profesional susbcription
    And 3 active offers in the whole month
    And 2 non active offers 
    When I get the billing report
    Then the billing for this use is 30
    
  Scenario: profesional subscription with 7 offers but only 5 active
    Given a user with a profesional susbcription
    And 5 active offers in the whole month
    And 2 non active offers 
    When I get the billing report
    Then the billing for this use is 30    