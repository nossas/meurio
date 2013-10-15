Feature: view the users
  In order to know people
  As a visitor
  I want to view the users

  @javascript
  Scenario: when there is at least one user
    Given there is an user
    And I go to "the homepage"
    When I click "the users button"
    Then I should see "the users"
