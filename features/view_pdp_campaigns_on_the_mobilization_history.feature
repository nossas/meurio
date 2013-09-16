Feature: view PdP campaigns on the mobilization history
  In order to chose a PdP campaign to support
  As a visitor
  I want to view PdP campaigns on the mobilization history

  Scenario: when there is at least one PdP campaign to the mobilization
    Given there is a mobilization
    And this mobilization have a PdP campaign
    When I go to "this mobilization page"
    Then I should see "the PdP campaign on the mobilization history"
