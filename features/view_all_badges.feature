Feature: view all badges

  @ssi
  Scenario: when there is at least one badge
    Given there is a badge
    And I'm logged in as admin
    When I go to "the badges page"
    Then I should see "this badge"
