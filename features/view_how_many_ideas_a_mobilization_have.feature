Feature: view how many ideas a mobilization have
  In order to know the impact of a mobilization
  As a visitor
  I want to view how many ideas a mobilization have

  Background:
    Given there is a mobilization
  
  Scenario: when the mobilization have no problem
    When I go to "this mobilization page"
    Then I should not see "the ideas counter"

  Scenario: when the mobilization have a problem with no ideas
    Given this mobilization have a problem
    When I go to "this mobilization page"
    Then I should not see "the ideas counter"

  Scenario: when the mobilization have a problem with many ideas
    Given this mobilization have a problem
    And this problem have many ideas
    When I go to "this mobilization page"
    Then I should see "the ideas counter"
