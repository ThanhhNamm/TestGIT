@US32
Feature: Initial Spare module

  @425242
  Scenario: OPU Engineer click on Hyperlink of Stock Proposal Ref No, it will redirect to Recommendation screen (Submission for Delibration tab)
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed

  @425247
  Scenario: On the SPF tracking summary, Plan code - Plan Name will display based on SPF Submission - SPF/Year/PlantCode/001
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    And I click on 'SPF Submission' tab
    And I select 'M047 - PC Fertilizer Kedah' Plan Code - Plan Name
    And I input data into fields in SPF Submission
      | Material No | Lead Time | Estimated Unit Price |
      |    50919163 |         4 |                 1200 |
    And I click on 'Submit' button
    And I click on 'OK' button
    And I click on 'Submit' button
    And I click on 'OK' button
    And I wait and get the Ref No of new SPF Submission
    And I go to site 'MMW - Initial Spare Landing Page'
    And 'Initial Spare Analyzer' page title should be displayed
    And I search for 'Global-NEWREFNO' in search bar
    Then The Ref No should contain data match with expected result
      | Ref No          | Column                  | Expected Result            |
      | Global-NEWREFNO | Plant Code - Plant Name | M047 - PC Fertilizer Kedah |

  @425248
  Scenario: On the SPF tracking summary, Requestor name will be display based on the SPF Submission
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    And I click on 'SPF Submission' tab
    And I select 'M039 - PCG - Optimal Olefins Plant' Plan Code - Plan Name
    And I input data into fields in SPF Submission
      | Material No | Lead Time | Estimated Unit Price |
      |    50000000 |         4 |                 1200 |
    And I observe the requester name
    And I click on 'Submit' button
    And I click on 'OK' button
    And I click on 'Submit' button
    And I click on 'OK' button
    And I wait and get the Ref No of new SPF Submission
    And I go to site 'MMW - Initial Spare Landing Page'
    And 'Initial Spare Analyzer' page title should be displayed
    And I search for 'Global-NEWREFNO' in search bar
    Then The Ref No should contain data match with expected result
      | Ref No          | Column                  | Expected Result                    |
      | Global-NEWREFNO | Plant Code - Plant Name | M039 - PCG - Optimal Olefins Plant |
      | Global-NEWREFNO | Requester Name          | Global-REQUESTER_SUBMIT            |

  @425251
  Scenario: On the SPF tracking summary, the SPF Submission Date will show the corect date (If no Sub Ref no)
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    And I click on 'SPF Submission' tab
    And I select 'M041 - PCG - Optimal Glycols Plant' Plan Code - Plan Name
    And I input data into fields in SPF Submission
      | Material No | Lead Time | Estimated Unit Price |
      |    50000000 |        10 |                 1200 |
    And I observe the requester name
    And I click on 'Submit' button
    And I click on 'OK' button
    And I click on 'Submit' button
    And I click on 'OK' button
    And I wait and get the Ref No of new SPF Submission
    And I go to site 'MMW - Initial Spare Landing Page'
    And 'Initial Spare Analyzer' page title should be displayed
    And I search for 'Global-NEWREFNO' in search bar
    Then The Ref No should contain data match with expected result
      | Ref No          | Column                  | Expected Result                    |
      | Global-NEWREFNO | Plant Code - Plant Name | M041 - PCG - Optimal Glycols Plant |
      | Global-NEWREFNO | Requester Name          | Global-REQUESTER_SUBMIT            |
      | Global-NEWREFNO | SPF Submission Date     | Current Date-dd MMM yyyy           |

  @425254
  Scenario: On the SPF tracking summary, the Delibration Submission Date will show blank when the Ref No in Pending For Recommendation status
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column                       | Expected                            |
      | Deliberation Submission Date |                                     |
      | Status                       | PENDING FOR DELIBERATION SUBMISSION |

  @425256
  Scenario: On the SPF tracking summary,  the status will show 'Pending for Recommendation' after a new SPF Submission is submited
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    And I click on 'SPF Submission' tab
    And I select 'M047 - PC Fertilizer Kedah' Plan Code - Plan Name
    And I input data into fields in SPF Submission
      | Material No | Lead Time | Estimated Unit Price |
      |    50919163 |         4 |                 1200 |
    And I click on 'Submit' button
    And I click on 'OK' button
    And I click on 'Submit' button
    And I click on 'OK' button
    And I wait and get the Ref No of new SPF Submission
    And I go to site 'MMW - Initial Spare Landing Page'
    And 'Initial Spare Analyzer' page title should be displayed
    And I search for 'Global-NEWREFNO' in search bar
    Then The Ref No should contain data match with expected result
      | Ref No          | Column                  | Expected Result            |
      | Global-NEWREFNO | Plant Code - Plant Name | M047 - PC Fertilizer Kedah |
      | Global-NEWREFNO | Status                  | PENDING FOR RECOMMENDATION |

  @425257
  Scenario: On the SPF tracking summary, the status will show 'Pending for Resubmit' in the Child Ref No when the it is pending for resubmit
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Resubmit |
    And I click on expand button of 'any' Ref No in SPF Tracking Summary
    And I click on 'any' child ref no displaying in SPF Tracking Summary
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed
    When I click on 'OK' button
    And I get the Reference No in the SPF Recommendation and Deliberation Submission
    And I go back to the 'ISA' page
    And I search for 'Global-REFERENCE_NO' in search bar
    And I click on expand button of 'any' Ref No in SPF Tracking Summary
    Then The Ref No should contain data match with expected result
      | Ref No          | Column | Expected Result      |
      | Global-NEWREFNO | Status | PENDING FOR RESUBMIT |

  #Incompleted
  @425259
  Scenario: On the SPF tracking summary, the status will show ' Delibration completed' will display when no pending for endorsement (US 15)
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    #When I select 'Status:' in SPF Tracking Summary
    #| Pending for SRC Secretary Review |
    #And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    #And I get the Reference No in the SPF Recommendation and Deliberation Submission
    #And I go back to the 'ISA' page
    And I click on 'Stock Proposal Summary' tab
    #Then 'Stock Proposal Summary' page title should be displayed
    When I search for 'SPF/2023/M097/067' in search bar
    And I click to SPF Ref No 'SPF/2023/M097/067' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button

  @425260
  Scenario: On the SPF tracking summary, the status will show ' Deleted No Recommendations with Error' when the data is deleted from " Insufficient Data for Recommendation" tab
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Resubmit |
    And I click on expand button of 'any' Ref No in SPF Tracking Summary
    And I click on 'any' child ref no displaying in SPF Tracking Summary
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed
    When I click on 'OK' button
    And I click on 'Delete' button
    And I click on 'Ok' button
    And I get the Reference No in the SPF Recommendation and Deliberation Submission
    And I go back to the 'ISA' page
    And I search for 'Global-REFERENCE_NO' in search bar
    And I click on expand button of 'any' Ref No in SPF Tracking Summary
    Then The Ref No should contain data match with expected result
      | Ref No              | Column | Expected Result                       |
      | Global-REFERENCE_NO | Status | DELETED NO RECOMMENDATIONS WITH ERROR |

  @425261
  Scenario: On the SPF tracking summary, OPU Engineer account can see 1 options: Download (If there is NO child Ref no.)
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    Then The Ref No shoud contain download icon in SPF Tracking Summary
      | ALL ROWS |

  @425262
  Scenario: On the SPF tracking summary, OPU Engineer account can see 2 options: Download & Resubmit  if there is a Child Ref No in Pending for Resubmit status
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Resubmit |
    And I search for 'SPF/2023/M041/019' in search bar
    And I click on expand button of 'SPF/2023/M041/019' Ref No in SPF Tracking Summary
    Then The re submit button of child Ref No should be displayed as design
      | Child Ref No          | Resubmit |
      | SPF/2023/M041/019/R01 | Yes      |

  @428931
  Scenario: On the SPF tracking summary, the Delibration Submission Date will show blank when the Ref No in Pending For Deliberation status
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column                       | Expected                            |
      | Deliberation Submission Date |                                     |
      | Status                       | PENDING FOR DELIBERATION SUBMISSION |

  @428932
  Scenario: On the SPF tracking summary, the Delibration Submission Date will show blank when the Ref No in Pending For Re-submit status
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Resubmit |
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column                       | Expected                            |
      | Deliberation Submission Date |                                     |
      | Status                       | PENDING FOR DELIBERATION SUBMISSION |

  @428946
  Scenario: On the SPF tracking summary, OPU Engineer account can see 1 options: Download if There is a Child Ref No NOT in Pending for Resubmit status
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Recommendation |
    Then The Ref No shoud contain download icon in SPF Tracking Summary
      | ALL ROWS |
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Recommendation          |
      | Pending for Deliberation Submission |
    Then The Ref No shoud contain download icon in SPF Tracking Summary
      | ALL ROWS |
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
      | Pending for SRC Secretary Review    |
    Then The Ref No shoud contain download icon in SPF Tracking Summary
      | ALL ROWS |
    When I select 'Status:' in SPF Tracking Summary
      | Pending for SRC Secretary Review |
      | Completed Deliberation           |
    Then The Ref No shoud contain download icon in SPF Tracking Summary
      | ALL ROWS |
    When I select 'Status:' in SPF Tracking Summary
      | Completed Deliberation                |
      | Deleted No Recommendations with Error |
    Then The Ref No shoud contain download icon in SPF Tracking Summary
      | ALL ROWS |

  #Priority 2
  @425241
  Scenario: Stock Proposal Ref No will be displayed and included hyperlink when Stock Proposal is submitted
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I change the number of data rows in table into '5'
    When I get all data of column 'Stock Proposal Ref No' in Stock Proposal Summary
    Then I verify the Stock Proposal Ref No to follow format 'SPF/year/code' in SPF Tracking Summary

  #Priority 2
  @425243
  Scenario: On the SPF tracking summary, when OPU Engineer re-submit the 'Materio No',  there will have a Sub Reference No by clicking on the expand arrow
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    And Child ref no should be displayed when click to expand icon of parent ref no in SPF Tracking Summary

  #Priority 2
  @425264
  Scenario: OPU Engineer can filter on [SPF Ref No] column by Search box
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I search for 'M047' in search bar
    Then Column in table should have data match with expected result
      | Column                | Operator | Expected |
      | Stock Proposal Ref No | CONTAINS | M047     |

  #Priority 2
  @425265
  Scenario: OPU Engineer can filter on [Plant Code - Plant Name] column
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Plant Code - Plant Name:' in SPF Tracking Summary
      | M047 - PC Fertilizer Kedah |
    Then Column in table should have data match with expected result
      | Column                  | Operator | Expected                   |
      | Plant Code - Plant Name | EQUALS   | M047 - PC Fertilizer Kedah |

  #Priority 2
  @425266
  Scenario: OPU Engineer can filter on [Requester Name] column
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Requester Name:' in SPF Tracking Summary
      | Stag.SSO02 |
    Then Column in table should have data match with expected result
      | Column         | Operator | Expected   |
      | Requester Name | EQUALS   | Stag.SSO02 |

  #Priority 2
  @425267
  Scenario: OPU Engineer can filter on [SPF Submission Date] column by using date picker
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' tab
    And I select 'M097 - PPTSB Aromatics' Plan Code - Plan Name
    And I create new random number for Material No
    And I input data into fields in SPF Submission
      | Material No         | Lead Time | Estimated Unit Price |
      | Global-RANDOM_MATNO |        10 |                 1000 |
    And I click on 'Submit' button
    And I click on 'OK' button
    And I click on 'Submit' button
    And I click on 'OK' button
    And I wait and get the Ref No of new SPF Submission
    And I go to site 'MMW - Initial Spare Landing Page'
    When I select 'current date' in 'SPF Submission Date' filter in SPF Tracking Summary
    Then Column in table should have data match with expected result
      | Column              | Operator | Expected              |
      | SPF Submission Date | EQUALS   | Date Time-dd MMM yyyy |

  #Priority 2
  @425268
  Scenario: OPU Engineer can filter on [Deliberation Submission Date] column by using date picker
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I search for 'SPF/2023/M047/017' in search bar
    And I select 'Jul 31, 2023' in 'Deliberation Submission Date' filter in SPF Tracking Summary
    Then Column in table should have data match with expected result
      | Column                       | Operator | Expected    |
      | Deliberation Submission Date | EQUALS   | 31 Jul 2023 |

  #Priority 2
  @428911
  Scenario: On the SPF tracking summary, the Total Submitted Material for Recommendation/ Delibration will be shown as " total Recommendation Material/--" when it is in status: Pending For Deliberation
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
    Then Column in table should have data match with expected result
      | Column                                                   | Operator | Expected |
      | Total Submitted Material for Recommendation/Deliberation | CONTAINS | /--      |

  #Priority 2
  @428947
  Scenario: [iSpare Landing page] On the SPF tracking summary, the Resubmit button will appear from 1st of second month when SPF submission is submitted after 16th of this month
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Resubmit |
    And I change the number of data rows in table into '5'
    Then All records with resubmit status should contain resubmit button if more than 16 days

  #Priority 2
  @428948
  Scenario: OPU Engineer can filter on [Status] column
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column | Expected                            |
      | Status | PENDING FOR DELIBERATION SUBMISSION |
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
      | Pending for SRC Secretary Review    |
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column | Expected                         |
      | Status | PENDING FOR SRC SECRETARY REVIEW |

  #Priority 2
  @429130
  Scenario: [iSpare Landing page] On the SPF tracking summary, the Delibration Submission Date will show blank when the Ref No in Deleted No Recommendations with Error status
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Deleted No Recommendations with Error |
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column                       | Expected |
      | Deliberation Submission Date |          |
