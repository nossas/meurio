Feature: view how many pokes a mobilization have
  In order to know the impact of a mobilization
  As a visitor
  I want to view how many pokes a mobilization have

  Background:
    Given there is a mobilization
  
  Scenario: when the mobilization have no campaign
    When I go to "this mobilization page"
    Then I should not see "the pokes counter"

  Scenario: when the mobilization have a campaign with no pokes
    Given this mobilization have a campaign
    When I go to "this mobilization page"
    Then I should not see "the pokes counter"

  Scenario: when the mobilization have a campaign with many pokes
    Given this mobilization have a campaign
    And this campaign have many pokes
    When I go to "this mobilization page"
    Then I should see "the pokes counter"
