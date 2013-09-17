Feature: view Imagine ideas on the mobilization history
  In order to chose an Imagine idea to support
  As a visitor
  I want to view Imagine ideas on the mobilization history

  Scenario: when there is at least one Imagine idea to the mobilization
    Given there is a mobilization
    And this mobilization have an Imagine idea
    When I go to "this mobilization page"
    Then I should see "the Imagine idea on the mobilization history"
