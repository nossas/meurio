Feature: view tweets on the mobilization comments
  In order to know people's opinion about a mobilization
  As a visitor
  I want to view tweets on the mobilization comments

  Scenario: when there is at least one tweet about the mobilization
    Given there is a mobilization
    And this mobilization have a tweet
    When I go to "this mobilization page"
    Then I should see "the tweet on the mobilization comments"
