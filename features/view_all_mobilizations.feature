Feature: view all mobilizations
  In order to learn what Meu Rio is doing
  As a visitor
  I want to view all mobilizations

  @javascript
  Scenario: when there is at least one mobilizations
    Given there is a mobilization
    When I go to "the homepage"
    Then I should see "this mobilization in the mobilizations list"

  @javascript
  Scenario: when there is more than 3 mobilizations
    Given there is 9 mobilizations
    When I go to "the homepage"
    Then I should see 6 "mobilizations"
    When I click "the load more mobilizations button"
    Then I should see 9 "mobilizations"
    And I should not see "the load more mobilizations button"

  @javascript
  Scenario: when there is a territorial mobilization
    Given there is a territorial mobilization
    When I go to "the homepage"
    Then I should not see this mobilization in the mobilizations list
