Feature: Testing AJAX Pet Application

  Scenario: Viewing pet details
    Given I am on the AJAX pet page
    When I load the pet details for pet with ID "1"
    Then I should see the pet details displayed in a card

  Scenario: Generating questions about a pet breed
    Given I am on the AJAX pet page
    And the pet details are loaded for pet with ID "1"
    And I click the "Check how well you know your pet!" button 
    Then I should see an alert with text "Waiting for data, please be patient..."
