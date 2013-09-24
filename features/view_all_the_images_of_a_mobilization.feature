Feature: view all the images of a mobilization
  In order to get access to the digital content of a mobilization
  As a visitor
  I want to view all the images of a mobilization

  Scenario: when the mobilization have no image
    Given there is a mobilization
    When I go to "this mobilization page"
    Then I should see "this mobilization have no image yet"

  Scenario: when the mobilization have an image
    Given there is a mobilization
    And this mobilization have an image
    When I go to "this mobilization page"
    Then I should not see "this mobilization have no image yet"
    And I should see "this mobilization image"
