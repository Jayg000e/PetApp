Feature: Testing AJAX Pet Application

  Scenario: Viewing pet details
    Given I am on the AJAX pet page
    When I load the pet details for pet with ID "1"
    Then I should see the pet details displayed in a card

  Scenario: Generating questions about a pet breed
    Given I am on the AJAX pet page
    And the pet details are loaded for pet with ID "1"
    When I click the "Check how well you know your pet!" button and wait
    Then I should see a list of questions about the pet's breed
    And I should see a button to "View the answers"

  Scenario: Viewing the answers to the generated questions
    Given I am on the AJAX pet page
    And the pet details are loaded for pet with ID "1"
    And I have clicked the "Check how well you know your pet!" button
    When I click the "View the answers" button
    Then I should see the answers to the generated questions
