Feature: Unique registration email
  
  @wip 
  Scenario: US50 - 01 Create a new user account with a new email
    Given I create a new user "Pablo" with the email "pablito@gmail.com"
    And The email was never used to create another account
    Then I should see a user created confirmation message "Contact information sent."
    And I should log in with my new user account

    