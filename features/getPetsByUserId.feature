Feature: Pet List
  As a user
  I want to view a list of pets
  So that I can see information about each pet

  Scenario: Display list of pets
    Given there are users with the following details:
      | Username  | Password  | Role |
      | user1     | password1 |      |
    Given there are pets with the following details:
      | Name      | Pet Type | Birthdate  | Breed            |
      | Fido      | Dog      | 2019-05-10 | Golden Retriever |
      | Whiskers  | Cat      | 2020-02-15 | Siamese          |
    When I visit the pet list page
    Then I should see the following pets:
      | Name      | Pet Type | Breed            |
      | Fido      | Dog      | Golden Retriever |
      | Whiskers  | Cat      | Siamese          |