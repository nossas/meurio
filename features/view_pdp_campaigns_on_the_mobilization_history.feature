Feature: view campaigns on the mobilization history
  In order to chose a campaign to support
  As a visitor
  I want to view campaigns on the mobilization history

  Scenario: when there is at least one campaign to the mobilization
    Given there is a mobilization
    And this mobilization have a campaign
    When I go to "this mobilization page"
    Then I should see "the campaign on the mobilization history"
