@US43
Feature: Stock Proposal Savings Report

  #Priority 2
  @502021
  Scenario: [US43][Saving Report] Layout of page should be correctly
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Savings Report' tab
    Then 'Stock Proposal Savings Report' page title should be displayed
    And The button 'Download' should be 'displayed'
    And The button 'Search' should be 'displayed'
    And The button 'Reset' should be 'displayed'
    And Material Forecast Report page should contain filter as expected
      | Name                    | Type  |
      | SRC SEATING NO          | FIELD |
      | STOCK PROPOSAL REF NO   | FIELD |
      | PLANT CODE - PLANT NAME | FIELD |
      | ENDORSEMENT             | FIELD |
    And The order of table headers should be displayed as design
      |                                   |
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
    And The table should be order 'descending' in the column 'Stock Proposal Value Captured(RM)'
    And These headers in the table will have sort icon
      | Header                            | Sort |
      | SRC Seating No                    | Yes  |
      | Stock Proposal Ref No             | Yes  |
      | Plant Code-Plant Name             | Yes  |
      | Endorsement                       | Yes  |
      | Material No                       | Yes  |
      | Estimated Unit Price(RM)          | Yes  |
      | Endorsed Min                      | No   |
      | Endorsed Max                      | No   |
      | Endorsed Total Value(RM)          | Yes  |
      | ERBS Min                          | No   |
      | ERBS Max                          | No   |
      | ERBS Total Value(RM)              | Yes  |
      | User Min                          | No   |
      | User Max                          | No   |
      | User Total Value(RM)              | Yes  |
      | OEM Min                           | No   |
      | OEM Max                           | No   |
      | OEM Total Value(RM)               | Yes  |
      | Stock Proposal Value Captured(RM) | Yes  |
    When I change the number of data rows in table into '5'
    Then 5 rows in the table should be corresponding to the show option

  #Priority 2
  @502025
  Scenario: [US43][Saving Report] Value in Captured label should be change base on total Stock Proposal Value Captured in table and format of this label should be displayed correctly
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Savings Report' tab
    Then 'Stock Proposal Savings Report' page title should be displayed
    And The button 'Download' should be 'displayed'
    And The button 'Search' should be 'displayed'
    And The button 'Reset' should be 'displayed'
    And Material Forecast Report page should contain filter as expected
      | Name                    | Type  |
      | SRC SEATING NO          | FIELD |
      | STOCK PROPOSAL REF NO   | FIELD |
      | PLANT CODE - PLANT NAME | FIELD |
      | ENDORSEMENT             | FIELD |
    When I select options in 'SRC SEATING NO' field
      | 465746 |
    And I click on 'Search' button
    Then The Stock Proposal Value Captured should have 2 decimal point and currency 'no'
    When I select options in 'SRC SEATING NO' field
      | 465746 |
      | 911003 |
    And I click on 'Search' button
    Then The Stock Proposal Value Captured should have 2 decimal point and currency 'K'
    When I select options in 'SRC SEATING NO' field
      | 911003 |
      | 178453 |
    And I click on 'Search' button
    Then The Stock Proposal Value Captured should have 2 decimal point and currency 'M'

  #Priority 2
  @502693
  Scenario: [US 43][Stock Proposal Report] Detail tab: It should have 2 column next to "Req. Issuance Qty" column.
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' tab
    Then 'Stock Proposal Summary' page title should be displayed
    When I click to SPF Ref No 'random' in the SPF Tracking Summary table
    And I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I get value from 'random' record in the table
      | Material No   |
      | Input-OEM Min |
      | Input-OEM Max |
    And I go back to the 'ISA' page
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Savings Report' tab
    Then 'Stock Proposal Savings Report' page title should be displayed
    When I select options in 'STOCK PROPOSAL REF NO' field
      | Global-RANDOM_REF_NO |
    And I click on 'Search' button
    Then Column in the Saving Report page which have same Material No and Ref No should have same OEM
