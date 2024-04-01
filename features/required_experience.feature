Feature: Required Experience
  In order to get employees
  As a job offerer
  I want to detail the required experience 
  While creating an offer

  Background:
  	Given I am logged in as job offerer

	@wip
  Scenario: Create new deactivated offer
    When I create a new offer with "Smalltalk Dev" as the title and "10" as required years of experience
    Then I should see a offer created confirmation message
    And I should see "Smalltalk Dev" with "10" required years of experience in my offers list

	@wip
  Scenario: Check values of activated offer
    Given I have a offer with "Smalltalk Dev" as title and "10" as required years of experience in my offers list
    When I activate the job offer
    Then I should see a offer activated confirmation message
    And I should see "Smalltalk Dev" with "10" required years of experience in the job offers tab

  @wip
  Scenario: Create new deactivated offer with no required experience
    When I create a new offer with "Rust Dev" as the title and "" as required years of experience
    Then I should see a offer created confirmation message
    And I should see "Rust Dev" with "Not specified" required years of experience in my offers lists

  @wip
  Scenario: Check values of activated offer with no required experience
    Given I have "Rust Dev" offer in my offers list
    When I activate the job offer
    Then I should see a offer activated confirmation message
    And I should see "Rust Dev" with "Not specified" required years of experience in the job offers tab

  @wip
  Scenario: Create new deactivated offer with 0 required experience
    When I create a new offer with "Solidity Dev" as the title and "0" as required years of experience
    Then I should see a offer created confirmation message
    And I should see "Solidity Dev" with "Not specified" required years of experience in my offers list

  @wip
  Scenario: Check values of activated offer with 0 required experience
    Given I have "Solidity Dev" offer in my offers list
    When I activate the job offer
    Then I should see a offer activated confirmation message
    And I should see "Solidity Dev" with "Not specified" required years of experience in the job offers tab

  @wip
  Scenario: Update offer
    Given I have "Smalltalk Dev" offer in my offers list
    When I change the required years of exprience to "4"
    Then I should see a offer updated confirmation message
    And I should see "Smalltalk Dev" with "4" required years of experience in my offers list

  @wip
  Scenario: Update offer to no required experience
    Given I have "Smalltalk Dev" offer in my offers list
    When I change the required years of exprience to ""
    Then I should see a offer updated confirmation message
    And I should see "Smalltalk Dev" with "Not specified" required years of experience in my offers list

  @wip
  Scenario: Update offer with 0 required experience to 8 years of experience
    Given I have "Solidity Dev" offer in my offers list
    When I change the required years of exprience to "8"
    Then I should see a offer updated confirmation message
    And I should see "Solidity Dev" with "8" required years of experience in my offers list

  @wip
  Scenario: Try to create a offer with text as required years of experience
    When I create a new offer with "C Dev" as the title and "Experienced" as required years of experience
    Then I should see an error message

  @wip
  Scenario: Try to create a offer with negative value as required years of experience
    When I create a new offer with "C Dev" as the title and "-5" as required years of experience
    Then I should see an error message