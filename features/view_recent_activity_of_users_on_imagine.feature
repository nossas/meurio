Feature: view recent activity of users on Imagine
  In order to know what people are up to
  As a visitor
  I want to view recent activity of users on Imagine

  Scenario: when an user create a problem
    Given there is a problem
    When I go to "the homepage"
    Then I should see "this problem on the users activity"

  Scenario: when an user create an idea
    Given there is an idea
    When I go to "the homepage"
    Then I should see "this idea on the users activity"
