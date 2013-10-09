Feature: login
  In order to colaborate with Meu Rio
  As a visitor
  I want to login

  @javascript
  Scenario: login succeeded
    Given there is an user with email "test@meurio.org.br" and password "mypassword"
    And I'm in "the homepage"
    When I fill "Email" with "test@meurio.org.br"
    And I fill "Senha" with "mypassword"
    And I press "Entrar na Rede"
    Then I should be logged in
    And I should see "a success message"
    And I should not see "the login form"

  @javascript
  Scenario: login failed due to unregistered user
    Given there is no users
    And I'm in "the homepage"
    When I fill "Email" with "test@meurio.org.br"
    And I fill "Senha" with "mypassword"
    And I press "Entrar na Rede"
    Then I should not be logged in
    And I should see "an alert message"
    And I should see "the login form"

  @javascript
  Scenario: login failed due to invalid data
    Given there is no users
    And I'm in "the homepage"
    When I fill "Email" with "test!"
    And I fill "Senha" with "pass"
    And I press "Entrar na Rede"
    Then I should not be logged in
    And I should see "user email field error"
    And I should see "user password field error"
