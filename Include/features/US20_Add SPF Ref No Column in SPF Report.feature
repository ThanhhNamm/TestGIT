@US20
Feature: Add SPF Ref No Column in SPF Report

  #Priority 2
  @451462
  Scenario: [Stock Proposal Report] Detail tab: Stock Proposal Ref No should be respective with Material No
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Report' sub Menu
    Then 'Stock Proposal Report' page title should be displayed
    When I click on 'Detail' button
    And I select options in 'STOCK PROPOSAL REF NO' field
      | random |
    And I click on 'Search' button
    And I get all data of column 'Stock Proposal Ref No' in Stock Proposal Summary
    And I get random data from list 'COLUMN_LIST'
    And I get all data of column 'Material No' in Stock Proposal Summary
    And I get all values from column 'material_no' from the database
      | Global-RANDOM_VALUE |
    Then All data in column 'Material No' must exist in list 'MATERIAL_NO' of 10 pages
