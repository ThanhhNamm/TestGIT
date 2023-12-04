@US39
Feature: Enhancement for Stock Proposal Deliberation

  #Priority 2
  @466448
  Scenario: [Stock Proposal Summary] [Stock Proposal Deliberation] OEM Min & "OEM Max" column should display correctly when click on a Stock Proposal Ref no with status "Pending for Deliberation"
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    When I click on 'ALL' button
    And I select checkboxes in Column Option
      | Select All        |
      | Req. Issuance Qty |
    And I click on 'Apply Changes' button
    Then The order of table headers should be displayed as design
      |                           |
      | Material No               |
      | Material Description      |
      | Material Commonality      |
      | Req. Issuance Qty         |
      | OEM Min                   |
      | OEM Max                   |
      | Endorsed Min              |
      | Endorsed Max              |
      | Endorsed Total Value (RM) |
      | Endorsement               |
      | Endorsement remarks       |
      | Endorsed Timestamp        |
    When I click on 'PROPOSED TO STOCK' button
    And I select checkboxes in Column Option
      | Select All        |
      | Req. Issuance Qty |
    And I click on 'Apply Changes' button
    And The order of table headers should be displayed as design
      |                           |
      | Material No               |
      | Material Description      |
      | Material Commonality      |
      | Req. Issuance Qty         |
      | OEM Min                   |
      | OEM Max                   |
      | Endorsed Min              |
      | Endorsed Max              |
      | Endorsed Total Value (RM) |
      | Endorsement               |
      | Endorsement remarks       |
      | Endorsed Timestamp        |
    When I click on 'VITAL & LONG LEAD' button
    And I select checkboxes in Column Option
      | Select All        |
      | Req. Issuance Qty |
    And I click on 'Apply Changes' button
    And The order of table headers should be displayed as design
      |                           |
      | Material No               |
      | Material Description      |
      | Material Commonality      |
      | Req. Issuance Qty         |
      | OEM Min                   |
      | OEM Max                   |
      | Endorsed Min              |
      | Endorsed Max              |
      | Endorsed Total Value (RM) |
      | Endorsement               |
      | Endorsement remarks       |
      | Endorsed Timestamp        |
    When I click on 'POTENTIAL FAST MOVE' button
    And I select checkboxes in Column Option
      | Select All        |
      | Req. Issuance Qty |
    And I click on 'Apply Changes' button
    And The order of table headers should be displayed as design
      |                           |
      | Material No               |
      | Material Description      |
      | Material Commonality      |
      | Req. Issuance Qty         |
      | OEM Min                   |
      | OEM Max                   |
      | Endorsed Min              |
      | Endorsed Max              |
      | Endorsed Total Value (RM) |
      | Endorsement               |
      | Endorsement remarks       |
      | Endorsed Timestamp        |
    When I click on 'POTENTIAL SLOW MOVE' button
    And I select checkboxes in Column Option
      | Select All        |
      | Req. Issuance Qty |
    And I click on 'Apply Changes' button
    And The order of table headers should be displayed as design
      |                           |
      | Material No               |
      | Material Description      |
      | Material Commonality      |
      | Req. Issuance Qty         |
      | OEM Min                   |
      | OEM Max                   |
      | Endorsed Min              |
      | Endorsed Max              |
      | Endorsed Total Value (RM) |
      | Endorsement               |
      | Endorsement remarks       |
      | Endorsed Timestamp        |
    When I click on 'POTENTIAL NON-MOVE' button
    And I select checkboxes in Column Option
      | Select All        |
      | Req. Issuance Qty |
    And I click on 'Apply Changes' button
    And The order of table headers should be displayed as design
      |                           |
      | Material No               |
      | Material Description      |
      | Material Commonality      |
      | Req. Issuance Qty         |
      | OEM Min                   |
      | OEM Max                   |
      | Endorsed Min              |
      | Endorsed Max              |
      | Endorsed Total Value (RM) |
      | Endorsement               |
      | Endorsement remarks       |
      | Endorsed Timestamp        |
