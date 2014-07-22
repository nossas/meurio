Feature:
  In order to get an overview about a mobilization
  As an user
  I should be able to view a mobilization page

  Background:
    Given there is a mobilization

  Scenario: Viewing a mobilization page
    When I go to "this mobilization page"
    Then I should see the mobilization's "title"

  Scenario: mobilization's hashtag
    When I go to "this mobilization page"
    Then I should see the mobilization's "hashtag"
