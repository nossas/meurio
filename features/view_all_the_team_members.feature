Feature: view all the team members
  In order to know who works on Meu Rio
  As a visitor
  I want to view all the team members

  @javascript
  Scenario: 
    Given there is 10 admin users
    And I go to "the homepage"
    When I click "the team button"
    Then I should see 10 "team members"
