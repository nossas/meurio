Feature: view all the funders
  In order to know people
  As a visitor
  I want to view all the funders

  @javascript
  Scenario: when there is 30 funders
    Given there is 30 funders
    And I go to "the homepage"
    When I click "the funders button"
    Then I should see 30 "funders"
    And I should not see "the load more funders button"

  @javascript
  Scenario: when there more than 30 funders
    Given there is 60 funders
    And I go to "the homepage"
    When I click "the funders button"
    Then I should see 30 "funders"
    When I click "the load more funders button"
    Then I should see 60 "funders"
    And I should not see "the load more funders button"
