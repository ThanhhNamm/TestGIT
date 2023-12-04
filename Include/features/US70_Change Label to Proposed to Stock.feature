@US70
Feature: Change Label to Proposed to Stock

  #Priority 2
  @581625
  Scenario: [Stock Proposal Deliberation] It should have 6 tabs
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' tab
    Then 'Stock Proposal Summary' page title should be displayed
    When I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then The screen should contain list of tab below
      | ALL                 |
      | PROPOSED TO STOCK   |
      | VITAL & LONG LEAD   |
      | POTENTIAL FAST MOVE |
      | POTENTIAL SLOW MOVE |
      | POTENTIAL NON-MOVE  |
