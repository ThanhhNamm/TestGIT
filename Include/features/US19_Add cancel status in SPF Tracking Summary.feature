@US19
Feature: Add cancel status in SPF Tracking Summary

  @451466
  Scenario: When one Ref No at "Stock Proposal Summary" has status is "SPF Cancelled", the status of this Ref No in SPF Tracking Summary should be "SPF Cancelled"
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then  'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then  'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | SPF Cancelled |
    And I get all data of column 'Stock Proposal Ref No' in Stock Proposal Summary
    And I go back to the 'ISA' page
    And I get random data from list 'COLUMN_LIST'
    And I search for 'Global-RANDOM_VALUE' in search bar
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column | Expected      |
      | Status | CANCELLED SPF |
