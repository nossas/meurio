Feature: view all the clippings of a mobilization
  In order to know the impact of a mobilization in the press
  As a visitor
  I want to view all the clippings of a mobilization

  Scenario: when there is no clipping
    Given there is a mobilization
    When I go to "this mobilization page"
    Then I should see "this mobilization have no clipping yet"

  Scenario: when there is at least one clipping
    Given there is a mobilization
    And this mobilization have a clipping
    When I go to "this mobilization page"
    Then I should see "this mobilization clipping"
