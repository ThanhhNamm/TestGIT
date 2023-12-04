@US27
Feature: Material Forecast Report Phase 2

  @465207
  Scenario: [Material Forecast Analyzer][Material Forecast Report]Data in child table should be display correctly
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed

  @465208
  Scenario: [Material Forecast Analyzer][Material Forecast Report]Table result should displayed all material no which match with Material No search box
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select random value in 'MATERIAL NO' field
    Then A new 'SWEC MATERIAL GROUP' should be displayed automatically
    When I delete all option of filter option in Material Forecast Report
      | Name        | Type  |
      | MATERIAL NO | FIELD |
    Then Option in the field of Material Forecast Report should be displayed as expected
      | Name                | Type  | Data                  |
      | SWEC MATERIAL GROUP | FIELD | Global-SWEC_MAT_GROUP |
    And SWEC Material Group displayed should be matched with database where Material No is 'Global-MATERIAL_NO'
    When I select random value in 'MATERIAL NO' field
    Then A new 'SWEC MATERIAL GROUP' should be displayed automatically
    When I delete all option of filter option in Material Forecast Report
      | Name        | Type  |
      | MATERIAL NO | FIELD |
    Then Option in the field of Material Forecast Report should be displayed as expected
      | Name                | Type  | Data                  |
      | SWEC MATERIAL GROUP | FIELD | Global-SWEC_MAT_GROUP |
    And SWEC Material Group displayed should be matched with database where Material No is 'Global-MATERIAL_NO'
    When I delete all option of filter option in Material Forecast Report
      | Name                | Type  |
      | SWEC MATERIAL GROUP | FIELD |
    And I select random value in 'SWEC MATERIAL GROUP' field
    And I click on 'Search' button
    And I get all values from column 'material_no' from the database
      | Global-SWEC_MATERIAL_GROUP |
    And I click on 'Search' button
    And I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    Then All data in column 'Material No' must exist in list 'MATERIAL_NO' of 10 pages
