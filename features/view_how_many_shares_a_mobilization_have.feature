Feature: view how many shares a mobilization have
  In order to know the impact of a mobilization
  As a visitor
  I want to view how many shares a mobilization have

  Background:
    Given there is a mobilization

  Scenario: when the mobilization have no shares yet
    When I go to "this mobilization page"
    Then I should not see "the shares counter"

  Scenario: when the mobilization have at least one share
    Given this mobilization have some shares
    When I go to "this mobilization page"
    Then I should see "the shares counter"
