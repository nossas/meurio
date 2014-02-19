Feature: edit a badge
  
  @javascript
  Scenario: when I'm not logged in
    Given there is a badge
    When I go to "this badge edit page"
    Then I should be in "the Meu Rio accounts login page"

  @ssi
  Scenario: when I fill the form correctly
    Given I'm logged in as admin
    And there is a badge
    And I'm in "this badge edit page"
    And I fill "badge_name" with "My Badge"
    And I fill "badge_points" with "1000"
    And I attach an image to "badge_image"
    When I press "Atualizar Badge"
    Then I should be in "the badges page"

  @ssi @javascript
  Scenario: when I fill the form wrongly
    Given I'm logged in as admin
    And there is a badge
    And I'm in "this badge edit page"
    And I fill "badge_name" with ""
    And I fill "badge_points" with ""
    When I press "Atualizar Badge"
    Then I should see "the badge name field error"
    And I should see "the badge points field error"
