Feature: delete a pet

    Scenario: delete a pet
        Given there are users with the following details:
            | Username  | Password  | Role |
            | user1     | password1 |      |
        Given there are pets with the following details:
            | Name      | Pet Type | Birthdate  | Breed            |
            | Fido      | Dog      | 2019-05-10 | Golden Retriever |
            | Whiskers  | Cat      | 2020-02-15 | Siamese          |

        Given I have login
        Given I am on the My Pet page
        When I click on the first "Delete Pet" button
        When I accept the alert 
        Then I should see an alert with text "Pet deleted successfully."
        
        
