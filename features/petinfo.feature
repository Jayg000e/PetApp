Feature: Pet Info
  As a user
  I want to click "pet" on the home page
  So that I can view an information card and check how well I know my pet

  Scenario: Clicking "pet" on the Home Page
    Given I am on the home page
    When I click the "pet" link
    Then I should be redirected to the pet information page
    And I should see an information card
    And I should see a button "Check how well you know your pet"    
