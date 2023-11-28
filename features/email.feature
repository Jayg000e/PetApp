Feature: Contact seller by email

    Scenario: email is empty
      Given there are users with the following details:
        | Username  | Password  | Role | Email |
        | user1     | password1 |      |       |
      Given there are pets onsale with the following details:
          | Name      | Pet Type | Birthdate  | Breed            |    onSale | Price |
          | Fido      | Dog      | 2019-05-10 | Golden Retriever |     true  | 400   |
          | Whiskers  | Cat      | 2020-02-15 | Siamese          |     true  |  600  |
      Given I have login
      When I go to the market page
      And I click on the first "Contact" button
      Then I should see an alert with text "Email not available for this entry."
    
    Scenario: email exists, the email client should be opened
      Given there are users with the following details:
        | Username  | Password  | Role | Email             |
        | user1     | password1 |      | user1@example.com |
      Given there are pets onsale with the following details:
          | Name      | Pet Type | Birthdate  | Breed            |    onSale | Price |
          | Fido      | Dog      | 2019-05-10 | Golden Retriever |     true  | 400   |
          | Whiskers  | Cat      | 2020-02-15 | Siamese          |     true  |  600  |
      Given I have login
      When I go to the market page
      Then I should see a contact button with email address "user1@example.com"