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

  Scenario: US14 - 03 Apply to a job offer and add a invalid CV link with no .com
    Given I access the offers list page
    When I apply to a job offer with my email "juan@gmail.com" and my CV link "www.linkedin/juan"
    Then I should see an error message "Invalid CV link"

@wip
Scenario: US02 - 01 Apply to a job offer and add a valid description

    Given I access the offers list page
    When I apply to a job offer with my email "juan@gmail.com" and my description "No tengo experiencia pero si muchas ganas de aprender"
    Then I should see a applied to job offer confirmation message "Contact information sent."

@wip
Scenario: US02 - 02 Apply to a job offer and add a short description

    Given I access the offers list page
    When I apply to a job offer with my email "juan@gmail.com" and my description "Hola"
    Then I should see an error message "Invalid description minimum 10 characters and maximum 500 characters"

@wip
Scenario: US02 - 03 Apply to a job offer and add a long description

    Given I access the offers list page
    When I apply to a job offer with my email "juan@gmail.com" and my description "Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola"
    Then I should see an error message "Invalid description minimum 10 characters and maximum 500 characters"
