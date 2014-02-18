Feature: create a task type
  
  Background:
    Given there is a category called "Tecnologia"

  @javascript
  Scenario: when I don't have permission
    Given I'm logged in
    When I go to "the new task type page"
    Then I should be in "the Meu Rio accounts login page"

  @ssi
  Scenario: when I fill the form correctly
    Given I'm logged in as admin
    And I'm in "the new task type page"
    And I fill "task_type_name" with "My Task Type"
    And I fill "task_type_points" with "500"
    And I select "Tecnologia" from "task_type_category_id"
    When I press "Criar Tipo de Tarefa"
    Then I should be in "this new task type page"

  @ssi @javascript
  Scenario: when I fill the form wrongly
    Given I'm logged in as admin
    And I'm in "the new task type page"
    When I press "Criar Tipo de Tarefa"
    Then I should see "the task type name field error"
    Then I should see "the task type points field error"
    Then I should see "the task type category field error"
