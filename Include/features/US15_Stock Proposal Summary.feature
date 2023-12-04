@US15
Feature: Stock Proposal Summary

  @431695
  Scenario: The Stock Proposal Summary screen will display when SRC User clicks on "Stock Proposal Summary" button
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed

  @431697
  Scenario: Verify status count summary should be available above stock proposal summary table and display the number coressponding with each status
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    And Stock Proposal Summary should contain 4 status count
      | Endorsement Completed    |
      | Partially Endorsed       |
      | Pending for Deliberation |
      | SPF Cancelled            |
    And The number of Ref No for each status must match with number in status count

  @431698
  Scenario: Stock Proposal Ref No for submitted for deliberation will displayed and included hyperlink
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I change the number of data rows in table into '5'
    And I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
      | Completed Endorsement    |
    And I get a list of all plant code in Stock Proposal Summary
    Then All ref no in the table must follow format 'SPF/year/code' in Stock Proposal Summary

  @431702
  Scenario: On the Stock Proposal summary, the status will show ' Pending for Deliberation' when all line items are not endorsed yet
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
    And I change the number of data rows in table into '5'
    Then Ref No in Stock Proposal Summary should follow rule of status 'Pending Deliberation'

  @431703
  Scenario: On the Stock Proposal summary, the status will show ' Partially Endorsed' when having atleast one items in the SPF are endorsed/rejected
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially |
    And I change the number of data rows in table into '5'
    And I change the number of data rows in table into '5'
    Then Ref No in Stock Proposal Summary should follow rule of status 'Endorsed Partially'

  @431704
  Scenario: On the Stock Proposal summary, the status will show ' Endorsement Completed' when all the line items are fully endorsed
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Completed Endorsement |
    And I change the number of data rows in table into '100'
    And I change the number of data rows in table into '100'
    Then Ref No in Stock Proposal Summary should follow rule of status 'Completed Endorsement'

  @431712
  Scenario: Cancel SPF action is only available for the stock proposal in status 'Pending for deliberation'
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I change the number of data rows in table into '100'
    Then Ref No in Stock Proposal Summary should follow rule of status 'All status'

  @431713 @431705
  Scenario: When SRC user click on Cancel action, a popup message will display for confirmation
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
    And I change the number of data rows in table into '5'
    And I change the number of data rows in table into '5'
    Then Ref No in Stock Proposal Summary should follow rule of status 'Pending Deliberation Cancel'

  @431718
  Scenario: Stock Proposal Ref No will be freeze when scrolling to the right
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    And Stock Proposal Summary column still be displayed when scroll in Stock Proposal Summary

  #Priority 2
  @431699
  Scenario: Verify 'Plant Name' field is displayed associated to the Ref No
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I verify 'Plant Name' in Stock Proposal Summary with Ref No
    When I go back to the 'ISA' page
    When I search for 'Global-REF_NO_TEXT' in search bar
    Then Column in table should have data match with expected result
      | Column                  | Operator | Expected            |
      | Plant Code - Plant Name | CONTAINS | Global-COMPARE_TEXT |

  #Priority 2
  @431700
  Scenario: Verify 'Requester' field is displayed associated to the Ref No
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I verify 'Requester' in Stock Proposal Summary with Ref No
    And I go back to the 'ISA' page
    And I search for 'Global-REF_NO_TEXT' in search bar
    Then Column in table should have data match with expected result
      | Column         | Operator | Expected            |
      | Requester Name | CONTAINS | Global-COMPARE_TEXT |

  #Priority 2
  @431701
  Scenario: Verify SPF Deliberation Submission Date is displayed date of deliberation submission associated to the Ref No
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I verify 'SPF Deliberation Submission Date' in Stock Proposal Summary with Ref No
    And I go back to the 'ISA' page
    And I search for 'Global-REF_NO_TEXT' in search bar
    Then The Ref No should contain data match with expected result
      | Ref No             | Column                       | Expected Result     |
      | Global-REF_NO_TEXT | Deliberation Submission Date | Global-COMPARE_TEXT |

  #Priority 2
  @431707
  Scenario: Verify 'Total/Pending Endorsement Item' field is displayed total submitted line item for deliberation/Pending for Endorsement
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I verify 'Total/Pending Endorse Item' in Stock Proposal Summary with Ref No
    And I go back to the 'ISA' page
    And I search for 'Global-REF_NO_TEXT' in search bar
    Then Column in table should have data match with expected result
      | Column                                                   | Operator | Expected            |
      | Total Submitted Material for Recommendation/Deliberation | CONTAINS | Global-COMPARE_TEXT |

  #Priority 2
  @431708
  Scenario: [SPS] Verify Total Value (RM) field will be auto calculated =Max(User Min/User Max) x Est Unit Price if ERBS Min/Max is not available
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially    |
      | Completed Endorsement |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    And I select checkboxes in Column Option
      | Select All               |
      | Estimated Unit Price(RM) |
      | Min(User)                |
      | Max(User)                |
      | ERBS Min                 |
      | ERBS Max                 |
    And I click on 'Apply Changes' button
    And I get total value of all endorse and reject records
    And I go back to the 'ISA' page
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I search for 'Global-RANDOM_REF_NO' in search bar
    Then The Ref No should contain data match with expected result
      | Ref No               | Column          | Expected Result    |
      | Global-RANDOM_REF_NO | Total Value(RM) | Global-TOTAL_VALUE |

  #Priority 2
  @431709
  Scenario: Verify Endorsed/Rejected Line Item field is displayed Total Endorsed Item/Total Rejected Item
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
    When I verify 'Endorsed/Rejected Line Item' in Stock Proposal Summary with Ref No
    And I search for 'Global-REF_NO_TEXT' in search bar
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then Endorsed Rejected Line Item field should be displayed

  #Priority 2
  @431710
  Scenario: [SPS] Verify 'Endorsed Value(RM)' field will be calculated = Max(Endorsed Min/Endorsed Max) x Est Unit Price.(Only for Endorsed Items)
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially    |
      | Completed Endorsement |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    And I select checkboxes in Column Option
      | Select All               |
      | Estimated Unit Price(RM) |
    And I click on 'Apply Changes' button
    And I calculate value of all endorse records
    And I go back to the 'ISA' page
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I search for 'Global-RANDOM_REF_NO' in search bar
    Then The Ref No should contain data match with expected result
      | Ref No               | Column             | Expected Result      |
      | Global-RANDOM_REF_NO | Endorsed Value(RM) | Global-ENDORSE_VALUE |

  #Priority 2
  @431711
  Scenario: [SPS] Verify 'Rejected Value(RM)' field will be calculated = Max(User Min/User Max) x Est Unit Price if ERBS Min/Max is not available (Only for Rejected Items)
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially    |
      | Completed Endorsement |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    And I select checkboxes in Column Option
      | Select All               |
      | Estimated Unit Price(RM) |
      | Min(User)                |
      | Max(User)                |
      | ERBS Min                 |
      | ERBS Max                 |
    And I click on 'Apply Changes' button
    And I calculate value of all reject records
    And I go back to the 'ISA' page
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I search for 'Global-RANDOM_REF_NO' in search bar
    Then The Ref No should contain data match with expected result
      | Ref No               | Column             | Expected Result     |
      | Global-RANDOM_REF_NO | Rejected Value(RM) | Global-REJECT_VALUE |

  #Priority 2
  #Test case required real data from database, don't run this TC if not neccessary
  @431714
  Scenario: Status of Ref No will change to SPF Cancelled after user click on Cancel action
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
    And I click on Cancel action in Stock Proposal Summary
    And I search for 'Global-REF_NO' in search bar
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column | Expected      |
      | Status | SPF CANCELLED |

  #Priority 2
  @431715
  Scenario: [SPF] User cannot click on the Ref No with SPF Cancel status
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | SPF Cancelled |
    Then All Ref No with status SPF Cancelled should not contain checkbox and are disabled
