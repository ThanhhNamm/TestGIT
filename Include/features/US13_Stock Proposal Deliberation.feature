@US13
Feature: Stock Proposal Deliberation

  @433160
  Scenario: The Stock Proposal deliberation screen will display when SRC User clicks on any Ref No on Stock Proposal Summary table
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed

  @433161
  Scenario: The Stock Proposal deliberation screen will display when SRC User clicks on Go To Deliberation button of Stock Proposal Summary screen
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    And The button 'Go for Deliberation' should be 'disabled'
    When I select all ref no in the Stock Proposal Report page
    Then The button 'Go for Deliberation' should be 'enabled'
    When I click on 'Go for Deliberation' button
    Then 'Stock Proposal Deliberation' page title should be displayed

  @433163
  Scenario: SRC User can key in the SRC Seating No text box of any Material No which is NOT endorsed/Rejected
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    And The button 'Go for Deliberation' should be 'disabled'
    When I select all ref no in the Stock Proposal Report page
    Then The button 'Go for Deliberation' should be 'enabled'
    When I click on 'Go for Deliberation' button
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I input 'valid' number into SRC Seating No
    Then Message should 'not display' when a number is input into SRC Seating No

  @433174
  Scenario: User can endorse multi Material with same Remark
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I input 'valid' number into SRC Seating No
    Then Message should 'not display' when a number is input into SRC Seating No
    When I select all ref no in the Stock Proposal Report page
    And I input data into first row of table with Endorsement 'Endorse'
      | Column              | Value |
      | OEM Min             |     1 |
      | OEM Max             |    10 |
      | Endorsed Min        |     1 |
      | Endorsed Max        |    10 |
      | Endorsement remarks | Test  |
    And I press button to refresh the website
    And I select first 1 record options in the list
    Then Data with checkbox in Stock Proposal Deliberation table should 'equal' to value in data table
      | Column       | Value |
      | OEM Min      |     1 |
      | OEM Max      |    10 |
      | Endorsed Min |     1 |
      | Endorsed Max |    10 |

  @433175
  Scenario: User can reject multi Material with same Remark
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I input 'valid' number into SRC Seating No
    Then Message should 'not display' when a number is input into SRC Seating No
    When I select all ref no in the Stock Proposal Report page
    And I input data into first row of table with Endorsement 'Reject'
      | Column              | Value |
      | OEM Min             |     5 |
      | OEM Max             |    99 |
      | Endorsed Min        |     7 |
      | Endorsed Max        |    80 |
      | Endorsement remarks | Test  |
    And I press button to refresh the website
    And I select first 1 record options in the list
    Then Data with checkbox in Stock Proposal Deliberation table should 'equal' to value in data table
      | Column       | Value |
      | OEM Min      |     5 |
      | OEM Max      |    99 |
      | Endorsed Min |     0 |
      | Endorsed Max |     0 |

  #Test case required real data from database, don't run this TC if not neccessary
  @433246
  Scenario: The 'Endorsement' field will displayed the text "Endorsed" when the Material is endorsed
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    When I input 'valid' number into SRC Seating No
    And I input data into first row of table with Endorsement 'Endorse'
      | Column              | Value |
      | OEM Min             |     1 |
      | OEM Max             |    10 |
      | Endorsed Min        |     1 |
      | Endorsed Max        |    10 |
      | Endorsement remarks | Test  |
    Then The button 'Finalize' should be 'enabled'
    When I click on 'Finalize' button
    And I click on 'Finalize' button pop up in Stock Proposal Deliberation
    Then Column in table should have data match with expected result
      | Column      | Operator | Expected |
      | Endorsement | EQUALS   | Endorsed |

  #Test case required real data from database, don't run this TC if not neccessary
  @433247
  Scenario: The 'Endorsement' field will displayed the text "Rejected" when the Material is rejected
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    When I input 'valid' number into SRC Seating No
    And I input data into first row of table with Endorsement 'Reject'
      | Column              | Value |
      | OEM Min             |     1 |
      | OEM Max             |    10 |
      | Endorsed Min        |     1 |
      | Endorsed Max        |    10 |
      | Endorsement remarks | Test  |
    Then The button 'Finalize' should be 'enabled'
    When I click on 'Finalize' button
    And I click on 'Finalize' button pop up in Stock Proposal Deliberation
    Then Column in table should have data match with expected result
      | Column      | Operator | Expected |
      | Endorsement | EQUALS   | Rejected |

  @433255
  Scenario: The ONLY selected option columns is displayed on the Stock Proposal Deliberation table when the options is ticked on Column Option checklist
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    And The button 'Go for Deliberation' should be 'disabled'
    When I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I click on 'Column Option' button
    Then The Column Option pop up should be displayed with 28 selected
      | Options                                   | Status   |
      | Plant Code - Plant Name                   | Selected |
      | Requester                                 | Selected |
      | Category                                  | Selected |
      | Manufacturer                              | Selected |
      | Interchangeable Functional Locations      | Selected |
      | No of Equipments                          | Selected |
      | Material Criticality                      | Selected |
      | Equipment Criticality                     | Selected |
      | Total Consequential Loss(RM)              | Selected |
      | Lead Time(Weeks)                          | Selected |
      | Estimated Unit Price(RM)                  | Selected |
      | Cost of Stocking (RM)                     | Selected |
      | Total Value (RM)                          | Selected |
      | SCE                                       | Selected |
      | Maintenance Strategy                      | Selected |
      | Req. Issuance Qty                         | Selected |
      | Min(User)                                 | Selected |
      | Max(User)                                 | Selected |
      | Justification categorization              | Selected |
      | Requestor Justification                   | Selected |
      | Matching Spare Part Availability (%)      | Selected |
      | Combination                               | Selected |
      | MTBF(Years)                               | Selected |
      | MTBC(Years)                               | Selected |
      | Number of Years for First Failure         | Selected |
      | Total Number of Failures in First 4 Years | Selected |
      | ERBS Min                                  | Selected |
      | ERBS Max                                  | Selected |
    When I click on 'Apply Changes' button
    And I select checkboxes in Column Option
      | Select All              |
      | Plant Code - Plant Name |
      | Requester               |
    And I click on 'Apply Changes' button
    And I click on 'Column Option' button
    Then The Column Option pop up should be displayed with 2 selected
      | Options                                   | Status       |
      | Plant Code - Plant Name                   | Selected     |
      | Requester                                 | Selected     |
      | Category                                  | Not Selected |
      | Manufacturer                              | Not Selected |
      | Interchangeable Functional Locations      | Not Selected |
      | No of Equipments                          | Not Selected |
      | Material Criticality                      | Not Selected |
      | Equipment Criticality                     | Not Selected |
      | Total Consequential Loss(RM)              | Not Selected |
      | Lead Time(Weeks)                          | Not Selected |
      | Estimated Unit Price(RM)                  | Not Selected |
      | Cost of Stocking (RM)                     | Not Selected |
      | Total Value (RM)                          | Not Selected |
      | SCE                                       | Not Selected |
      | Maintenance Strategy                      | Not Selected |
      | Req. Issuance Qty                         | Not Selected |
      | Min(User)                                 | Not Selected |
      | Max(User)                                 | Not Selected |
      | Justification categorization              | Not Selected |
      | Requestor Justification                   | Not Selected |
      | Matching Spare Part Availability (%)      | Not Selected |
      | Combination                               | Not Selected |
      | MTBF(Years)                               | Not Selected |
      | MTBC(Years)                               | Not Selected |
      | Number of Years for First Failure         | Not Selected |
      | Total Number of Failures in First 4 Years | Not Selected |
      | ERBS Min                                  | Not Selected |
      | ERBS Max                                  | Not Selected |
    When I click on 'Apply Changes' button
    Then The table should contain columns with selected status in Column Options
      | Options                                   | Status |
      | Plant Code - Plant Name                   | Yes    |
      | Requester                                 | Yes    |
      | Category                                  | No     |
      | Manufacturer                              | No     |
      | Interchangeable Functional Locations      | No     |
      | No of Equipments                          | No     |
      | Material Criticality                      | No     |
      | Equipment Criticality                     | No     |
      | Total Consequential Loss(RM)              | No     |
      | Lead Time(Weeks)                          | No     |
      | Estimated Unit Price(RM)                  | No     |
      | Cost of Stocking (RM)                     | No     |
      | Total Value (RM)                          | No     |
      | SCE                                       | No     |
      | Maintenance Strategy                      | No     |
      | Req. Issuance Qty                         | No     |
      | Min(User)                                 | No     |
      | Max(User)                                 | No     |
      | Justification categorization              | No     |
      | Requestor Justification                   | No     |
      | Matching Spare Part Availability (%)      | No     |
      | Combination                               | No     |
      | MTBF(Years)                               | No     |
      | MTBC(Years)                               | No     |
      | Number of Years for First Failure         | No     |
      | Total Number of Failures in First 4 Years | No     |
      | ERBS Min                                  | No     |
      | ERBS Max                                  | No     |

  @433256
  Scenario: User can search for Material whose Material No field is included inputted characters is displayed on Stock Proposal Deliberation table
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I select all ref no in the Stock Proposal Report page
    And I click on 'Go for Deliberation' button
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I change the number of data rows in table into '100'
    And I search for '51081' in search bar
    Then Column in table should have data match with expected result
      | Column      | Operator | Expected |
      | Material No | CONTAINS |    51081 |

  @433257
  Scenario: User can search for Material whose Material Description field is included inputted characters is displayed on Stock Proposal Deliberation table
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I select all ref no in the Stock Proposal Report page
    And I click on 'Go for Deliberation' button
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I change the number of data rows in table into '100'
    And I search for 'COMPAR' in search bar
    Then Column in table should have data match with expected result
      | Column               | Operator | Expected |
      | Material Description | CONTAINS | COMPAR   |

  #Priority 2
  @433162
  Scenario: [SPS][SPD] Verify checkbox is not displayed for Material No line item which has value Endorsed or Rejected in 'Endorsement' column
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially |
    And I select all ref no in the Stock Proposal Report page
    Then The button 'Go for Deliberation' should be 'enabled'
    When I click on 'Go for Deliberation' button
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I change the number of data rows in table into '100'
    Then Columns which have been endorsed or rejected should not contain checkbox

  #Priority 2
  @433165
  Scenario: The 'ALL' tab will show the all Material No which is submitted deliberation
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially       |
      | Pending for Deliberation |
      | Completed Endorsement    |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I click on 'ALL' button
    And I get all data of column 'Material No' in Stock Proposal Summary
    And I go back to the 'ISA' page
    And I search for 'Global-RANDOM_REF_NO' in search bar
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed
    And All matertial no in Submission page should be equal with 'COLUMN_LIST'

  #Priority 2
  @433172
  Scenario: On Endorse confirmation pop up, the Endorse button will be enable when Remark field is filled
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially       |
      | Pending for Deliberation |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    When I input 'valid' number into SRC Seating No
    And I input data into first row of table with in Stock Proposal Deliberation
      | Column              | Value |
      | OEM Min             |     1 |
      | OEM Max             |    10 |
      | Endorsed Min        |     1 |
      | Endorsed Max        |    10 |
      | Endorsement remarks | Test  |
    And I click on button in column of table in ERBS Input
      | Column      | Name    |
      | Endorsement | Endorse |
    Then A new pop-up 'Confirmation' should be displayed
    When I input data '' into field 'Endorsement remarks' in pop up Stock Proposal Deliberation
    And I click on 'Endorse' button
    Then A new pop-up 'Confirmation' should be displayed

  #Priority 2
  @433173
  Scenario: On Reject confirmation pop up, the Reject button will be enable when Remark field is filled
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially       |
      | Pending for Deliberation |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    When I input 'valid' number into SRC Seating No
    And I input data into first row of table with in Stock Proposal Deliberation
      | Column              | Value |
      | OEM Min             |     1 |
      | OEM Max             |    10 |
      | Endorsed Min        |     1 |
      | Endorsed Max        |    10 |
      | Endorsement remarks | Test  |
    And I click on button in column of table in ERBS Input
      | Column      | Name   |
      | Endorsement | Reject |
    Then A new pop-up 'Confirmation' should be displayed
    When I input data '' into field 'Endorsement remarks' in pop up Stock Proposal Deliberation
    And I click on 'Reject' button
    Then A new pop-up 'Confirmation' should be displayed

  #Priority 2
  @433177
  Scenario: The Material will update Rejected status in other Catergory when that Material is rejected in any Category
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Completed Endorsement |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I get all data of column 'Material No' in Stock Proposal Summary
    When I get all mat no from table with status
    Then I check all mat no from all tab with other tabs in stock proposal deliberation

  #Priority 2
  @433178
  Scenario: The Stock Proposal Deliberation table will displayed 36 columns (check US)
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially       |
      | Pending for Deliberation |
      | Completed Endorsement    |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    And The order of table headers should be displayed as design
      |                                           |
      | Plant Code - Plant Name                   |
      | Requester                                 |
      | Category                                  |
      | Manufacturer                              |
      | Interchangeable Functional Locations      |
      | No of Equipments                          |
      | Material Criticality                      |
      | Equipment Criticality                     |
      | Total Consequential Loss(RM)              |
      | Lead Time(Weeks)                          |
      | Estimated Unit Price(RM)                  |
      | Cost of Stocking (RM)                     |
      | Total Value (RM)                          |
      | SCE                                       |
      | Maintenance Strategy                      |
      | Req. Issuance Qty                         |
      | Min(User)                                 |
      | Max(User)                                 |
      | Justification categorization              |
      | Requestor Justification                   |
      | Matching Spare Part Availability (%)      |
      | Combination                               |
      | MTBF(Years)                               |
      | MTBC(Years)                               |
      | Number of Years for First Failure         |
      | Total Number of Failures in First 4 Years |
      | ERBS Min                                  |
      | ERBS Max                                  |

  #Priority 2
  @433240
  Scenario: The 'Endorsed Min' field is madatory and will allow User to input free text
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    Then The 'Endorsed Min' column in Stock Proposal Deliberation should be 'mandatory'

  #Priority 2
  @433242
  Scenario: The 'Endorsed Max' field is madatory and will allow User to input free text
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    Then The 'Endorsed Max' column in Stock Proposal Deliberation should be 'mandatory'

  #Priority 2
  @433243
  Scenario: The 'Endorsed Total Value(RM)' field will displayed data as the formula when the Material is endorsed
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I input 'valid' number into SRC Seating No
    Then Message should 'not display' when a number is input into SRC Seating No
    And I select checkboxes in Column Option
      | Select All               |
      | Estimated Unit Price(RM) |
    And I click on 'Apply Changes' button
    And I input data into first row of table with Endorsement 'Endorse'
      | Column              | Value |
      | OEM Min             |     1 |
      | OEM Max             |    10 |
      | Endorsed Min        |     1 |
      | Endorsed Max        |     9 |
      | Endorsement remarks | Test  |
    And I press button to refresh the website
    Then The value of Endorsed Total value column should be Estimated Unit Price multiple Endorsed

  #Priority 2
  @433245
  Scenario: The 'Endorsement' field will displayed 2 buttons: Endorse and Reject when the Material has not endorsed yet
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation |
      | Endorsed Partially       |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    Then Column which is not endorsed or rejected will contain 2 buttons in Endorsement field

  #Priority 2
  @433248
  Scenario: The "Endorsement Remark" list will show existed options when SRC User click on Select dropdown
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I search for 'SPF/2023/M055/030' in search bar
    And I click to SPF Ref No 'SPF/2023/M055/030' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    Then I verify random Endorsement Remark dropdown

  #Priority 2
  @433252 @433253
  Scenario Outline: In database, the Endorsed By field will save the User Name who endorsed the Material No
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially       |
      | Pending for Deliberation |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I input 'valid' number into SRC Seating No
    Then Message should 'not display' when a number is input into SRC Seating No
    When I input data into first row of table with Endorsement '<button>'
      | Column              | Value |
      | OEM Min             |     1 |
      | OEM Max             |    10 |
      | Endorsed Min        |     1 |
      | Endorsed Max        |    10 |
      | Endorsement remarks | Test  |
    Then The first '<status>' row should have user name is 'Stag.SSO05'

    Examples: 
      | status   | button  |
      | endorsed | Endorse |
      | rejected | Reject  |

  #Priority 2
  @433258
  Scenario: User can filter on [Manufacturer] column
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select 'Manufacturer:' in SPF Tracking Summary
      | random |
    Then Column in table should have data match with expected result
      | Column       | Operator | Expected            |
      | Manufacturer | EQUALS   | Global-RANDOM_VALUE |

  #Priority 2
  @433266
  Scenario: User can NOT edit any fields of the Material when that Material is Rejected
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    And I search for 'SPF/2023/M053/072' in search bar
    And I click to SPF Ref No 'SPF/2023/M053/072' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When User not able to input random data into column of Rejected Stock Proposal Deliberation
      | OEM Min             |
      | OEM Max             |
      | Endorsed Min        |
      | Endorsed Max        |
      | Endorsement remarks |

  #Priority 2
  @435567
  Scenario: The option is deleted when User click on "X" icon of that opntion on Endorsement Remark list
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially       |
      | Pending for Deliberation |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    And I select random data in the Endorsement remark column
    And I delete all data in Endorsement remark column
    Then All data in Endorsement remark column should be ''

  #Priority 2
  @435568
  Scenario: The Endorsement Remark list is sorted by Alphabet ascending
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'Stock Proposal Summary' sub Menu
    Then 'Stock Proposal Summary' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Endorsed Partially       |
      | Pending for Deliberation |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'Stock Proposal Deliberation' page title should be displayed
    When I select checkboxes in Column Option
      | Select All |
    And I click on 'Apply Changes' button
    Then Data in the remark list should be sorted by alphabet ascending
