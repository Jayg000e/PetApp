Feature: delete activity

  Scenario: delete activity
    Given there are users with the following details:
      | Username  | Password  | Role |
      | user1     | password1 |      |
    Given there are pets with the following details:
      | Name      | Pet Type | Birthdate  | Breed            |
      | Fido      | Dog      | 2019-05-10 | Golden Retriever |
      | Whiskers  | Cat      | 2020-02-15 | Siamese          |
    Given there are activities with the following details:
      | Content                  | Pet  |
      | He eats a lot these days | Fido | 
      | He is not friendly       | Fido |
    Given I have login
    When I visit the activity page
    Then I should see the following activities:
      | Content                      | Pet  |
      | He eats a lot these days     | Fido | 
      | He is not friendly           | Fido |
    And pending
