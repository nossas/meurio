Feature: view all the users
  In order to know people
  As a visitor
  I want to view all the users

  @javascript
  Scenario: when there is 30 users
    Given there is 30 users
    And I go to "the homepage"
    When I click "the users button"
    Then I should see 30 "users"
    When I click "the load more users button"
    Then I should not see "the load more users button"

  @javascript
  Scenario: when there more than 30 users
    Given there is 60 users
    And I go to "the homepage"
    When I click "the users button"
    Then I should see 30 "users"
    When I click "the load more users button"
    Then I should see 60 "users"
    When I click "the load more users button"
    Then I should not see "the load more users button"
