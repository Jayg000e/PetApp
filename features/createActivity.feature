Feature: Testing createActivity view

  Scenario: User successfully added an activity
    Given I am on the createActivity page
    When I fill in "Enter activity content..." with "Sample Activity"
    And I click the "Create Activity" button
    Then I should see an alert with text "Activity created successfully!"
    And I should be redirected back to the activity page
