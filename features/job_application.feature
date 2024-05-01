Feature: Job Application
  In order to get a job
  As a candidate
  I want to apply to an offer

  Background:
  	Given only a "Web Programmer" offer exists in the offers list

  Scenario: Apply to job offer
    Given I access the offers list page
    When I apply
    Then I should receive a mail with offerer info

  Scenario: US14 - 01 Apply to a job offer and add a valid CV link
    Given I access the offers list page
    When I apply to a job offer with my email "juan@gmail.com" and my CV link "www.linkedin/juan.com"
    Then I should see a applied to job offer confirmation message "Contact information sent."

  Scenario: US14 - 02 Apply to a job offer and add a invalid CV link with no www.
    Given I access the offers list page
    When I apply to a job offer with my email "juan@gmail.com" and my CV link "linkedin/juan.com"
    Then I should see an error message "Invalid CV link"