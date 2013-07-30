Feature: Home page

  Scenario: Browse default page
    When I browse the default page
    Then I should see "register"
    And I should see "Job offers"
