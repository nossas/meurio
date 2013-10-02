Feature: view events on the mobilization history
  In order to chose an event to attend
  As a visitor
  I want to view events on the mobilization history

  Scenario: when there is at least one event to the mobilization
    Given there is a mobilization
    And this mobilization have an event
    When I go to "this mobilization page"
    Then I should see "the event on the mobilization history"
