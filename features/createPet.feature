Feature: User create a pet

  Scenario: User successfully create a pet
    Given there are users with the following details:
      | Username  | Password  | Role |
      | user1     | password1 |      |
    Given I have login
    Given I am on the createPet page
    When I fill in "Name" with "Fido"
    And I fill in "Pet Type" with "Dog"
    And I fill in "Birthdate" with "2022-01-15"
    And I fill in "Breed" with "Golden Retriever"
    And I check "On Sale"
    And I fill in "Price" with "500"
    And I click the "Create Pet" button
    Then I should see an alert with text "Pet created successfully!"
    And I should be redirected back to the pet page
