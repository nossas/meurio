Feature: Create a mobilization
  In order to mobilize people to my cause
  As an user
  I want to create a mobilization

  @ssi
  Scenario: when I'm logged in as admin
    Given I'm logged in as admin
    When I go to "new mobilization page"
    Then I should see "the mobilization form"

  @javascript @ssi
  Scenario: when I fill the form correctly
    Given I'm logged in as admin
    And I'm in "new mobilization page"
    And I fill "Nome da Mobilização" with "Estamos De Guarda no Bondinho de Santa Teresa!"
    And I fill "Título curto" with "De Guarda no Bondinho"
    And I fill "Hashtag" with "DeGuardaNoBondinho"
    And I fill "Descrição" with "O Governo do Estado do Rio de Janeiro está sucateando o patrimônio histórico nacional."
    And I attach an image to "Imagem de fundo"
    And I attach an image to "Thumbnail"
    When I press "Criar Mobilização"
    And I should be in "the first mobilization page"

  @javascript @ssi
  Scenario: when I don't fill the form correctly
    Given I'm logged in as admin
    And I'm in "new mobilization page"
    When I press "Criar Mobilização"
    Then I should be in "new mobilization page"
    And I should see "mobilization title field error"
    And I should see "mobilization organization field error"
    And I should see "mobilization short title field error"
    And I should see "mobilization hashtag field error"
    And I should see "mobilization description field error"
    And I should see "mobilization image field error"
