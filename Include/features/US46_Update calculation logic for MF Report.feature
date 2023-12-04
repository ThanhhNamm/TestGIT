@US46
Feature: Update calculation logic for MF Report

  #Priority 2
  @480749 @480750
  Scenario Outline: [US 46][Matrial Forecast] Potential Value Opportunity of Fast Move should be null
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'FUTURE MOVEMENT' field
      | <options> |
    And I click on 'Search' button
    And I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    And I change the number of data rows in table into '100'
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column                      | Operator | Expected |
      | Potential Value Opportunity | EQUALS   |          |

    Examples: 
      | options   |
      | Fast Move |
      | Slow Move |
