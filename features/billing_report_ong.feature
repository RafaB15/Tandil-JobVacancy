@billing
Feature: ONG Billing Report

	Background:
		Given a user "pepe@pepito.com" with "ONG" subscription
	@wip
	Scenario: US90 - 01 One User with an ONG subscription with no offers.
		Given 0 active offers
		When I get the billing report
		Then the amount to pay for the user "pepe@pepito.com" is 0.0

    