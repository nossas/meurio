Feature: View action of the day
  In order to know how to participate in a mobilization
  As an user
  I want to view the action of the day

  Scenario:
    Given there is a mobilization
    And this mobilization have a campaign
    When I'm in "this mobilization page"
    Then I should see "the action of the day"
