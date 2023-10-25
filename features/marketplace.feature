Feature: Home Page
    As a user
    I want to see a bar with buttons for navigation
    So that I can access the "marketplace" and "pets" sections and view a table of pets

    Scenario: Viewing the Home Page
        Given I am on the home page
        Then I should see a navigation bar
        And the navigation bar should contain the "marketplace" list item
        And the navigation bar should contain the "pet" list item

