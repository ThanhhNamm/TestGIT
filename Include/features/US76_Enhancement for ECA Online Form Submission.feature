@US76
Feature: Enhancement ECA Online Form Submission

  #Priority 2
  @670807
  Scenario: [US76][Upload ECA] Valid FL should be able to display in ECA View / Amendment screen when user upload ECA file which contain non exist FL
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I select 'Plant Code - Plant Name:' in SPF Tracking Summary
      | M227 - PRPC UF |
    And I click to SPF Ref No 'ECA_ECA-M227-PRPC UF.xlsm' in the SPF Tracking Summary table
    Then 'ECA View / Amendment' page title should be displayed
    #Delete valid data
    When I search for 'CCR102-OWS-108' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I select checkboxes in Column Option
      | ECONOMIC    |
      | CONSEQUENCE |
    And I click on 'Apply Changes' button
    And I click on button in column of table in ERBS Input
      | Column | Name       |
      | Action | Delete ECA |
    And I click on 'Ok' button
    #Back to ECA
    And I naviagte to page in breadcrumb 'ECA Online Form Submission (ECA)'
    Then 'ECA Online Form Submission' page title should be displayed
    When I upload 'ECA M227 non exist and valid.xlsm' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    Then A pop-up name 'Error Data' should be 'displayed' as design
    And Pop-up name 'Error Data' should have data with error remark
      | Function | Error       |
      | abcxyz   | Not existed |
    When I click on 'OK' button
    Then A 'Confirmation' alert should be 'displayed'
    When I click on 'Ok' button
    And I select 'Plant Code - Plant Name:' in SPF Tracking Summary
      | M227 - PRPC UF |
    And I click to SPF Ref No 'ECA_ECA-M227-PRPC UF.xlsm' in the SPF Tracking Summary table
    And I search for 'CCR102-OWS-108' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I search for 'abcxyz' in search bar
    Then The text message 'No data to show.' should 'display' in the website

  #Priority 2
  @670811
  Scenario: [US76][Upload ECA] Valid FL should be able to display in ECA View / Amendment screen when user upload ECA file which contain duplicated FL
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I select 'Plant Code - Plant Name:' in SPF Tracking Summary
      | M227 - PRPC UF |
    And I click to SPF Ref No 'ECA_ECA-M227-PRPC UF.xlsm' in the SPF Tracking Summary table
    Then 'ECA View / Amendment' page title should be displayed
    #Delete valid data
    When I search for 'CCR102-OWS-108' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I select checkboxes in Column Option
      | ECONOMIC    |
      | CONSEQUENCE |
    And I click on 'Apply Changes' button
    And I click on button in column of table in ERBS Input
      | Column | Name       |
      | Action | Delete ECA |
    And I click on 'Ok' button
    #Back to ECA
    And I naviagte to page in breadcrumb 'ECA Online Form Submission (ECA)'
    Then 'ECA Online Form Submission' page title should be displayed
    When I upload 'ECA M227 duplicate and valid.xlsm' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    Then A pop-up name 'Error Data' should be 'displayed' as design
    And Pop-up name 'Error Data' should have data with error remark
      | Function     | Error      |
      | 4155TE-6307A | Duplicated |
    When I click on 'OK' button
    Then A 'Confirmation' alert should be 'displayed'
    When I click on 'Ok' button
    And I select 'Plant Code - Plant Name:' in SPF Tracking Summary
      | M227 - PRPC UF |
    And I click to SPF Ref No 'ECA_ECA-M227-PRPC UF.xlsm' in the SPF Tracking Summary table
    And I search for 'CCR102-OWS-108' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I search for '4155TE-6307A' in search bar
    Then 1 rows in the table should be corresponding to the show option

  #Priority 2
  @681484
  Scenario: It should have error message when user uploaded ECA file without fill in Equipment Validity column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I upload 'ECA-M179-MENARA Dayabumi.xlsm.xlsx' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    Then A pop-up name 'Uploading ECA was unsuccessful. Please check your Mandatory Field!' should be 'displayed' as design in ECA Online Form Submission page

  #Priority 2
  @681539
  Scenario: It should have error message when user uploaded ECA file without fill in RBI Consequence or IPF Consequence or CONSEQUENCE (Economic, H&S, Environment, Reputation)
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed
    When I upload 'ECA-M236-RGT (SU) Sdn Bhd.xlsm.xlsx' file to the website
    And I wait until the loading icon in 'ECA Online Form Submission' page is closed
    Then A pop-up name 'Uploading ECA was unsuccessful. You need to fill in either' should be 'displayed' as design in ECA Online Form Submission page
