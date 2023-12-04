@US9
Feature: ECA Online Form Submission

  @444455
  Scenario: The file is downloaded successfully when clicking on any download icon of any row
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name     |
      | Action | Download |
    Then New file name 'Global-FILE_NAME' should be downloaded

  @444457
  Scenario: Verify the Last Modified Date field will display accordingly to the change of file
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I upload 'ECA-M162-PCML - PCMET 1.xlsm' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    And I close the confirmation pop up after upload new file in ECA Online Form Submission page
    And I search for 'ECA-M162-PCML - PCMET 1' in search bar
    Then Column in table should have data match with expected result
      | Column                  | Operator | Expected                     |
      | File Name               | EQUALS   | ECA-M162-PCML - PCMET 1.xlsm |
      | Plant Code - Plant Name | EQUALS   | M162 - PCML - PCMET 1        |
      | Last Modified Date      | EQUALS   | Date Time-dd MMM yyyy        |
    When I upload 'ECA-M162-PCML - PCMET 1.xlsm' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    And I close the confirmation pop up after upload new file in ECA Online Form Submission page
    And I search for 'ECA-M162-PCML - PCMET 1' in search bar
    Then Column in table should have data match with expected result
      | Column                  | Operator | Expected                     |
      | File Name               | EQUALS   | ECA-M162-PCML - PCMET 1.xlsm |
      | Plant Code - Plant Name | EQUALS   | M162 - PCML - PCMET 1        |
      | Last Modified Date      | EQUALS   | Date Time-dd MMM yyyy        |

  @444454 @444458 @444441
  Scenario: Verify the Confirmation pop up is displayed when there is dupplicated functional Location in the upload file
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I upload 'ECA-M162-PCML - PCMET 1.xlsm' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    Then A pop-up name 'Error Data' should be 'displayed' as design
    When I click on 'OK' button
    Then A 'Confirmation' alert should be 'displayed'

  #Priority 2
  @444445
  Scenario: User can filter on Company Name column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I select 'company Name:' in SPF Tracking Summary
      | random |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column       | Operator | Expected            |
      | Company Name | EQUALS   | Global-RANDOM_VALUE |

  #Priority 2
  @444447
  Scenario: User can filter on Plant Code-Plant Name column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I select 'Plant Code - Plant Name:' in SPF Tracking Summary
      | random |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column                  | Operator | Expected            |
      | Plant Code - Plant Name | EQUALS   | Global-RANDOM_VALUE |

  #Priority 2
  @444450
  Scenario: User can filter on Last Modified Date column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I upload 'ECA-M162-PCML - PCMET 1.xlsm' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    And I close the confirmation pop up after upload new file in ECA Online Form Submission page
    And I search for 'ECA-M162-PCML - PCMET 1' in search bar
    And I select 'current date' in 'Last Modified Date:' filter in SPF Tracking Summary
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column             | Operator | Expected              |
      | Last Modified Date | CONTAINS | Date Time-dd MMM yyyy |

  #Priority 2
  @444461
  Scenario: The Error Data pop up will display when clicking on the error file name
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I upload 'ECA-M162-PCML - PCMET 1.xlsm' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    Then A pop-up name 'Error Data' should be 'displayed' as design

  #Priority 2
  @444462
  Scenario: The Error Data pop up will display accordingly with 2 fields: Functional Location & Error Remarks
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I upload 'ECA M227 duplicate and non exist.xlsm' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    Then A pop-up name 'Error Data' should be 'displayed' as design
    And Pop-up name 'Error Data' should have data with error remark
      | Function     | Error       |
      | 4155TE-6307B | Duplicated  |
      | 4155TE-6307A | Duplicated  |
      | abnsdbakmd   | Not existed |
    When I click on 'OK' button
    Then A 'Confirmation' alert should be 'displayed'
    When I click on 'Ok' button
