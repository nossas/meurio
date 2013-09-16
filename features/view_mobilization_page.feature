Feature: 
  In order to get an overview about a mobilization
  As an user
  I should be able to view a mobilization page

  Background: 
    Given there are 1 mobilization
    
  Scenario: Viewing a mobilization page
    When I go to "the mobilization's page"
    Then I should see the mobilization's "title"

  Scenario: mobilization's background image
    When I go to "the mobilization's page"
    Then I should see the mobilization's background image

  Scenario: mobilization's hashtag
    When I go to "the mobilization's page"
    Then I should see the mobilization's "hashtag"