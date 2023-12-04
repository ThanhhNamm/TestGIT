@US49
Feature: Material Forecast Report Filter

  #Priority 2
  @480745
  Scenario: [US 49][Material Forecast] It should have one additional filter (Current Material Plan Status) in filter segment
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    And Material Forecast Report page should contain filter as expected
      | Name                          | Type   |
      | REGION                        | FIELD  |
      | PLANT CODE - PLANT NAME       | FIELD  |
      | SWEC MATERIAL GROUP           | FIELD  |
      | MATERIAL CRITICALITY          | OPTION |
      | FUTURE MOVEMENT               | FIELD  |
      | MATERIAL NO                   | FIELD  |
      | CURRENT MATERIAL PLANT STATUS | FIELD  |
      | STOCK OUT                     | TOGGLE |
    When I select filter option 'index-1' in Material Forecast Report page
    And I delete all option of filter option in Material Forecast Report
      | Name                          | Type   |
      | REGION                        | FIELD  |
      | PLANT CODE - PLANT NAME       | FIELD  |
      | SWEC MATERIAL GROUP           | FIELD  |
      | MATERIAL CRITICALITY          | OPTION |
      | FUTURE MOVEMENT               | FIELD  |
      | MATERIAL NO                   | FIELD  |
      | CURRENT MATERIAL PLANT STATUS | FIELD  |
    And I select options in 'CURRENT MATERIAL PLANT STATUS' field
      | random |
    And I click on 'Search' button
    And I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column                        | Operator | Expected                        |
      | Current Material Plant Status | EQUALS   | Global-RANDOM_VALUE_FROM_FILTER |

  #Priority 2
  @480746
  Scenario: [US 49][Material Forecast] Material Criticality filter should be displayed by select option
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    And Material Forecast Report page should contain filter as expected
      | Name                          | Type   |
      | REGION                        | FIELD  |
      | PLANT CODE - PLANT NAME       | FIELD  |
      | SWEC MATERIAL GROUP           | FIELD  |
      | MATERIAL CRITICALITY          | OPTION |
      | FUTURE MOVEMENT               | FIELD  |
      | MATERIAL NO                   | FIELD  |
      | CURRENT MATERIAL PLANT STATUS | FIELD  |
      | STOCK OUT                     | TOGGLE |
    And 'MATERIAL CRITICALITY' field should contain options below
      | V - 99 |
      | E - 95 |
      | D - 90 |
    When I select option on filter bar in Stock Proposal Report
      | V - 99 |
    Then The button 'V - 99' in 'MATERIAL CRITICALITY' field should be 'selected'
    When I click on 'Search' button
    And I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column               | Operator         | Expected |
      | Material Criticality | EQUALS OR LARGER |       99 |
    When I click on 'Reset' button
    Then The button 'V - 99' in 'MATERIAL CRITICALITY' field should be 'not selected'
    When I select option on filter bar in Stock Proposal Report
      | E - 95 |
    Then The button 'E - 95' in 'MATERIAL CRITICALITY' field should be 'selected'
    When I click on 'Search' button
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column               | Operator      | Expected |
      | Material Criticality | BETWEEN RANGE | 95-99    |
    When I click on 'Reset' button
    Then The button 'E - 95' in 'MATERIAL CRITICALITY' field should be 'not selected'
    When I select option on filter bar in Stock Proposal Report
      | D - 90 |
    Then The button 'D - 90' in 'MATERIAL CRITICALITY' field should be 'selected'
    When I click on 'Search' button
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column               | Operator          | Expected |
      | Material Criticality | EQUALS OR SMALLER |       90 |
    When I click on 'Reset' button
    Then The button 'D - 90' in 'MATERIAL CRITICALITY' field should be 'not selected'
