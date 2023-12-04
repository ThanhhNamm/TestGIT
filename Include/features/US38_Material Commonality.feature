@US38
Feature: Material Commonality

  @443622
  Scenario: [iSpare][SRC Secretary][Stock Proposal Summary][Stock Proposal Deliberation] "Material Commonality" pop-up: Verify data in UI should be match with data in DB
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
      | Completed Endorsement    |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I click on button in column of table in ERBS Input
      | Column               | Name      |
      | Material Commonality | Info icon |
    Then A new pop-up 'Material Commonality' should be displayed
    And The Material No in the pop up should contain five highest records

  #Priority 2
  @443619
  Scenario: [SRC Secretary][ISpare][Stock Proposal Summary][Stock Proposal Deliberation] When user click on "i" icon, it should display "Material Commonality" pop-up
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
      | Completed Endorsement    |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I click on button in column of table in ERBS Input
      | Column               | Name      |
      | Material Commonality | Info icon |
    Then A new pop-up 'Material Commonality' should be displayed
