Feature: User Create
    
    Scenario: US32 - 01 Create a new user account with a valid password
        When I create a new user "pablo@gmail.com" with a password "Hola123$"
        Then I should see a user created confirmation message "User created"
    
    @wip
    Scenario: US32 - 02 Create a new user account with a invalid short password
        When I create a new user "pablo@gmail.com" with a password "hola"
        Then I should see an error message "Password too short, minimum length is 8 characters"
