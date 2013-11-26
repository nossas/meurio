Feature: View action of the day
  In order to know how to participate in a mobilization
  As an user
  I want to view the action of the day

  Scenario: when there is no action of the day
    Given there is a mobilization
    When I'm in "this mobilization page"
    Then I should not see "the action of the day"

  Scenario: when there is a campaign
    Given there is a mobilization
    And this mobilization have a campaign
    When I'm in "this mobilization page"
    Then I should see "the action of the day"

  Scenario: when there is a problem
    Given there is a mobilization
    And this mobilization have a problem
    When I'm in "this mobilization page"
    Then I should see "the action of the day"

  Scenario: when there is an event
    Given there is a mobilization
    And this mobilization have an event
    When I'm in "this mobilization page"
    Then I should see "the action of the day"