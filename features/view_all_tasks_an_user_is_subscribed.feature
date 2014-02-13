Feature: view all tasks an user is subscribed

  Scenario: when the user didn't subscribe any task
    Given there is an user
    When I go to "this user page"
    Then I should see "this user didn't subscribe any task"
      
  Scenario: when the user subscribed at leas one task
    Given there is an user
    And this user subscribed for a task
    When I go to "this user page"
    Then I should see "this task in the subscribed tasks"
