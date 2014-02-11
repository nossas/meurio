Feature: view all the points of an user

  Scenario: when the user have at least one point in one category
    Given there is an user
    And there is a task category
    And there is a task for this category
    And this user delivered this task
    And this delivery is accepted
    When I go to "this user page"
    Then I should see "this category score"
