Feature: Login functionality

  Scenario: User successfully logs in
    Given I am on the home page
    Given there are users with the following details:
      | Username  | Password  | Role | Email             |
      | user1     | password1 |      | user1@example.com |
    When I click on the login link
    And I fill in the login form with valid credentials
    And I click the submit button
    Then I should be logged in successfully

  Scenario: User fails to log in with invalid credentials
    Given I am on the home page
    When I click on the login link
    And I fill in the login form with invalid credentials
    And I click the submit button
    Then I should see an error message
