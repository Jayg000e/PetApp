Feature: Generate Pet Questions and Answers by GPT

  Scenario: User requests questions and answers about their pet
    Given there are users with the following details:
            | Username  | Password  | Role |
            | user1     | password1 |      |
    Given there are pets with the following details:
        | Name      | Pet Type | Birthdate  | Breed            |
        | Fido      | Dog      | 2019-05-10 | Golden Retriever |
        | Whiskers  | Cat      | 2020-02-15 | Siamese          |
    Given I am on the pet page
    When the user clicks on "Check how well you know your pet!" button
    Then the "Waiting for data, please be patient..." message should be displayed
    And an AJAX request should be made to fetch the pet's data
    And upon successful response, questions should be displayed in the "questions" container
    When the user clicks on "View the answers" button
    Then the answers should be displayed in the "answers" container
