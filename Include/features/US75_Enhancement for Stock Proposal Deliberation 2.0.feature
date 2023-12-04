@US75
Feature: Enhancement for Stock Proposal Deliberation 2.0

  @676410
  Scenario: Reject button should be removed and Endorse should be rename to Finalize
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then  'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then  'Stock Proposal Summary' page title should be displayed
    When I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then  'Stock Proposal Deliberation' page title should be displayed
    And The button 'Finalize' should be 'displayed'
    And The button 'Finalize' should be 'disabled'

  @676459
  Scenario: User should be able to edit when user has not click on Finalize button yet
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then  'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then  'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then  'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    Then User able to input random data into column of Stock Proposal Deliberation
      | OEM Min             |
      | OEM Max             |
      | Endorsed Min        |
      | Endorsed Max        |
      | Endorsement remarks |

  @678676
  Scenario: Verify design of Endorse and Reject button in Endorsement column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then  'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then  'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then  'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I input 'valid' number into SRC Seating No
    And I input data into first row of table with Endorsement 'Endorse'
      | Column              | Value |
      | OEM Min             |     1 |
      | OEM Max             |    10 |
      | Endorsed Min        |     1 |
      | Endorsed Max        |    10 |
      | Endorsement remarks | Test  |
    Then  'Endorse' button in Endorsement column should have color as design
    When I input data into first row of table with Endorsement 'Reject'
      | Column              | Value |
      | OEM Min             |     1 |
      | OEM Max             |    10 |
      | Endorsed Min        |     1 |
      | Endorsed Max        |    10 |
      | Endorsement remarks | Test  |
    Then 'Reject' button in Endorsement column should have color as design

  @685659
  Scenario: It should remain selection when user click on another page of 1 Ref No
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then  'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then  'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
    And I search for 'SPF/2023/M053/011' in search bar
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    And I input 'valid' number into SRC Seating No
    And I click to move to 'Go to next page' page
    And I click to move to 'Go to previous page' page
    Then The data in SRC No should be 'Global-SRC_NO'

  #Priority 2
  @678678
  Scenario: [US75][Stock Proposal Deliberation][Proposed to stock tab] Reject button should be removed and Endorse should be rename to Finalize
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then  'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then  'Stock Proposal Summary' page title should be displayed
    When I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then  'Stock Proposal Deliberation' page title should be displayed
    When I click on 'PROPOSED TO STOCK' button
    And The button 'Finalize' should be 'displayed'
    And The button 'Finalize' should be 'disabled'

  #Priority 2
  @685660
  Scenario: [US75][Stock Proposal Deliberation] It should have error message when user click on endorse/reject button when they have NOT filled in all mandatory fields
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then  'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then  'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
    When I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then  'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I click on button in column of table in ERBS Input
      | Column      | Name    |
      | Endorsement | Endorse |
    Then SRC Seating No field and Endorsement remarks column should contain error message when data is null
