Feature: Edit profile
  In order to manage my preferences
  As an user
  I want to edit my profile

  Scenario: successful editing
    Given there is an user logged in
    When I go to "edit profile page"
    Then I should see "the edit user form"
