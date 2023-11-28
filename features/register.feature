Feature: register

    Scenario: register
        Given I am on the home page
        Then I click on the login link
        And I click on the signup link
        Then I fill in "Email" with "user1@example.com"
        And I fill in "Username" with "user1"
        And I fill in "Password" with "password1"
        And I click on "Create Account"
        Then I should see an alert with text "User created successfully!"