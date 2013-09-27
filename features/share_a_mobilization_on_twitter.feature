Feature: share a mobilization on Twitter
  In order to spread the world about a mobilization
  As a visitor
  I want to share a mobilization on Twitter

  Scenario: when I'm in the mobilization's page
    Given there is a mobilization
    When I go to "this mobilization page"
    Then I should see "the Twitter share button of this mobilization"
