Feature: Create a mobilization
  In order to mobilize people to my cause
  As an user
  I want to create a mobilization

  Scenario:
    Given I'm in "the homepage"
    When I go to "new mobilization page"
    Then I should see "the mobilization form"

  Scenario: when I fill the form correctly
    Given I'm in "new mobilization page"
    And I fill "Nome da Mobilização" with "De Guarda no Bondinho"
    And I fill "Hashtag" with "DeGuardaNoBondinho"
    And I fill "Descrição" with "O Governo do Estado do Rio de Janeiro está sucateando o patrimônio histórico nacional."
    And I attach an image to "Imagem de fundo"
    When I press "Criar Mobilização"
    Then a mobilization should exists
    And I should be in "this mobilization page"