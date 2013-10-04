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

  Scenario: the action is a campaign with many pokes
    Given there is a mobilization
    And this mobilization have a campaign
    And this campaign have 73 pokes
    When I'm in "this mobilization page"
    Then "the action of the day attending counter" should contain "73"
    And "the action of the day attending counter" should contain "pressões"

  Scenario: the action is a problem with many ideas
    Given there is a mobilization
    And this mobilization have a problem
    And this problem have 46 ideas
    When I'm in "this mobilization page"
    Then "the action of the day attending counter" should contain "46"
    Then "the action of the day attending counter" should contain "ideias"

  Scenario: the action is a event with many attendees
    Given there is a mobilization
    And this mobilization have an event
    And this event have 142 attendees
    When I'm in "this mobilization page"
    Then "the action of the day attending counter" should contain "142"
    Then "the action of the day attending counter" should contain "participações"
