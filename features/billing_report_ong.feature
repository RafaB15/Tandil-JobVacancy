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
