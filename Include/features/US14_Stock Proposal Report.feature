@US14
Feature: Stock Proposal Report

  @433068
  Scenario: The Stock Proposal Report screen will display when SRC User click on Stock Proposal Report button on Landing page
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Report' sub Menu
    Then 'Stock Proposal Report' page title should be displayed

  @433101 @433102
  Scenario: The Summary table will display accordingly to all filter when SRC User clicks on Search button
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Report' sub Menu
    Then 'Stock Proposal Report' page title should be displayed
    When I select option on filter bar in Stock Proposal Report
      | D - 90                |
      | 2 - Med               |
      | Completed Endorsement |
    And I click on 'Search' button
    Then Data in table should be match with filter value in Stock Proposal Report
      | Tab     | Column                | Value                 |
      | Summary | Status                | Completed Endorsement |
      | Detail  | Material Criticality  |                    90 |
      | Detail  | Equipment Criticality |                     2 |

  @433104
  Scenario: The Excel file is downloaded when SRC User clicks on 'Export to Excel' button
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Report' sub Menu
    Then 'Stock Proposal Report' page title should be displayed
    When I select all ref no in the Stock Proposal Report page
    And I click on 'Export to Excel' button
    Then New file name 'SPF Endorsement Report' should be downloaded

  @433278
  Scenario: The Stock Proposal Report screen will display when OPU User click on SPF Proposal Report button on Landing page
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Report' sub Menu
    Then 'Stock Proposal Report' page title should be displayed
