Feature: register
  In order to colaborate with Meu Rio
  As a visitor
  I want to register

  @javascript
  Scenario: signup succeeded
    Given I'm in "the homepage"
    When I fill "signup_first_name" with "Test"
    And I fill "signup_last_name" with "Meu Rio"
    And I fill "signup_email" with "test@meurio.org.br"
    And I fill "signup_password" with "mypassword"
    And I press "Cadastre-se"
    Then I should see "a success message"

  @javascript
  Scenario: signup failed due to blank fields
    Given I'm in "the homepage"
    When I press "Cadastre-se"
    Then I should see "signup first name field error"
    And I should see "signup last name field error"
    And I should see "signup email field error"
    And I should see "signup password field error"

  @javascript
  Scenario: signup failed due to already registered user
    Given there is an user with email "test@meurio.org.br" and password "mypassword"
    And I'm in "the homepage"
    When I fill "signup_first_name" with "Test"
    And I fill "signup_last_name" with "Meu Rio"
    And I fill "signup_email" with "test@meurio.org.br"
    And I fill "signup_password" with "mypassword"
    And I press "Cadastre-se"
    Then I should see "signup email field error"