Feature: Pet purchasing suggestion by GPT

    Scenario: User go to the market and get suggestion on the best match pet by GPT
    Given there are users with the following details:
      | Username  | Password  | Role |
      | user1     | password1 |      |
    Given I have login
    Given there are pets onsale with the following details:
        | Name      | Pet Type | Birthdate  | Breed            |    onSale | Price |
        | Fido      | Dog      | 2019-05-10 | Golden Retriever |     true  | 400   |
        | Whiskers  | Cat      | 2020-02-15 | Siamese          |     true  |  600  |
    When I go to the market page
    And I fill in "Let us know more about you! We will find some pet that match you." with "I love playful pets and have a big yard"
    And I click on "Submit"
    Then I should see a loading message
    And I should eventually see a pet suggestion from GPT in the container