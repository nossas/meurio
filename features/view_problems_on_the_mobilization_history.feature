Feature: view problems on the mobilization history
  In order to chose a problem to support
  As a visitor
  I want to view problems on the mobilization history

  Scenario: when there is at least one problem to the mobilization
    Given there is a mobilization
    And this mobilization have a problem
    When I go to "this mobilization page"
    Then I should see "the problem on the mobilization history"
