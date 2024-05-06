Feature: User Create
    
    Scenario: US32 - 01 Create a new user account with a valid password
        When I create a new user "pablo@gmail.com" with a password "Hola123$"
        Then I should see a user created confirmation message "User created"
    
    Scenario: US32 - 02 Create a new user account with a invalid short password
        When I create a new user "pablo@gmail.com" with a password "hola"
        Then I should see an error message "Password too short, minimum length is 8 characters"

    Scenario: US32 - 03 Create a new user account with a invalid password with no numbers
        When I create a new user "pablo@gmail.com" with a password "holapepito"
        Then I should see an error message "Password must contain at least one number"

    Scenario: US32 - 04 Create a new user account with a invalid password with no uppercase characters
        When I create a new user "pablo@gmail.com" with a password "holapepito123"
        Then I should see an error message "Missing uppercase letters"

    Scenario: US32 - 05 Create a new user account with a invalid password with no special character
        When I create a new user "pablo@gmail.com" with a password "Hola1234"
        Then I should see an error message "Special character missing : $ , _ , &"

# US53
# =========================================================

    Scenario: US53 - 01 Create an account with default subscription and review it in the report

        When I create a new user with default subscription
        Then I should see a user created confirmation message "User created"
        And I should see "on-demand" subscription in the users report

    Scenario: US53 - 02 Create an account with on-demand subscription and review it in the report

        When I create a new user with "on-demand" subscription
        Then I should see a user created confirmation message "User created"
        And I should see "on-demand" subscription in the users report

    Scenario: US53 - 03 Create an account with corporate subscription and review it in the report

        When I create a new user with "corporate" subscription
        Then I should see a user created confirmation message "User created"
        And I should see "corporate" subscription in the users report

    Scenario: US53 - 04 Create an account with professional subscription and review it in the report

        When I create a new user with "professional" subscription
        Then I should see a user created confirmation message "User created"
        And I should see "professional" subscription in the users report

    @wip
    Scenario: US53 - 05 Create an account with ONG subscription and 5 active job offers and review it in the report

        When I create a new user with "ONG" subscription
        And 5 active offers
        Then I should see "ONG" subscription in the users report