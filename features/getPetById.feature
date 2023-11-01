Feature: Testing getPetById view
  Scenario: User visits the getPetById page
    Given I am on the getPetById page
    When I click the "Generate" button
    Then I should see "Waiting for data, please be patient..."
    And I should see "Question 1:"
    And I should see "Answer 1:"
    And I should see a button with text "View the answers"