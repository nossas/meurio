Feature: Edit profile
  In order to manage my preferences
  As an user
  I want to edit my profile

  Scenario: viewing the page
    Given there is an user logged in
    When I go to "edit profile page"
    Then I should see "the edit user form"

  @javascript
  Scenario: successful editing
    Given there is an user logged in
    And I'm in "edit profile page"
    When I fill "Nome" with "Meu"
    And I fill "Sobrenome" with "Rio"
    And I fill "Um pouco mais sobre você" with "Lorem ipsum sit dolor amet"
    And I fill "Data de nascimento" with "01/01/1980"
    And I fill "Profissão" with "Desenvolvedor de software"
    And I fill "CEP onde mora" with "99999-999"
    And I fill "Endereço" within "home address" with "Avenida Getúlio Vargas"
    And I fill "Número" within "home address" with "2200"
    And I fill "Complemento" within "home address" with "Ap 104"
    And I fill "Bairro" within "home address" with "22041-001"
    And I fill "Cidade" within "home address" with "Rio de Janeiro"
    And I select "RJ" within "home address"
    And I fill "Celular" with "(51) 99999999"
    And I fill "Email secundário" with "secondary@meurio.org.br"
    And I press "Salvar Perfil"
    Then I should see "a success message"

  @javascript
  Scenario: failure editing due to blank fields
    Given there is an user logged in
    And I'm in "edit profile page"
    When I fill "Nome" with ""
    And I fill "Sobrenome" with ""
    And I fill "Um pouco mais sobre você" with "Lorem ipsum sit dolor amet"
    And I press "Salvar Perfil"
    Then I should see "user first name field error"
    And I should see "user last name field error"
