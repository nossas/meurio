Feature: view recent activity of users on PdP
  In order to know what people are up to
  As a visitor
  I want to view recent activity of users on PdP

  Scenario: when an user create a campaign
    Given there is campaign
    When I go to "the homepage"
    Then I should see "this campaign on the users activities"

  Scenario: when an user poke on a campaign
    Given there is a poke
    When I go to "the homepage"
    Then I should see "this poke on the users activities"
