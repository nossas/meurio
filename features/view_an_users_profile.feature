Feature: view an user's profile
  In order to know people
  As a visitor
  I want to view an user's profile

  Scenario: when the user have a public profile
    Given there is an user
    When I go to "this user page"
    Then I should see "this user image"
    And I should see "this user name"
    And I should see "this user profession"
    And I should see "this user Facebook link"
    And I should see "this user Twitter link"
    And I should see "this user city"
    And I should see "this user district"
    And I should see "this user bio"
