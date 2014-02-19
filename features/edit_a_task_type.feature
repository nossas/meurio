Feature: edit a task type
  
  Background:
    Given there is a category called "Tecnologia"
    And there is a badge

  @javascript
  Scenario: when I don't have permission
    Given I'm logged in
    And there is a task type
    When I go to "this task type edit page"
    Then I should be in "the Meu Rio accounts login page"

  @ssi
  Scenario: when I fill the form correctly
    Given I'm logged in as admin
    And there is a task type
    And I'm in "this task type edit page"
    And I fill "task_type_name" with "My Edited Task Type"
    And I fill "task_type_points" with "500"
    And I select "Tecnologia" from "task_type_category_id"
    And I choose "À distância"
    And I check "the first badge field"
    When I press "Salvar"
    Then I should be in "the task types page"

  @ssi @javascript
  Scenario: when I fill the form wrongly
    Given I'm logged in as admin
    And there is a task type
    And I'm in "this task type edit page"
    And I fill "task_type_name" with ""
    And I fill "task_type_points" with ""
    When I press "Salvar"
    Then I should see "the task type name field error"
    Then I should see "the task type points field error"
