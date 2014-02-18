Feature: view all task types

  @ssi
  Scenario: when there is at least one task type
    Given there is a task type
    And I'm logged in as admin
    When I go to "the task types page"
    Then I should see "this task type"
