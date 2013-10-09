Feature: view the team
  In order to know who works on Meu Rio
  As a visitor
  I want to view the team

  @javascript
  Scenario: 
    Given I go to "the homepage"
    When I click "the team button"
    Then I should see "the team"
