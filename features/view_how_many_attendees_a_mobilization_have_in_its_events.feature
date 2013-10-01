Feature: view how many attendees a mobilization have in it's events
  In order to know the impact of a mobilization
  As a visitor
  I want to view how many attendees a mobilization have in it's events

  Background:
    Given there is a mobilization

  Scenario: when the mobilization have no event
    When I go to "this mobilization page"
    Then I should not see "the attendees counter"

  Scenario: when the mobilization have an event with no attendees
    Given this mobilization have an event
    When I go to "this mobilization page"
    Then I should not see "the attendees counter"

  Scenario: when the mobilization have an event with at least one attendee
    Given this mobilization have an event
    And this event have some attendees
    When I go to "this mobilization page"
    Then I should see "the attendees counter"
