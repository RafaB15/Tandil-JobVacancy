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

  Scenario: US14 - 04 Apply to job offer with valid cv link and description and receive an email
    Given I access the offers list page
    When I apply to a job offer with a valid cv link and description
    Then the owner should receive an email with my cv link and description

  Scenario: US02 - 01 Apply to a job offer and add a valid description

    Given I access the offers list page
    When I apply to a job offer with my email "juan@gmail.com" and my description "No tengo experiencia pero si muchas ganas de aprender"
    Then I should see a applied to job offer confirmation message "Contact information sent."

  Scenario: US02 - 02 Apply to a job offer and add a short description

    Given I access the offers list page
    When I apply to a job offer with my email "juan@gmail.com" and my description "Hola"
    Then I should see an error message "Invalid description minimum 10 characters and maximum 500 characters"

  Scenario: US02 - 03 Apply to a job offer and add a long description
    Given I access the offers list page
    When I apply to a job offer with my email "juan@gmail.com" and my description "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec leo blandit tortor consequat commodo suscipit non nibh. Aenean rhoncus diam vehicula, fermentum magna vel, ornare dui. Nullam feugiat diam lacus, id tincidunt justo laoreet in. Maecenas ultricies, ex quis tempus luctus, dui risus condimentum velit, sed maximus orci lorem vel ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet ligula ut lectus pretium finibus quis facilisis sem. Nulla eleifend, augue nec venenatis viverra, erat nisl blandit enim, eget interdum risus ipsum nec tortor. Nunc dictum, nisi non dictum viverra, turpis libero cursus lorem vel."
    Then I should see an error message "Invalid description minimum 10 characters and maximum 500 characters"

  Scenario: US02 - 04 Apply to a job offer with valid description sends email to offerer correctly
    Given I access the offers list page
    When I apply to a job offer with a valid description
    Then the owner should receive an email with my description