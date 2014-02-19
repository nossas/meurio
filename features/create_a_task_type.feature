Feature: create a task type
  
  Background:
    Given there is a category called "Tecnologia"
    And there is a badge called "Pressionador"
    And there is a badge called "Designer"

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
    And I choose "Presencial"
    And I check "the Pressionador badge field"
    And I check "the Designer badge field"
    When I press "Salvar"
    Then I should be in "this new task type page"
    And I should see "this task type"
    And I should see "this task type badges"

  @ssi @javascript
  Scenario: when I fill the form wrongly
    Given I'm logged in as admin
    And I'm in "the new task type page"
    When I press "Salvar"
    Then I should see "the task type name field error"
    Then I should see "the task type points field error"
    Then I should see "the task type category field error"
