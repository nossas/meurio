Feature: login
  In order to colaborate with Meu Rio
  As a visitor
  I want to login

  Scenario: when the login is succeeded
    Given there is an user with email "test@meurio.org.br" and password "mypassword"
    And I'm in "the homepage"
    When I fill "Email" with "test@meurio.org.br"
    And I fill "Senha" with "mypassword"
    And I press "Entrar na Rede"
    Then I should be logged in
    And I should be in "the homepage"
