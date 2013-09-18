Feature: view Imagine problems on the mobilization history
  In order to chose an Imagine problem to support
  As a visitor
  I want to view Imagine problems on the mobilization history

  Scenario: when there is at least one Imagine problem to the mobilization
    Given there is a mobilization
    And this mobilization have an Imagine problem
    When I go to "this mobilization page"
    Then I should see "the Imagine problem on the mobilization history"
