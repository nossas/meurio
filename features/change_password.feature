Feature: change password
  In order to use another password to log in
  As an user
  I want to change it

  Background:
    Given I'm logged in

  @javascript
  Scenario: change password succeeded
    Given I'm in "edit profile page"
    When I click "Alterar minha senha"
    And I fill "Digite sua senha atual" with my "password"
    And I fill "Digite sua nova senha" with "mypasswd"
    And I fill "Confirme sua nova senha" with "mypasswd"
    And I press "Trocar senha"
    Then I should see "a success message"
    And I should be in "edit profile page"
    And I click "Sair"
    And I log in with password "mypasswd"
    And I should be logged in

  @javascript
  Scenario: change password failed due incorrect current password
    Given I'm in "edit profile page"
    When I click "Alterar minha senha"
    And I fill "Digite sua senha atual" with "incorrect password"
    And I fill "Digite sua nova senha" with "mypasswd"
    And I fill "Confirme sua nova senha" with "mypasswd"
    And I press "Trocar senha"
    Then I should see "current password field error"
    