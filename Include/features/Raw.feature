@tag
Feature: Title of your feature
  I want to use this template for my feature file

  #Priority 2
  @466772
  Scenario: Data in table result should be display corresponding with filter
    Given I go to the 'Material Forecast Analyzer' page with 'OPU ENGINEER' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' sub Menu
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
    When I select options in 'REGION' field
      | random |
    And I select options in 'PLANT CODE - PLANT NAME' field
      | random |
    And I select options in 'SWEC MATERIAL GROUP' field
      | random |
    And I select options in 'FUTURE MOVEMENT' field
      | random |
    And I select options in 'MATERIAL NO' field
      | random |
    And I select options in 'CURRENT MATERIAL PLANT STATUS' field
      | random |
    And I delete all option of filter option in Material Forecast Report
      | Name                          | Type  |
      | REGION                        | FIELD |
      | PLANT CODE - PLANT NAME       | FIELD |
      | SWEC MATERIAL GROUP           | FIELD |
      | FUTURE MOVEMENT               | FIELD |
      | MATERIAL NO                   | FIELD |
      | CURRENT MATERIAL PLANT STATUS | FIELD |
    And I select options in 'REGION' field
      | EAST COAST |
    And I select options in 'PLANT CODE - PLANT NAME' field
      | random |
    And I click on 'Search' button
    And I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    And I convert Plant Code Plant Name 'Global-RANDOM_VALUE_FROM_FILTER' into two
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column     | Operator | Expected          |
      | Region     | EQUALS   | EAST COAST        |
      | Plant Code | EQUALS   | Global-PLANT_CODE |
      | Plant Name | EQUALS   | Global-PLANT_NAME |
    When I delete all option of filter option in Material Forecast Report
      | Name                    | Type  |
      | PLANT CODE - PLANT NAME | FIELD |
    Then Option in the field 'PLANT CODE - PLANT NAME' of Material Forecast Report should be displayed as default
    And Option in the field 'REGION' of Material Forecast Report should be displayed as default
    When I select options in 'PLANT CODE - PLANT NAME' field
      | M046 - ABF |
    Then Option in the field of Material Forecast Report should be displayed as expected
      | Name   | Type  | Data          |
      | REGION | FIELD | EAST MALAYSIA |
    When I delete all option of filter option in Material Forecast Report
      | Name   | Type  |
      | REGION | FIELD |
    Then Option in the field 'PLANT CODE - PLANT NAME' of Material Forecast Report should be displayed as default
    And Option in the field 'REGION' of Material Forecast Report should be displayed as default
    When I select options in 'REGION' field
      | EAST MALAYSIA |
    And I select options in 'PLANT CODE - PLANT NAME' field
      | M046 - ABF |
    And I select option on filter bar in Stock Proposal Report
      | D - 90 |
    And I select options in 'FUTURE MOVEMENT' field
      | Non Move |
    And I click on 'Search' button
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column              | Operator | Expected      |
      | Region              | EQUALS   | EAST MALAYSIA |
      | Plant Code          | EQUALS   | M046          |
      | Plant Name          | EQUALS   | ABF           |
      | Material Critically | EQUALS   |            90 |
    And The file name 'Stock Proposal Savings Report' in '/Data/Data Download/' folder should have column as expected
      | SRC Seating No                    |
      | Stock Proposal Ref No             |
      | Plant Code-Plant Name             |
      | Endorsement                       |
      | Material No                       |
      | Estimated Unit Price(RM)          |
      | Endorsed Min                      |
      | Endorsed Max                      |
      | Endorsed Total Value(RM)          |
      | ERBS Min                          |
      | ERBS Max                          |
      | ERBS Total Value(RM)              |
      | User Min                          |
      | User Max                          |
      | User Total Value(RM)              |
      | OEM Min                           |
      | OEM Max                           |
      | OEM Total Value(RM)               |
      | Stock Proposal Value Captured(RM) |
    And Number of record in file name 'Stock Proposal Savings Report' in '/Data/Data Download/' should be '5'
    And I delete the data file 'Stock Proposal Savings Report' in the directory '/Data/Data Download/'
