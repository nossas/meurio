Feature: reset password
  In order to retrieve lost password
  As an user
  I want to reset it

  @javascript
  Scenario: reset password succeeded
    Given there is an user with email "test@meurio.org.br" and password "mypassword"
    And I'm in "the homepage"
    When I click "Esqueceu sua senha?"
    And I fill "password_recovery_email" with "test@meurio.org.br"
    And I press "Enviar"
    Then I should see "a success message"
    And an email should be sent to "test@meurio.org.br"

  @javascript
  Scenario: reset password failed due invalid email
    Given there is an user with email "test@meurio.org.br" and password "mypassword"
    And I'm in "the homepage"
    When I click "Esqueceu sua senha?"
    And I fill "password_recovery_email" with "test"
    And I press "Enviar"
    Then I should see "password recovery email field error"

  @javascript
  Scenario: reset password failed due unregistered email
    Given there is no users
    And I'm in "the homepage"
    When I click "Esqueceu sua senha?"
    And I fill "password_recovery_email" with "test@meurio.org.br"
    And I press "Enviar"
    Then I should see "an alert message"
    And no email should be sent