@US29
Feature: General Data Validation Problem

  #Priority 2
  @442007
  Scenario: [Catalogue Profile - P64] Select record(s) by checkbox then click on "Export to Excel" button, verify it should only export selected record into excel file
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Catalogue Profile - P64' button
    And I select first 5 record options in the list
    #When I select all ref no in the Stock Proposal Report page
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p64_catalogue_profile_p64.xlsx' should be downloaded
    When I convert data of table into list map 'SELECTED_DATA_FROM_UI' with format 'SELECTED_DATA'
    #And I convert excel file 'p64_catalogue_profile_p64' with sheet name '' into list map
    And I convert excel file 'p64_catalogue_profile_p64' with index 0 into list map
    And I reverse order of the list 'LIST_MAP_FROM_EXCEL'
    Then I compare two list map 'SELECTED_DATA_FROM_UI' and 'LIST_MAP_FROM_EXCEL' with column below
      | list1       | list2       |
      | Cat. Prof.  | Cat. Prof.  |
      | Text        | Text        |
      | Cat. Type   | Cat. Type   |
      | Code group  | Code group  |
      | Code group2 | Code group2 |
      | Code        | Code        |
      | Description | Description |
      | Usage       | Usage       |
      | Created by  | Created by  |
      | Create date | Create date |
      | Changed by  | Changed by  |
      | Changed on  | Changed on  |
      | Remarks     | Remarks     |
    When I delete the data file 'p64_catalogue_profile_p64.xlsx' in the directory '/Data/Data Download/'

  #Priority 2
  @442083
  Scenario: [Damage Code - P30] Select record(s) by checkbox then click on "Export to Excel" button, verify it should only export selected record into excel file
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Damage Code - P30' button
    And I select first 5 record options in the list
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-damagecode_p30_catalogue_profile_damagecode_p30.xlsx' should be downloaded
    When I convert data of table into list map 'SELECTED_DATA_FROM_UI' with format 'SELECTED_DATA'
    And I convert excel file 'damagecode_p30_catalogue_profile_damagecode_p30' with index 0 into list map
    And I reverse order of the list 'LIST_MAP_FROM_EXCEL'
    Then I compare two list map 'SELECTED_DATA_FROM_UI' and 'LIST_MAP_FROM_EXCEL' with column below
      | list1                       | list2                       |
      | Catalog Profile             | Catalog Profile             |
      | Catalog Profile Description | Catalog Profile Description |
      | Catalog                     | Catalog                     |
      | Damage                      | Damage                      |
      | Damage Description          | Damage Description          |
      | Code                        | Code                        |
      | Code Description            | Code Description            |
    When I delete the data file 'damagecode_p30_catalogue_profile_damagecode_p30.xlsx' in the directory '/Data/Data Download/'

  #Priority 2
  @442118
  Scenario: [Object Part Code - P30] Select record(s) by checkbox then click on "Export to Excel" button, verify it should only export selected record into excel file
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Object Part Code - P30' button
    And I select first 5 record options in the list
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-objectpart_p30_catalogue_profile_objectpart_p30.xlsx' should be downloaded
    When I convert data of table into list map 'SELECTED_DATA_FROM_UI' with format 'SELECTED_DATA'
    And I convert excel file 'objectpart_p30_catalogue_profile_objectpart_p30' with index 0 into list map
    And I reverse order of the list 'LIST_MAP_FROM_EXCEL'
    Then I compare two list map 'SELECTED_DATA_FROM_UI' and 'LIST_MAP_FROM_EXCEL' with column below
      | list1                       | list2                       |
      | Catalog Profile             | Catalog Profile             |
      | Catalog Profile Description | Catalog Profile Description |
      | Catalog                     | Catalog                     |
      | ObjectPart                  | ObjectPart                  |
      | ObjectPart Description      | ObjectPart Description      |
      | Code                        | Code                        |
      | Code Description            | Code Description            |
    When I delete the data file 'objectpart_p30_catalogue_profile_objectpart_p30.xlsx' in the directory '/Data/Data Download/'

  #Priority 2
  @442241
  Scenario: "Company & Plant Code List" detail page: Verify it should prompt to export excel file as defined format after click on "Export to Excel" button
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P30' button
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'p30_CompanyCode-Plant.xlsx' should be downloaded
    When I click on 'P64' button
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'p64_CompanyCode-Plant.xlsx' should be downloaded

  #Priority 2
  @442243
  Scenario: "Company & Plant Code List" detail page: Select record(s) by checkbox then click on "Export to Excel" button, verify it should only export selected record into excel file
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P30' button
    And I select first 5 record options in the list
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p30_CompanyCode-Plant.xlsx' should be downloaded
    When I convert data of table into list map 'SELECTED_DATA_FROM_UI' with format 'SELECTED_DATA'
    And I convert excel file 'p30_CompanyCode-Plant' with index 0 into list map
    And I reverse order of the list 'LIST_MAP_FROM_EXCEL'
    Then I compare two list map 'SELECTED_DATA_FROM_UI' and 'LIST_MAP_FROM_EXCEL' with column below
      | list1                   | list2                   |
      | Company Code            | Company Code            |
      | Company Description     | Company Description     |
      | Planning Plant          | Planning Plant          |
      | Maintenance Plant       | Maintenance Plant       |
      | Plant Description       | Plant Description       |
      | Plant Short Description | Plant Short Description |
      | Region                  | REGION                  |
    When I delete the data file 'p30_CompanyCode-Plant.xlsx' in the directory '/Data/Data Download/'
    And I click on 'P64' button
    And I select first 5 record options in the list
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p64_CompanyCode-Plant.xlsx' should be downloaded
    When I convert data of table into list map 'SELECTED_DATA_FROM_UI' with format 'SELECTED_DATA'
    And I convert excel file 'p64_CompanyCode-Plant' with index 0 into list map
    And I reverse order of the list 'LIST_MAP_FROM_EXCEL'
    Then I compare two list map 'SELECTED_DATA_FROM_UI' and 'LIST_MAP_FROM_EXCEL' with column below
      | list1                   | list2                   |
      | Company Code            | Company Code            |
      | Company Description     | Company Description     |
      | Planning Plant          | Planning Plant          |
      | Maintenance Plant       | Maintenance Plant       |
      | Plant Description       | Plant Description       |
      | Plant Short Description | Plant Short Description |
      | Region                  | REGION                  |
    When I delete the data file 'p64_CompanyCode-Plant.xlsx' in the directory '/Data/Data Download/'

  #Priority 2
  @466192
  Scenario: [Company & Plant Code List][P64] System should display error message when user upload excel file combines existing data
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p64_CompanyCode-Plant.xlsx' should be downloaded
    When I press button to refresh the website
    And I click on 'P64' button
    When I upload 'Download-p64_CompanyCode-Plant.xlsx' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466219
  Scenario: [Abbreviations][Upload Bulk Amentmend] System should display error message when user upload file combine duplictae data in "Corrected Word" column
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Abbreviations' in search bar
    And I click to SPF Ref No 'General Data-Abbreviations' in the SPF Tracking Summary table
    Then 'Abbreviations' page title should be displayed
    #Edit data
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name     | Data |
      | WORDS          | abc  |
      | CORRECTED WORD | abc  |
    And I click on 'Submit' button
    When I upload 'Abbreviations to be filled.xlsx' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466244
  Scenario: [Company & Plant Code List][P30] System should displayed new data when user upload excel file with only a valid row
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P30' button
    And I delete all Company Code '0499' in the General Data List
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p30_CompanyCode-Plant.xlsx' should be downloaded
    When I delete all data in the 'p30_CompanyCode-Plant.xlsx' file
    And I add data to new row in the excel file 'p30_CompanyCode-Plant.xlsx'
      |                      0499 |
      | PET. Chem. Fert. Sabah SB |
      | M237                      |
      | M237                      |
      | PCG - PC Fertiliser Sabah |
      | PCG - PC Fertiliser Sabah |
      | EAST MALAYSIA             |
    And I press button to refresh the website
    And I upload 'Download-p30_CompanyCode-Plant.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    When I delete all Company Code '0499' in the General Data List

  #Priority 2
  @466245
  Scenario: [Company & Plant Code List][P30] System should only display new data when user upload a file combines existing data and new data
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P30' button
    And I delete all Company Code '0499' in the General Data List
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p30_CompanyCode-Plant.xlsx' should be downloaded
    When I add data to new row in the excel file 'p30_CompanyCode-Plant.xlsx'
      |                      0499 |
      | PET. Chem. Fert. Sabah SB |
      | M237                      |
      | M237                      |
      | PCG - PC Fertiliser Sabah |
      | PCG - PC Fertiliser Sabah |
      | EAST MALAYSIA             |
    And I press button to refresh the website
    And I upload 'Download-p30_CompanyCode-Plant.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    When I delete all Company Code '0499' in the General Data List

  #Priority 2
  @466246
  Scenario: [Company & Plant Code List][P30] System should display error message when user upload excel file combine existing data
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P30' button
    And I delete all Company Code '0499' in the General Data List
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p30_CompanyCode-Plant.xlsx' should be downloaded
    When I update 1 row of the excel file 'p30_CompanyCode-Plant.xlsx' with value from column 1
      | PET. Chem. Fert. Sabah SB |
      | M237                      |
      | M237                      |
      | PCG - PC Fertiliser Sabah |
      | PCG - PC Fertiliser Sabah |
      | EAST MALAYSIA             |
    And I press button to refresh the website
    And I upload 'Download-p30_CompanyCode-Plant.xlsx' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed
    When I delete all Company Code '0499' in the General Data List

  #Priority 2
  @466247
  Scenario: [Company & Plant Code List][P64] System should displayed new data when user upload excel file with only a valid row
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    And I delete all Company Code '0499' in the General Data List
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p64_CompanyCode-Plant.xlsx' should be downloaded
    When I delete all data in the 'p64_CompanyCode-Plant.xlsx' file
    And I add data to new row in the excel file 'p64_CompanyCode-Plant.xlsx'
      |                      0499 |
      | PET. Chem. Fert. Sabah SB |
      | M237                      |
      | M237                      |
      | PCG - PC Fertiliser Sabah |
      | PCG - PC Fertiliser Sabah |
      | EAST MALAYSIA             |
    And I press button to refresh the website
    And I upload 'Download-p64_CompanyCode-Plant.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    When I delete all Company Code '0499' in the General Data List

  #Priority 2
  @466248
  Scenario: [Company & Plant Code List][P64 System should only display new data when user upload a file combines existing data and new data
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P30' button
    And I delete all Company Code '0499' in the General Data List
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p64_CompanyCode-Plant.xlsx' should be downloaded
    When I add data to new row in the excel file 'p64_CompanyCode-Plant.xlsx'
      |                      0499 |
      | PET. Chem. Fert. Sabah SB |
      | M237                      |
      | M237                      |
      | PCG - PC Fertiliser Sabah |
      | PCG - PC Fertiliser Sabah |
      | EAST MALAYSIA             |
    When I update 1 row of the excel file 'p64_CompanyCode-Plant.xlsx' with value from column 1
      | PET. Chem. Fert. Sabah SB |
      | M237                      |
      | M237                      |
      | PCG - PC Fertiliser Sabah |
      | PCG - PC Fertiliser Sabah |
      | EAST MALAYSIA             |
    And I press button to refresh the website
    And I upload 'Download-p64_CompanyCode-Plant.xlsx' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed
    When I delete all Company Code '0499' in the General Data List

  #Priority 2
  @466255
  Scenario: [Failure words][Bulk Amentmend] UI header columns should match with header in excel file
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Failure words' in search bar
    And I click on 'General Data-Failure words' link
    Then 'Failure Words' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-failure_words.csv' should be downloaded
    Then File 'failure_words.csv' in '/Data/Data Download/' should have header match with expected
      | failure_word  |
      | standard_word |
    When I delete the data file 'failure_words.csv' in the directory '/Data/Data Download/'

  #Priority 2
  @466256
  Scenario: [Failure words][Upload Bulk Amentmend] System should display notification message when user add new data in excel and upload into system
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Failure words' in search bar
    And I click on 'General Data-Failure words' link
    Then 'Failure Words' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-failure_words.csv' should be downloaded
    When I replace all data in csv file 'failure_words.csv' with new data in directory '/Data/Data Download/'
      | aaa;bbb |
    And I upload 'Download-failure_words.csv' file to the website
    Then An alert with text 'The newly inputted data are updated. You can amend or delete the records from frontend screen.' should be displayed
    And I search for 'aaa' in search bar
    When I click on button in column of table in ERBS Input
      | Column | Name       |
      | Action | Delete ECA |
    And I click on 'Ok' button

  #Priority 2
  @466257
  Scenario: [Failure words][Upload Bulk Amentmend] System should display error message when user upload file combine duplictae data in "Failure Word" column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Failure words' in search bar
    And I click on 'General Data-Failure words' link
    Then 'Failure Words' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-failure_words.csv' should be downloaded
    When I add new data row into csv file 'failure_words.csv' in directory '/Data/Data Download/'
      | TC466257;haha |
      | TC466257;huhu |
    And I upload 'Download-failure_words.csv' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466258
  Scenario: [Failure words][Upload Bulk Amentmend] System should display error message when user upload file combine duplictae data in "Standard Word" column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Failure words' in search bar
    And I click on 'General Data-Failure words' link
    Then 'Failure Words' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-failure_words.csv' should be downloaded
    When I add new data row into csv file 'failure_words.csv' in directory '/Data/Data Download/'
      | zxc;testing |
      | aaa;testing |
    And I upload 'Download-failure_words.csv' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466264
  Scenario: [Compiled words check][Bulk Amentmend] UI header columns should match with header in excel file
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Compiled words check' in search bar
    And I click on 'General Data-Compiled words check' link
    Then 'Compiled Words Check' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-compiled_words_check.csv' should be downloaded
    Then File 'compiled_words_check.csv' in '/Data/Data Download/' should have header match with expected
      | word      |
      | variation |
    When I delete the data file 'compiled_words_check.csv' in the directory '/Data/Data Download/'

  #Priority 2
  @466265
  Scenario: [Compiled words check][Upload Bulk Amentmend] System should display notification message when user add new data in excel and upload into system
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Compiled words check' in search bar
    And I click on 'General Data-Compiled words check' link
    Then 'Compiled Words Check' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-compiled_words_check.csv' should be downloaded
    When I replace all data in csv file 'compiled_words_check.csv' with new data in directory '/Data/Data Download/'
      | aaa;bbb |
    And I upload 'Download-compiled_words_check.csv' file to the website
    Then An alert with text 'The newly inputted data are updated. You can amend or delete the records from frontend screen.' should be displayed
    When I search for 'aaa' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I click on button in column of table in ERBS Input
      | Column | Name       |
      | Action | Delete ECA |
    And I click on 'Ok' button

  #Priority 2
  @466266
  Scenario: [Compiled words check][Upload Bulk Amentmend] System should display error message when user upload file combine duplictae data in "Failure Word" column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Compiled words check' in search bar
    And I click on 'General Data-Compiled words check' link
    Then 'Compiled Words Check' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-compiled_words_check.csv' should be downloaded
    When I add new data row into csv file 'compiled_words_check.csv' in directory '/Data/Data Download/'
      | zxc;haha |
      | aaa;haha |
    And I upload 'Download-compiled_words_check.csv' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466267
  Scenario: [Compiled words check][Upload Bulk Amentmend] System should display error message when user upload file combine duplictae data in "Standard Word" column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Compiled words check' in search bar
    And I click on 'General Data-Compiled words check' link
    Then 'Compiled Words Check' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-compiled_words_check.csv' should be downloaded
    When I add new data row into csv file 'compiled_words_check.csv' in directory '/Data/Data Download/'
      | zxc;hehe |
      | zxc;hihi |
    And I upload 'Download-compiled_words_check.csv' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466273
  Scenario: [Abbreviations][Bulk Amentmend] UI header columns should match with header in excel file
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Abbreviations' in search bar
    And I click on 'General Data-Abbreviations' link
    Then 'Abbreviations' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-Abbreviations to be filled.csv' should be downloaded
    Then File 'Abbreviations to be filled.csv' in '/Data/Data Download/' should have header match with expected
      | words          |
      | corrected_word |
    When I delete the data file 'Abbreviations to be filled.csv' in the directory '/Data/Data Download/'

  #Priority 2
  @466274
  Scenario: [Abbreviations][Upload Bulk Amentmend] System should display notification message when user add new data in excel and upload into system
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Abbreviations' in search bar
    And I click on 'General Data-Abbreviations' link
    Then 'Abbreviations' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-Abbreviations to be filled.csv' should be downloaded
    When I replace all data in csv file 'Abbreviations to be filled.csv' with new data in directory '/Data/Data Download/'
      | aaa;bbb |
    And I upload 'Download-Abbreviations to be filled.csv' file to the website
    Then An alert with text 'The newly inputted data are updated. You can amend or delete the records from frontend screen.' should be displayed
    When I search for 'aaa' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I click on button in column of table in ERBS Input
      | Column | Name       |
      | Action | Delete ECA |
    And I click on 'Ok' button

  #Priority 2
  @466275
  Scenario: [Abbreviations][Upload Bulk Amentmend] System should display error message when user upload file combine duplictae data in "Words" column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Abbreviations' in search bar
    And I click on 'General Data-Abbreviations' link
    Then 'Abbreviations' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-compiled_words_check.csv' should be downloaded
    When I add new data row into csv file 'compiled_words_check.csv' in directory '/Data/Data Download/'
      | zxc;hehe |
      | zxc;hihi |
    And I upload 'Download-compiled_words_check.csv' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466278
  Scenario: [Msel assemblies][Edit] System should display error message when user input invalid data into "Material No." column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Msel assemblies' in search bar
    And I click on 'General Data-Msel assemblies' link
    Then 'Msel Assemblies' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name   | Data     |
      | MATERIAL NO. | abcdabcd |
    Then The text message 'Invalid data input!' should 'display' in the website

  #Priority 2
  @466282
  Scenario: [Msel assemblies][Bulk Amentmend] UI header columns should match with header in excel file
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Msel assemblies' in search bar
    And I click on 'General Data-Msel assemblies' link
    Then 'Msel Assemblies' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-msel_assemblies.csv' should be downloaded
    Then File 'msel_assemblies.csv' in '/Data/Data Download/' should have header match with expected
      | material_no   |
      | material_desc |
    When I delete the data file 'msel_assemblies.csv' in the directory '/Data/Data Download/'

  #Priority 2
  @466283
  Scenario: [Msel assemblies][Upload Bulk Amentmend] System should display notification message when user upload file combine new data and existing data
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Msel assemblies' in search bar
    And I click on 'General Data-Msel assemblies' link
    Then 'Msel Assemblies' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-msel_assemblies.csv' should be downloaded
    When I replace all data in csv file 'msel_assemblies.csv' with new data in directory '/Data/Data Download/'
      | 50029899;O-RING,P572536009,PUMP,STOPOM,254.5MM |
    And I upload 'Download-msel_assemblies.csv' file to the website
    Then An alert with text 'The newly inputted data are updated. You can amend or delete the records from frontend screen.' should be displayed
    When I search for 'aaa' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I click on button in column of table in ERBS Input
      | Column | Name       |
      | Action | Delete ECA |
    And I click on 'Ok' button

  #Priority 2
  @466284
  Scenario: [Msel assemblies][Upload Bulk Amentmend] System should display error message when user upload file only combine exiisting Material No.
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Msel assemblies' in search bar
    And I click on 'General Data-Msel assemblies' link
    Then 'Msel Assemblies' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-msel_assemblies.csv' should be downloaded
    When I add new data row into csv file 'msel_assemblies.csv' in directory '/Data/Data Download/'
      | 50708112;GASKET,SW,14"150,316L,CRBGRP,NI,CS |
    And I upload 'Download-msel_assemblies.csv' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466286
  Scenario: [Valve Assemblies][Edit] System should display error message when user input invalid data into "Material No." column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Valve assemblies' in search bar
    And I click on 'General Data-Valve assemblies' link
    Then 'Valve Assemblies' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name   | Data     |
      | MATERIAL NO. | zxczxczx |
    Then The text message 'Invalid data input!' should 'display' in the website

  #Priority 2
  @466290
  Scenario: [Valve Assemblies][Bulk Amentmend] UI header columns should match with header in excel file
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Valve assemblies' in search bar
    And I click on 'General Data-Valve assemblies' link
    Then 'Valve Assemblies' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-valve_assemblies.csv' should be downloaded
    Then File 'valve_assemblies.csv' in '/Data/Data Download/' should have header match with expected
      | material_no   |
      | material_desc |
    When I delete the data file 'valve_assemblies.csv' in the directory '/Data/Data Download/'

  #Priority 2
  @466291
  Scenario: [Valve Assemblies][Upload Bulk Amentmend] System should display notification message  when user upload a excel file combine new and existing data
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Valve assemblies' in search bar
    And I click on 'General Data-Valve assemblies' link
    Then 'Valve Assemblies' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-valve_assemblies.csv' should be downloaded
    When I replace all data in csv file 'valve_assemblies.csv' with new data in directory '/Data/Data Download/'
      | 50232940;REPAIR KIT,R64RX000012,REG,FISHER,630 |
    And I upload 'Download-valve_assemblies.csv' file to the website
    Then An alert with text 'The newly inputted data are updated. You can amend or delete the records from frontend screen.' should be displayed
    When I search for 'aaa' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I click on button in column of table in ERBS Input
      | Column | Name       |
      | Action | Delete ECA |
    And I click on 'Ok' button

  #Priority 2
  @466292
  Scenario: [Valve Assemblies][Upload Bulk Amentmend] System should display error message pop-up when user upload file only combine existing data in Material No. column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Valve assemblies' in search bar
    And I click on 'General Data-Valve assemblies' link
    Then 'Valve Assemblies' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-valve_assemblies.csv' should be downloaded
    When I add new data row into csv file 'valve_assemblies.csv' in directory '/Data/Data Download/'
      | 50771996;GASKET,SPW,12B6027X012,GLBVLV,FISHER,HPT |
    And I upload 'Download-valve_assemblies.csv' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466293
  Scenario: [Equipment sensitive to Content] Verify the layout of Equipment sensitive to Content screen
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Equipment sensitivity to content' in search bar
    And I click on 'General Data-Equipment sensitivity to content' link
    Then 'Equipment Sensitivity To Content' page title should be displayed
    And The Breadcrumb should be displayed as 'Home > ERBS Input Data > General Input Data Maintenance > Equipment Sensitivity To Content'
    And The button 'Bulk Amendment' should be 'displayed'
    And The 'Upload Bulk Amendment' button should be displayed on the screen
    And I should see input field 'Search by keyword' is displayed
    And Icon 'RestartAltOutlinedIcon' should be displayed in the website
    And I should see button 'Go to previous page' is 'disabled'
    And I should see button 'Go to first page' is 'disabled'
    And I should see button 'Go to next page' is 'enabled'
    And I should see button 'Go to last page' is 'enabled'
    And Toggle 'Yes,No' should be displayed

  #Priority 2
  @466294
  Scenario: [Equipment sensitive to Content][Edit] User is only able to edit data for Sensitive to Content
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Equipment Sensitivity To Content' in search bar
    And I click on 'General Data-Equipment sensitivity to content' link
    Then 'Equipment Sensitivity To Content' page title should be displayed
    And Sensitive to content column in Equipment Sensitive page should contain toggle button

  #Priority 2
  @466296
  Scenario: [Chemicals affecting equipment][Bulk Amendment] UI header column should match with header column in excel file
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Chemicals affecting equipment' in search bar
    And I click on 'General Data-Chemicals affecting equipment' link
    Then 'Chemicals Affecting Equipment' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-Chemicals Affecting Equipment.csv' should be downloaded
    Then File 'Chemicals Affecting Equipment.csv' in '/Data/Data Download/' should have header match with expected
      | contents |
    When I delete the data file 'Chemicals Affecting Equipment.csv' in the directory '/Data/Data Download/'

  #Priority 2
  @466300
  Scenario: [Chemicals affecting equipment][Upload Bulk Amentmend] System should display error message  when user upload excel file only combine existing data in Contents column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Chemicals affecting equipment' in search bar
    And I click on 'General Data-Chemicals affecting equipment' link
    Then 'Chemicals Affecting Equipment' page title should be displayed
    When I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-Abbreviations to be filled.csv' should be downloaded
    When I replace all data in csv file 'Chemicals Affecting Equipment.csv' with new data in directory '/Data/Data Download/'
      | testing |
    And I upload 'Download-Abbreviations to be filled.csv' file to the website
    Then An alert with text 'Data are duplicated in Database' should be displayed
