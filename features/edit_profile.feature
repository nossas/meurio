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
    And I fill "Celular" with "(51) 9999-9999"
    And I fill "Email secundário" with "secondary@meurio.org.br"
    And I check "Outros podem ver meu perfil?"
    And I press "Atualizar perfil"
    Then I should see "a success message"

  @javascript
  Scenario: failure editing due to blank fields
    Given there is an user logged in
    And I'm in "edit profile page"
    When I fill "Nome" with ""
    And I fill "Sobrenome" with ""
    And I fill "Um pouco mais sobre você" with "Lorem ipsum sit dolor amet"
    And I press "Atualizar perfil"
    Then I should see "user first name field error"
    And I should see "user last name field error"

  # - Avatar
  # - Fale um pouco mais sobre você
  # - CEP onde mora
  # - Número
  # - Complemento
  # - Profissão
  # - Nascimento
  # - Gênero
  # - Celular
  # - CEP onde trabalha
  # - Temas de interesse
  # - Email secundário
  # - Deixar o perfil publico
