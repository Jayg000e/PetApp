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
        Then I should see an alert with text "Pet put on sale at price: 500"
        
