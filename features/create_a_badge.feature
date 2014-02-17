Feature: create a badge
  
  @javascript
  Scenario: when I don't have permission
    Given I'm logged in
    When I go to "the new badge page"
    Then I should be in "the Meu Rio accounts login page"

  Scenario: when I fill the form correctly
  Scenario: when I fill the form wrongly
