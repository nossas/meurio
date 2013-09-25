Feature: view Facebook posts on the mobilization comments
  In order to know what people are saying about the mobilization
  As a visitor
  I want to view Facebook posts on the mobilization comments

  Scenario: when there is no Facebook post
    Given there is a mobilization
    When I go to "this mobilization page"
    Then I should see "this mobilization have no comment yet"

  Scenario: when there is one Facebook post
