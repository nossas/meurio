Feature: share a mobilization on Facebook
  In order to spread the world about a mobilization
  As a visitor
  I want to share a mobilization on Facebook

  Scenario:
    Given there is a mobilization
    When I go to "this mobilization page"
    Then I should see "the Facebook share button of this mobilization"
