Feature: view recent activity of an user
  In order to know what people are doing
  As a visitor
  I want to view recent activity of an user

  Scenario: when there is no activity
    Given there is an user
    When I go to "this user page"
    Then I should see "there is no activity yet"

  Scenario: when the user poked in a campaign
    Given there is an user
    And there is a poke made by this user
    When I go to "this user page"
    Then I should not see "there is no activity yet"
    And I should see "this poke in the activity feed"

  Scenario: when the user created a campaign
    Given there is an user
    And there is a campaign created by this user
    When I go to "this user page"
    Then I should not see "there is no activity yet"
    And I should see "this campaign in the activity feed"

  Scenario: when the user created an idea
    Given there is an user
    And there is an idea created by this user
    When I go to "this user page"
    Then I should not see "there is no activity yet"
    And I should see "this idea in the activity feed"

  Scenario: when the user created a problem
    Given there is an user
    And there is a problem created by this user
    When I go to "this user page"
    Then I should not see "there is no activity yet"
    And I should see "this problem in the activity feed"

  Scenario: when the user created a Compartilhaço campaign
    Given there is an user
    And there is a Compartilhaço campaign created by this user
    When I go to "this user page"
    Then I should not see "there is no activity yet"
    And I should see "this Compartilhaço campaign in the activity feed"

  Scenario: when the user have a Compartilhaço Facebook profile spreader
    Given there is an user
    And there is a Compartilhaço Facebook profile spreader for this user
    When I go to "this user page"
    Then I should not see "there is no activity yet"
    And I should see "this Compartilhaço Facebook profile spreader in the activity feed"

  Scenario: when the user have a Compartilhaço Twitter profile spreader
    Given there is an user
    And there is a Compartilhaço Twitter profile spreader for this user
    When I go to "this user page"
    Then I should not see "there is no activity yet"
    And I should see "this Compartilhaço Twitter profile spreader in the activity feed"
