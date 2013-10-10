Feature: view all mobilizations
  In order to learn what Meu Rio is doing
  As a visitor
  I want to view all mobilizations

  Scenario: when there is at least one mobilizations
    Given there is a mobilization
    When I go to "the homepage"
    Then I should see "this mobilization in the mobilizations list"
