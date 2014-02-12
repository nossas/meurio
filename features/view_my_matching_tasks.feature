Feature: view my matching tasks

  Scenario: where there is no matching task
    Given I'm logged in
    When I go to "my profile page"
    Then I should see "you have no matching task"

  Scenario: when there is at least one matching task
    Given I'm logged in
    And there is a matching task with my profile
    When I go to "my profile page"
    Then I should see "this task in the matching tasks"
