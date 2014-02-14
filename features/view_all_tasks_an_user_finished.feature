Feature: view all tasks an user finished

  Scenario: when the user didn't finish any task
    Given there is an user
    When I go to "this user page"
    Then I should see "this user didn't finish any task"

  Scenario: when the user finished at least one task
    Given there is an user
    And this user subscribed for a task
    And this user finished this task
    When I go to "this user page"
    Then I should see "this task in the finished tasks"
