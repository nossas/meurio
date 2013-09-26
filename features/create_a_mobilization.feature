Feature: Create a mobilization
  In order to mobilize people to my cause
  As an user
  I want to create a mobilization

  Scenario:
    Given I'm in "the homepage"
    When I go to "new mobilization page"
    Then I should see "the mobilization form"