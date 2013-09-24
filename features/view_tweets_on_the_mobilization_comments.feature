Feature: view tweets on the mobilization comments
  In order to know people's opinion about a mobilization
  As a visitor
  I want to view tweets on the mobilization comments

  Scenario: when there is at least one tweet about the mobilization
    Given there is a mobilization
    And this mobilization have a tweet
    When I go to "this mobilization page"
    Then I should see "the tweet on the mobilization comments"

  Scenario: when the tweet contains a hashtag
    Given there is a mobilization
    And this mobilization have a tweet with a hashtag
    When I go to "this mobilization page"
    Then I should see "the tweet's hashtag link"

  Scenario: when the tweet contains a link
    Given there is a mobilization
    And this mobilization have a tweet with a link
    When I go to "this mobilization page"
    Then I should see "the tweet's link"

  Scenario: showing link to twitter username
    Given there is a mobilization
    And this mobilization have a tweet
    When I go to "this mobilization page"
    Then I should see "the twitter username's link"

  Scenario: when there are many tweets about the mobilization
    Given there is a mobilization
    And this mobilization have many tweets
    When I go to "this mobilization page"
    Then I should see only 5 "tweets on the mobilization comments"