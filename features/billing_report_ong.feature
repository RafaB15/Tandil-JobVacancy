@billing
Feature: ONG Billing Report

	Background:
		Given a user "pepe@pepito.com" with "ONG" subscription

	Scenario: US90 - 01 One User with an ONG subscription with no offers.
		Given 0 active offers
		When I get the billing report
		Then the amount to pay for the user "pepe@pepito.com" is 0.0

	Scenario: US90 - 02 One User with an ONG subscription with 4 offers.
		Given 4 active offers
		When I get the billing report
		Then the amount to pay for the user "pepe@pepito.com" is 15.0

	Scenario: US90 - 03 One User with an ONG subscription with three offers.
		Given 3 active offers
		When I get the billing report
		Then the amount to pay for the user "pepe@pepito.com" is 0.0

	Scenario: US90 - 04 One User with an ONG subscription with 5 active offers and 2 inactive offers.
		Given 5 active offers
		And 2 inactive offers
		When I get the billing report
		Then the amount to pay for the user "pepe@pepito.com" is 15.0
    And the total active offers are 5
		And the total amount is 15.0