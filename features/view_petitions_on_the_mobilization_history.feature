Feature: view petitions on the mobilization history
  In order to chose a petition to support
  As a visitor
  I want to view petitions on the mobilization history

  Scenario: when there is at least one petition to the mobilization
    Given there is a mobilization
    And this mobilization have a petition
    When I go to "this mobilization page"
    Then I should see "the petition on the mobilization history"
