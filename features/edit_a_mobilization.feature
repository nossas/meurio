Feature: Edit a mobilization
  In order to change a mobilization
  As an user
  I want to edit a mobilization

  Background:
    Given there is a mobilization

  Scenario:
    Given I'm in "this mobilization page"
    When I click "Editar"
    Then I should see "the mobilization form"

  @javascript
  Scenario: when I fill the form correctly
    Given I'm in "edit mobilization page"
    And I fill "Nome da Mobilização" with "Nome alterado da mobilização!"
    And I fill "Hashtag" with "NomeAlterado"
    When I press "Atualizar Mobilização"
    Then I should be in "this mobilization page"

  @javascript
  Scenario: when I don't fill the form correctly
    Given I'm in "edit mobilization page"
    And I fill "Nome da Mobilização" with ""
    And I fill "Título curto" with ""
    And I fill "Hashtag" with ""
    And I fill "Descrição" with ""
    When I press "Atualizar Mobilização"
    Then I should be in "edit mobilization page"
    And I should see "mobilization title field error"
    And I should see "mobilization short title field error"
    And I should see "mobilization hashtag field error"
    And I should see "mobilization description field error"
