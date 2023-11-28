Feature: User create activity for a pet

  Scenario: User successfully added an activity
    Given there are users with the following details:
      | Username  | Password  | Role | Email             |
      | user1     | password1 |      | user1@example.com |
    Given there are pets with the following details:
      | Name      | Pet Type | Birthdate  | Breed            |
      | Fido      | Dog      | 2019-05-10 | Golden Retriever |
      | Whiskers  | Cat      | 2020-02-15 | Siamese          |
    Given I have login
    Given I am on the createActivity page for pet 1
    When I fill in "Enter activity content..." with "Sample Activity"
    And I click the "Create Activity" button
    Then I should see an alert with text "Activity created successfully!"
    And I should be redirected back to the activity page for pet 1
