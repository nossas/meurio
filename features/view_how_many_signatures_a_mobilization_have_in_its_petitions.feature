Feature: view how many signatures a mobilization have in its petitions
  In order to know the impact of a mobilization
  As a visitor
  I want to view how many signatures a mobilization have in its petitions

  Background:
    Given there is a mobilization

  Scenario: when the mobilization have no petition
    When I go to "this mobilization page"
    Then I should not see "the signatures counter"

  Scenario: when the mobilization have an petition with no signatures
    Given this mobilization have a petition
    When I go to "this mobilization page"
    Then I should not see "the signatures counter"

  Scenario: when the mobilization have a petition with at least one signature
    Given this mobilization have a petition
    And this petition have some signatures
    When I go to "this mobilization page"
    Then I should see "the signatures counter"
