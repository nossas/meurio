Feature: view the users
  In order to know people
  As a visitor
  I want to view the users

  @javascript
  Scenario: when there is at least one user
    Given I go to "the homepage"
    When I click "the users button"
    Then show me the page
    Then I should see "the users"
