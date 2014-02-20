Feature: create a badge
  
  @ssi
  Scenario: when I don't have permission
    Given I'm logged in
    When I go to "the new badge page"
    Then I should be in "the Meu Rio accounts login page"

  @ssi
  Scenario: when I fill the form correctly
    Given I'm logged in as admin
    And I'm in "the new badge page"
    And I fill "badge_name" with "My Badge"
    And I fill "badge_points" with "1000"
    And I attach an image to "badge_image"
    When I press "Criar Badge"
    Then I should be in "the badges page"
    And I should see "this new badge"

  @ssi @javascript
  Scenario: when I fill the form wrongly
    Given I'm logged in as admin
    And I'm in "the new badge page"
    When I press "Criar Badge"
    Then I should see "the badge name field error"
    And I should see "the badge points field error"
    And I should see "the badge image field error"
