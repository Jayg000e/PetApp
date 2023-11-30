Feature: on sale and off sale

    Scenario: on sale and off sale
        Given there are users with the following details:
            | Username  | Password  | Role | Email             |
            | user1     | password1 |      | user1@example.com |
        Given there are pets with the following details:
            | Name      | Pet Type | Birthdate  | Breed            |
            | Fido      | Dog      | 2019-05-10 | Golden Retriever |
        Given I have login
        Given I am on the My Pet page
        When I click on "Go On Sale"
        And I fill in "sale_price" with "500"
        And I click on "Update Price"
        And I go to the market page
        Then I should see "Fido"
        Given I am on the My Pet page
        When I click on "Go Off Sale"
        And I go to the market page
        Then I should not see "Fido"
        
