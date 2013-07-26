Feature: Job Offers
  In order to get employees
  As a job offerer
  I want to publish my offers

  Background:
  	Given I am logged in as job offerer

  Scenario: Create new offer
    Given I access the new offer page
    When I fill the title with "Programmer vacancy"
		And confirm the new offer    
    Then I should see "Offer created"
	And I should see "Programmer vacancy"