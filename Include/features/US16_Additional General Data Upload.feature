@US16
Feature: Additional General Data Upload

  @441937
  Scenario: [Company & Plant Code List][P30] User click on "Upload" button, it should be able to upload file if column header in file upload match with column header of table in UI
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I delete all Company Code '0499' in the General Data List
    And I upload 'P30_Company and Plant Code List.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    When I press button to refresh the website
    And I select 'Company Code:' in SPF Tracking Summary
      | 0499 |
    Then The text message 'No data to show.' should 'not display' in the website
    When I press button to refresh the website
    And I delete all Company Code '0499' in the General Data List
    And I select 'Company Code:' in SPF Tracking Summary
      | 0499 |
    Then The text message 'No data to show.' should 'display' in the website

  @441939
  Scenario: [Company & Plant Code List][P30] Verify it has filter for those columns
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    And Filters should be displayed in the screen
      | Company Code:      |
      | Planning Plant:    |
      | Maintenance Plant: |

  @441950
  Scenario: [Company & Plant Code List][P30] Verify table should have 9 columns
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    And The order of table headers should be displayed as design
      |                         |
      | Company Code            |
      | Company Description     |
      | Planning Plant          |
      | Maintenance Plant       |
      | Plant Description       |
      | Plant Short Description |
      | Region                  |

  @441998
  Scenario: [Company & Plant Code List][P64] Verify table should have 9 columns
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    Then The order of table headers should be displayed as design
      |                         |
      | Company Code            |
      | Company Description     |
      | Planning Plant          |
      | Maintenance Plant       |
      | Plant Description       |
      | Plant Short Description |
      | Region                  |

  @442010
  Scenario: [Catalogue Profile - P64] User click on "Upload" button, it should be able to upload file if column header in file upload match with column header of table in UI
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
    And I upload 'Catalog Profile_P64.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    And The table in Catalogue Profile should have at least one column contain data 'Catalogue Profile P64' from search box

  @442020
  Scenario: [Catalogue Profile - P64] After click on "Add New" button, verify layout of Add New pop-up
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
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name         | Type    |
      | CAT. PROF.   | Textbox |
      | TEXT         | Textbox |
      | CAT. TYPE    | Textbox |
      | CODE GROUP   | Textbox |
      | CODE GROUP2  | Textbox |
      | CODE         | Textbox |
      | DESCRIPTION  | Textbox |
      | USAGE        | Textbox |
      | CREATED BY   | Textbox |
      | CREATED DATE | Textbox |
      | CHANGED BY   | Textbox |
      | CHANGED ON   | Textbox |
      | REMARKS      | Textbox |
      | Cancel       | Button  |
      | Submit       | Button  |
      | CloseIcon    | Icon    |

  @442024
  Scenario: [Catalogue Profile - P64] Verify table should have 9 columns
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
    Then The order of table headers should be displayed as design
      |             |
      | Action      |
      | Cat. Prof.  |
      | Text        |
      | Cat. Type   |
      | Code group  |
      | Code group2 |
      | Code        |
      | Description |
      | Usage       |
      | Created by  |
      | Create date |
      | Changed by  |
      | Changed on  |
      | Remarks     |

  @442027
  Scenario: [Catalogue Profile - P64] Verify layout of Edit pop-up after click on Edit icon
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
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name         | Type    |
      | CAT. PROF.   | Textbox |
      | TEXT         | Textbox |
      | CAT. TYPE    | Textbox |
      | CODE GROUP   | Textbox |
      | CODE GROUP2  | Textbox |
      | CODE         | Textbox |
      | DESCRIPTION  | Textbox |
      | USAGE        | Textbox |
      | CREATED BY   | Textbox |
      | CREATED DATE | Textbox |
      | CHANGED BY   | Textbox |
      | CHANGED ON   | Textbox |
      | REMARKS      | Textbox |
      | Cancel       | Button  |
      | Submit       | Button  |
      | CloseIcon    | Icon    |

  @442081
  Scenario: [Catalogue Profile - P64] Pagination + Search: Verify record of Previous table in the next page should display correct result and search parameter column should include search word
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
    And I search for 'Automation Testing' in search bar
    Then The table in Catalogue Profile should have at least one column contain data 'Automation Testing' from search box

  @442086
  Scenario: [Damage Code - P30] User click on "Upload" button, it should be able to upload file if column header in file upload match with column header of table in UI
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
    And I upload 'Damage Code_P30.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    And The table in Catalogue Profile should have at least one column contain data 'Damage Code P30' from search box

  @442096
  Scenario: [Damage Code - P30] After click on "Add New" button, verify layout of Add New pop-up
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
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | DAMAGE                      | Textbox |
      | DAMAGE DESCRIPTION          | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |

  @442100
  Scenario: [Damage Code - P30] Verify table should have 9 columns
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
    Then The order of table headers should be displayed as design
      |                             |
      | Action                      |
      | Catalog Profile             |
      | Catalog Profile Description |
      | Catalog                     |
      | Damage                      |
      | Damage Description          |
      | Code                        |
      | Code Description            |

  @442103
  Scenario: [Damage Code - P30] Verify layout of Edit pop-up after click on Edit icon
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
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | DAMAGE                      | Textbox |
      | DAMAGE DESCRIPTION          | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |

  @442116
  Scenario: [Damage Code - P30] Pagination + Search: Verify record of Previous table in the next page should display correct result and search parameter column should include search word
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
    And I search for 'test' in search bar
    Then The table in Catalogue Profile should have at least one column contain data 'test' from search box

  @442121
  Scenario: [Object Part Code - P30] User click on "Upload" button, it should be able to upload file if column header in file upload match with column header of table in UI
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    And The table in Catalogue Profile should have at least one column contain data 'Object Part Code P30' from search box

  @442131
  Scenario: [Object Part Code - P30] After click on "Add New" button, verify layout of Add New pop-up
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
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | OBJECT PART                 | Textbox |
      | OBJECT PART DESCRIPTION     | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |

  @442135
  Scenario: [Object Part Code - P30] Verify table should have 9 columns
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
    Then The order of table headers should be displayed as design
      |                             |
      | Action                      |
      | Catalog Profile             |
      | Catalog Profile Description |
      | Catalog                     |
      | ObjectPart                  |
      | ObjectPart Description      |
      | Code                        |
      | Code Description            |

  @442138
  Scenario: [Object Part Code - P30] Verify layout of Edit pop-up after click on Edit icon
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
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | OBJECT PART                 | Textbox |
      | OBJECT PART DESCRIPTION     | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |

  @442151
  Scenario: [Object Part Code - P30] Pagination + Search: Verify record of Previous table in the next page should display correct result and search parameter column should include search word
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
    And I search for 'Object Part Code P30' in search bar
    Then The table in Catalogue Profile should have at least one column contain data 'Object Part Code P30' from search box

  @442218
  Scenario: [Cause Code - P30] Verify table should have 9 columns
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Cause Code - P30' button
    Then The order of table headers should be displayed as design
      |                             |
      | Action                      |
      | Catalog Profile             |
      | Catalog Profile Description |
      | Catalog                     |
      | Cause                       |
      | Cause Description           |
      | Code                        |
      | Code Description            |

  @442221
  Scenario: [Cause Code - P30] Verify layout of Edit pop-up after click on Edit icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Cause Code - P30' button
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | CAUSE                       | Textbox |
      | CAUSE DESCRIPTION           | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |

  @935450
  Scenario: [Cause Code - P30] User click on "Upload" button, it should be able to upload file if column header in file upload match with column header of table in UI
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Cause Code - P30' button
    And I upload 'Cause Code_P30.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    And The table in Catalogue Profile should have at least one column contain data 'Cause Code P30' from search box

  @935451
  Scenario: [Cause Code - P30] After click on "Add New" button, verify layout of Add New pop-up
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Cause Code - P30' button
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | CAUSE                       | Textbox |
      | CAUSE DESCRIPTION           | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |

  @935453
  Scenario: [Cause Code - P30] Pagination + Search: Verify record of Previous table in the next page should display correct result and search parameter column should include search word
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Cause Code - P30' button
    And I upload 'Cause Code_P30.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    And I search for 'Cause Code P30' in search bar
    Then The table in Catalogue Profile should have at least one column contain data 'Cause Code P30' from search box

  @935454
  Scenario: [Symptom Code - P30] User click on "Upload" button, it should be able to upload file if column header in file upload match with column header of table in UI
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Symptom Code - P30' button
    And I upload 'Symptom Code_P30.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    And The table in Catalogue Profile should have at least one column contain data 'Symptom Code P30' from search box

  @935455
  Scenario: [Symptom Code - P30] After click on "Add New" button, verify layout of Add New pop-up
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Symptom Code - P30' button
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | SYMPTOM                     | Textbox |
      | SYMPTOM DESCRIPTION         | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |

  @935456
  Scenario: [Symptom Code - P30] Verify table should have 9 columns
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Symptom Code - P30' button
    Then The order of table headers should be displayed as design
      |                             |
      | Action                      |
      | Catalog Profile             |
      | Catalog Profile Description |
      | Catalog                     |
      | Symptom                     |
      | Symptom Description         |
      | Code                        |
      | Code Description            |

  @935457
  Scenario: [Symptom Code - P30] Verify layout of Edit pop-up after click on Edit icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Symptom Code - P30' button
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | SYMPTOM                     | Textbox |
      | SYMPTOM DESCRIPTION         | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |

  @935458
  Scenario: [Symptom Code - P30] Pagination + Search: Verify record of Previous table in the next page should display correct result and search parameter column should include search word
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    When I click on 'Symptom Code - P30' button
    And I search for 'Symptom Code P30' in search bar
    Then The table in Catalogue Profile should have at least one column contain data 'Symptom Code P30' from search box

  #Priority 2
  @441936
  Scenario: [Company & Plant Code List][P30] Insert word into search box to show result, then clear search's word, verify table should show all record
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
    And I get number of all record 'Company Code' in table then put it to list
    And I search for 'Malaysia' in search bar
    Then Company or Plant Description in Company Plant Code List should contain data 'Malaysia'
    When I press button to refresh the website
    And I search for '' in search bar
    Then Number record of table should match 'Global-COMPANY_CODE' and column 'Company Code'

  #Priority 2
  @441940
  Scenario: [Company & Plant Code List][P30] Choose some filter option, verify table result should display result that included filter option
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
    And I get number of all record 'Company Code' in table then put it to list
    And I select 'Company Code:' in SPF Tracking Summary
      | 0004 |
    Then Column in table should have data match with expected result
      | Column       | Operator | Expected |
      | Company Code | EQUALS   |     0004 |
    When I select 'Company Code:' in SPF Tracking Summary
      | 0004 |
    Then Number record of table should match 'Global-COMPANY_CODE' and column 'Company Code'
    And I select 'Planning Plant:' in SPF Tracking Summary
      | M040 |
    Then Column in table should have data match with expected result
      | Column         | Operator | Expected |
      | Planning Plant | EQUALS   | M040     |
    When I select 'Planning Plant:' in SPF Tracking Summary
      | M040 |
    Then Number record of table should match 'Global-COMPANY_CODE' and column 'Company Code'
    And I select 'Maintenance Plant:' in SPF Tracking Summary
      | M039 |
    Then Column in table should have data match with expected result
      | Column            | Operator | Expected |
      | Maintenance Plant | EQUALS   | M039     |
    When I select 'Maintenance Plant:' in SPF Tracking Summary
      | M039 |
    Then Number record of table should match 'Global-COMPANY_CODE' and column 'Company Code'

  #Priority 2
  @441944
  Scenario: [Company & Plant Code List][P30] Insert word into search box, table should only display result which included search's word and belong to "Company Description" and "Plant Description" column (eg: search's word = "Vietnam")
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
    And I search for 'Malaysia' in search bar
    Then Company or Plant Description in Company Plant Code List should contain data 'Malaysia'

  #Priority 2
  @441957
  Scenario: [Company & Plant Code List][P30] Select checkbox(s), verify it should display correct number of selected record
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
    And I select all ref no in the Stock Proposal Report page
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority 2
  @441960
  Scenario: [Company & Plant Code List][P30] Pagination: Verify it shoud direct to the page which user choose in Pagination
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
    And I click next button
    Then Page '2' should be selected

  #Priority 2
  @441964
  Scenario: [Company & Plant Code List][P30] Pagination + Search: user input search word into search box which result has at least 2 page, verify result in the next page should include search's word and belong to "Company Description" and "Plant Description" column
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
    And I search for 'PETRONAS' in search bar
    Then The table in Catalogue Profile should have at least one column contain data 'PETRONAS' from search box

  #Priority2
  @441965
  Scenario: [P30] Pagination + Filter: user choose filter option which result has at least 2 page, verify result in the next page should include filter option
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    And I change the number of data rows in table into '5'
    And I select 'Company Code:' in SPF Tracking Summary
      | 0009 |
    When I get all data of column 'Company Code' in Stock Proposal Summary
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column       | Expected |
      | Company Code |     0009 |
    When I click on '2' button
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column       | Expected |
      | Company Code |     0009 |

  #Priority2
  @441966
  Scenario: "Company & Plant Code List" detail page: At "P64" tab, user click on "Upload" button, it should be able to upload file if column header in file upload match with column header of table in UI
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    When I upload 'P30_Company and Plant Code List.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    When I press button to refresh the website
    When I click on 'P64' button
    And I select 'Company Code:' in SPF Tracking Summary
      | 0499 |
    Then The text message 'No data to show.' should 'not display' in the website
    When I press button to refresh the website
    When I click on 'P64' button
    And I delete all Company Code '0499' in the General Data List
    When I search for '0499' in search bar
    Then The text message 'No data to show.' should 'display' in the website

  #Priority2
  @441989
  Scenario: Insert word into search box, table should only display result which included search's word and belong to "Company Description" and "Plant Description" column
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    When I search for 'PETRONAS Chem Isononanol' in search bar
    When I get all data of column 'Company Description' in Stock Proposal Summary
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column              | Expected                      |
      | Company Description | PETRONAS Chem Isononanol      |
      | Plant Description   | PETRONAS Chemicals Isononanol |

  #Priority2
  @441992
  Scenario: [Company & Plant Code List][P64] Verify it should has 3 filters
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    And Filters should be displayed in the screen
      | Company Code:      |
      | Planning Plant:    |
      | Maintenance Plant: |

  #Priority2
  @441993
  Scenario: [Company & Plant Code List][P64] Choose some filter option, verify table result should display result that included filter option
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    And I select 'Company Code:' in SPF Tracking Summary
      | 0438 |
    Then Column in table should have data match with expected result
      | Column       | Operator | Expected |
      | Company Code | EQUALS   |     0438 |
    When I click to 'RestartAltOutlinedIcon' icon on the screen
    Then The filter 'Company Code:' is displayed as default
    And I select 'Planning Plant:' in SPF Tracking Summary
      | M210 |
    Then Column in table should have data match with expected result
      | Column         | Operator | Expected |
      | Planning Plant | EQUALS   | M210     |
    When I click to 'RestartAltOutlinedIcon' icon on the screen
    And The filter 'Planning Plant:' is displayed as default
    And I select 'Maintenance Plant:' in SPF Tracking Summary
      | M210 |
    Then Column in table should have data match with expected result
      | Column            | Operator | Expected |
      | Maintenance Plant | EQUALS   | M210     |
    When I click to 'RestartAltOutlinedIcon' icon on the screen
    And The filter 'Maintenance Plant:' is displayed as default

  #Priority2
  @442013
  Scenario: [Catalogue Profile - P64] Insert word into search box, table should only display result which included search's word  (eg: search's word = "vn")
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    When I search for 'test' in search bar
    Then Column in table should have data match with expected result
      | Cat. Type | EQUALS | test |

  #Priority2
  @442015
  Scenario: [Catalogue Profile - P64] Insert word into search box to show result, then clear search's word, verify table should show all record
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And I get number of all record 'Code group' in table then put it to list
    When I search for 'test' in search bar
    Then Column in table should have data match with expected result
      | Cat. Type | EQUALS | test |
    When I search for '' in search bar
    Then Number record of table should match 'Global-CODE_GROUP' and column 'Code group'

  #Priority2
  @442016
  Scenario: [Catalogue Profile - P64] Verify it has filter for those columns
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And Filters should be displayed in the screen
      | Cat. Type    |
      | Code:        |
      | Description: |

  #Priority2
  @442017
  Scenario: [Catalogue Profile - P64] Choose some filter option, verify table result should display result that included filter option
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And I select 'Cat. Type: ' in SPF Tracking Summary
      | test |
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected |
      | Cat. Type | EQUALS   | test     |
    Then The filter 'Cat. Type: ' is displayed as default
    And I select 'Code:' in SPF Tracking Summary
      | a |
    Then Column in table should have data match with expected result
      | Column | Operator | Expected |
      | Code   | EQUALS   | a        |
    And The filter 'Code:' is displayed as default
    And I select 'Description:' in SPF Tracking Summary
      | a |
    Then Column in table should have data match with expected result
      | Column      | Operator | Expected |
      | Description | EQUALS   | a        |
    And The filter 'Description:' is displayed as default

  #Priority2
  @442021
  Scenario: [Catalogue Profile - P64]  After user click on Submit button at "Add new" pop-up, verify new row should be added succuessfully at the end of table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And I input data into input field
      | Field Name   | Data       |
      | CAT. PROF.   | test 1     |
      | TEXT         | test 2     |
      | CAT. TYPE    | test 3     |
      | CODE GROUP   | test 4     |
      | CODE GROUP2  | test 5     |
      | CODE         | test 6     |
      | DESCRIPTION  | test 7     |
      | USAGE        | test 8     |
      | CREATED BY   | test 9     |
      | CREATED DATE | 28.09.2018 |
      | CHANGED BY   | test 10    |
      | CHANGED ON   | test 11    |
      | REMARKS      | test       |
    Then Filled data should be displayed in the screen
      | Field Name   | Data       |
      | CAT. PROF.   | test 1     |
      | TEXT         | test 2     |
      | CAT. TYPE    | test 3     |
      | CODE GROUP   | test 4     |
      | CODE GROUP2  | test 5     |
      | CODE         | test 6     |
      | DESCRIPTION  | test 7     |
      | USAGE        | test 8     |
      | CREATED BY   | test 9     |
      | CREATED DATE | 28.09.2018 |
      | CHANGED BY   | test 10    |
      | CHANGED ON   | test 11    |
      | REMARKS      | test       |
    When I click on 'Submit' button
    And I search for 'test 9' in search bar
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column      | Expected   |
      | Cat. Prof.  | test 1     |
      | Text        | test 2     |
      | Cat. Type   | test 3     |
      | Code group  | test 4     |
      | Code group2 | test 5     |
      | Code        | test 6     |
      | Description | test 7     |
      | Usage       | test 8     |
      | Created by  | test 9     |
      | Create date | 28.09.2018 |
      | Changed by  | test 10    |
      | Changed on  | test 11    |
      | Remarks     | test       |
    And I click to 'DeleteIcon' icon on the screen
    When I click on 'Ok' button
    Then The text message 'No data to show.' should 'display' in the website

  #Priority2
  @442028
  Scenario: [Catalogue Profile - P64] Verify new change should be save after user edit succussfully
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And I input data into input field
      | Field Name   | Data       |
      | CAT. PROF.   | Edit 1     |
      | TEXT         | Edit 2     |
      | CAT. TYPE    | Edit 3     |
      | CODE GROUP   | Edit 4     |
      | CODE GROUP2  | Edit 5     |
      | CODE         | Edit 6     |
      | DESCRIPTION  | Edit 7     |
      | USAGE        | Edit 8     |
      | CREATED BY   | Edit 9     |
      | CREATED DATE | 28.09.2018 |
      | CHANGED BY   | Edit 10    |
      | CHANGED ON   | Edit 11    |
      | REMARKS      | Edit       |
    When I click on 'Submit' button
    And I search for 'Edit 9' in search bar
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column | Expected |
      | Usage  | Edit 8   |
    And I click to 'EditIcon' icon on the screen
    And I input data into input field
      | Field Name | Data      |
      | USAGE      | Edited 88 |
    When I click on 'Submit' button
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column | Expected  |
      | Usage  | Edited 88 |
    And I click to 'DeleteIcon' icon on the screen
    When I click on 'Ok' button
    Then The text message 'No data to show.' should 'display' in the website

  #Priority2
  @442072
  Scenario: [Catalogue Profile - P64] tick on checkbox and click on delete button, verify confirmation pop-up should be display
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    #And I get all data of column 'Text' in Stock Proposal Summary
    #And I get random data from list 'COLUMN_LIST'
    #And I select all ref no in the Stock Proposal Report page
    #And I click to 'DeleteIcon' icon on the screen
    When I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    Then The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Ok' button
    And The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Cancel' button

  #Priority2
  @442073
  Scenario: [Catalogue Profile - P64] tick on checkbox and click on delete button, verify this item should be removed from table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And I input data into input field
      | Field Name   | Data       |
      | CAT. PROF.   | Delete 1   |
      | TEXT         | Delete 2   |
      | CAT. TYPE    | Delete 3   |
      | CODE GROUP   | Delete 4   |
      | CODE GROUP2  | Delete 5   |
      | CODE         | Delete 6   |
      | DESCRIPTION  | Delete 7   |
      | USAGE        | Delete 8   |
      | CREATED BY   | Delete 9   |
      | CREATED DATE | 28.09.2018 |
      | CHANGED BY   | Delete 10  |
      | CHANGED ON   | Delete 11  |
      | REMARKS      | Delete     |
    When I click on 'Submit' button
    And I search for 'Delete' in search bar
    And I select all ref no in the Stock Proposal Report page
    And I click to 'DeleteIcon' icon on the screen
    Then The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Ok' button
    Then The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Cancel' button
    When I click on 'Ok' button
    Then The text message 'No data to show.' should 'display' in the website

  #Priority2
  @442074
  Scenario: [Catalogue Profile - P64]Select checkbox(s), verify it should display correct number of selected record
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And I select all ref no in the Stock Proposal Report page
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority2
  @442077
  Scenario: [Catalogue Profile - P64]: Verify it shoud direct to the page which user choose in Pagination
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And I change the number of data rows in table into '5'
    When I click on '2' button
    Then Page '2' should be selected

  #Priority2
  @442078
  Scenario: [Catalogue Profile - P64]: Verify it should display 5 rows data per page when user choose 5 in "Show" drop down list box
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And I change the number of data rows in table into '5'
    And I select all ref no in the Stock Proposal Report page
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority2
  @442082
  Scenario: [Catalogue Profile - P64] User input some word into search box and click on "Search" button, verify "total line item" should display number all record for selected filter correctlly
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    And I click to SPF Ref No 'General Data-Catalogue Profile - P30 & P64' in the SPF Tracking Summary table
    Then 'Catalogue Profile - P30 & P64' page title should be displayed
    Then SPF Recommendation and Deliberation Submission page should focus on 'Catalogue Profile - P64' tab
    And I search for 'Automation Testing' in search bar
    Then The table in Catalogue Profile should have at least one column contain data 'Automation Testing' from search box
    And I change the number of data rows in table into '5'
    And I select all ref no in the Stock Proposal Report page
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority2
  @442089
  Scenario: [Damage Code - P30] Insert word into search box, table should only display result which included search's word  (eg: search's word = "vn")
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
    Then SPF Recommendation and Deliberation Submission page should focus on 'Damage Code - P30' tab
    And I search for 'Automation Testing' in search bar
    Then The table in Catalogue Profile should have at least one column contain data 'Automation Testing' from search box

  #Priority 2
  @442091
  Scenario: [Damage Code - P30] Insert word into search box to show result, then clear search's word, verify table should show all record
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
    Then SPF Recommendation and Deliberation Submission page should focus on 'Damage Code - P30' tab
    And I get number of all record 'Code' in table then put it to list
    And I search for 'Damage Code P30' in search bar
    Then The table in Catalogue Profile should have at least one column contain data 'Damage Code P30' from search box
    When I search for '' in search bar
    And I change the number of data rows in table into '5'
    Then Number record of table should match 'Global-CODE' and column 'Code'

  #Priority 2
  @442092
  Scenario: [Damage Code - P30] Verify it has filter for those columns
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
    And Filters should be displayed in the screen
      | Code:             |
      | Code Description: |

  #Priority 2
  @442093
  Scenario: [Damage Code - P30] Choose some filter option, verify table result should display result that included filter option
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
    And I upload 'Damage Code_P30.xlsx' file to the website
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    When I input data into input field
      | Field Name                  | Data                   |
      | CATALOG PROFILE             | Testing                |
      | CATALOG PROFILE DESCRIPTION | Automation testing     |
      | CATALOG                     | Auto                   |
      | DAMAGE                      |                 442093 |
      | DAMAGE DESCRIPTION          |                 442093 |
      | CODE                        |                 442093 |
      | CODE DESCRIPTION            | Description for coding |
    And I click on 'Submit' button
    And I press button to refresh the website
    And I click on 'Damage Code - P30' button
    And I select 'Code:' in SPF Tracking Summary
      | 442093 |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected |
      | Code   | EQUALS   |   442093 |
    When I click to 'RestartAltOutlinedIcon' icon on the screen
    Then The filter 'Code:' is displayed as default
    When I select 'Code Description:' in SPF Tracking Summary
      | Description for coding |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column           | Operator | Expected               |
      | Code Description | EQUALS   | Description for coding |

  #Priority 2
  @442097
  Scenario: [Damage Code - P30]  After user click on Submit button at "Add new" pop-up, verify new row should be added succuessfully at the end of table
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
    And I upload 'Damage Code_P30.xlsx' file to the website
    And I search for 'ERBS Automation Testing' in search bar
    Then The text message 'No data to show.' should 'display' in the website
    When I press button to refresh the website
    And I click on 'Damage Code - P30' button
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And I input data into input field
      | Field Name                  | Data                     |
      | CATALOG PROFILE             | Test Case 442097 testing |
      | CATALOG PROFILE DESCRIPTION | Test Case 442097 testing |
      | CATALOG                     | Test Case 442097 testing |
      | DAMAGE                      | Test Case 442097 testing |
      | DAMAGE DESCRIPTION          | Test Case 442097 testing |
      | CODE                        | Test Case 442097 testing |
      | CODE DESCRIPTION            | Test Case 442097 testing |
    And I click on 'Submit' button
    And I search for 'Test Case 442097 testing' in search bar
    Then The text message 'No data to show.' should 'not display' in the website

  #Priority 2
  @442104
  Scenario: [Damage Code - P30] Verify new change should be save after user edit succussfully
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
    And I upload 'Damage Code_P30.xlsx' file to the website
    And I search for 'ERBS Automation Testing' in search bar
    Then The text message 'No data to show.' should 'display' in the website
    When I press button to refresh the website
    And I click on 'Damage Code - P30' button
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | DAMAGE                      | Textbox |
      | DAMAGE DESCRIPTION          | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |
    When I input data into input field
      | Field Name                  | Data                    |
      | CATALOG PROFILE             | ERBS Automation Testing |
      | CATALOG PROFILE DESCRIPTION | ERBS Automation Testing |
      | CATALOG                     | ERBS Automation Testing |
      | DAMAGE                      | ERBS Automation Testing |
      | DAMAGE DESCRIPTION          | ERBS Automation Testing |
      | CODE                        | ERBS Automation Testing |
      | CODE DESCRIPTION            | ERBS Automation Testing |
    And I click on 'Submit' button
    And I search for 'ERBS Automation Testing' in search bar
    Then The text message 'No data to show.' should 'not display' in the website

  #Priority 2
  @442108 @442107
  Scenario: [Damage Code - P30] tick on checkbox and click on delete button, verify this item should be removed from table
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
    And I upload 'Damage Code_P30.xlsx' file to the website
    And I select first 1 record options in the list
    And I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    Then The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Cancel' button
    And The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Ok' button
    When I click on 'Ok' button
    Then 9 rows in the table should be corresponding to the show option

  #Priority 2
  @442109
  Scenario: [Damage Code - P30]Select checkbox(s), verify it should display correct number of selected record
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
    And I upload 'Damage Code_P30.xlsx' file to the website
    And I select first 3 record options in the list
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority 2
  @442112
  Scenario: [Damage Code - P30]: Verify it shoud direct to the page which user choose in Pagination
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
    And I upload 'Damage Code_P30.xlsx' file to the website
    And I change the number of data rows in table into '5'
    And I click on '2' button
    Then Page '2' should be selected

  #Priority 2
  @442113
  Scenario: [Damage Code - P30]: Verify it should display 5 rows data per page when user choose 5 in "Show" drop down list box
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
    And I upload 'Damage Code_P30.xlsx' file to the website
    And I change the number of data rows in table into '5'
    Then 5 rows in the table should be corresponding to the show option

  #Priority 2
  @442117
  Scenario: [Damage Code - P30] User input some word into search box and click on "Search" button, verify "total line item" should display number all record for selected filter correctlly
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
    And I upload 'Damage Code_P30.xlsx' file to the website
    And I select all ref no in the Stock Proposal Report page
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority 2
  @442124
  Scenario: [Object Part Code - P30] Insert word into search box, table should only display result which included search's word  (eg: search's word = "vn")
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    And I get number of all record 'Catalog Profile' in table then put it to list
    And I search for 'P30' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column                      | Operator | Expected |
      | Catalog Profile Description | CONTAINS | P30      |

  #Priority 2
  @442126
  Scenario: [Object Part Code - P30] Insert word into search box to show result, then clear search's word, verify table should show all record
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    And I get number of all record 'Catalog Profile' in table then put it to list
    And I search for 'P30' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column                      | Operator | Expected |
      | Catalog Profile Description | CONTAINS | P30      |
    When I search for '' in search bar
    Then Number record of table should match 'Global-CATALOG_PROFILE' and column 'Catalog Profile'

  #Priority 2
  @442127
  Scenario: [Object Part Code - P30] Verify it has filter for those columns
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
    And Filters should be displayed in the screen
      | Code:             |
      | Code Description: |

  #Priority 2
  @442128
  Scenario: [Object Part Code - P30] Choose some filter option, verify table result should display result that included filter option
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    When I input data into input field
      | Field Name                  | Data                   |
      | CATALOG PROFILE             | Testing                |
      | CATALOG PROFILE DESCRIPTION | Automation testing     |
      | CATALOG                     | Auto                   |
      | OBJECT PART                 |                 442128 |
      | OBJECT PART DESCRIPTION     |                 442128 |
      | CODE                        |                 442128 |
      | CODE DESCRIPTION            | Description for coding |
    And I click on 'Submit' button
    And I press button to refresh the website
    And I click on 'Object Part Code - P30' button
    And I select 'Code:' in SPF Tracking Summary
      | 442128 |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected |
      | Code   | EQUALS   |   442128 |
    When I click to 'RestartAltOutlinedIcon' icon on the screen
    Then The filter 'Code:' is displayed as default
    When I select 'Code Description:' in SPF Tracking Summary
      | Description for coding |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column           | Operator | Expected               |
      | Code Description | EQUALS   | Description for coding |

  #Priority 2
  @442132
  Scenario: [Object Part Code - P30]  After user click on Submit button at "Add new" pop-up, verify new row should be added succuessfully at the end of table
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    And I search for 'ERBS Automation Testing' in search bar
    Then The text message 'No data to show.' should 'display' in the website
    When I press button to refresh the website
    And I click on 'Object Part Code - P30' button
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And I input data into input field
      | Field Name                  | Data                     |
      | CATALOG PROFILE             | Test Case 442132 testing |
      | CATALOG PROFILE DESCRIPTION | Test Case 442132 testing |
      | CATALOG                     | Test Case 442132 testing |
      | OBJECT PART                 | Test Case 442132 testing |
      | OBJECT PART DESCRIPTION     | Test Case 442132 testing |
      | CODE                        | Test Case 442132 testing |
      | CODE DESCRIPTION            | Test Case 442132 testing |
    And I click on 'Submit' button
    And I search for 'Test Case 442132 testing' in search bar
    Then The text message 'No data to show.' should 'not display' in the website

  #Priority 2
  @442139
  Scenario: [Object Part Code - P30] Verify new change should be save after user edit succussfully
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    And I search for 'ERBS Automation Testing' in search bar
    Then The text message 'No data to show.' should 'display' in the website
    When I press button to refresh the website
    And I click on 'Object Part Code - P30' button
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name                        | Type    |
      | CATALOG PROFILE             | Textbox |
      | CATALOG PROFILE DESCRIPTION | Textbox |
      | CATALOG                     | Textbox |
      | OBJECT PART                 | Textbox |
      | OBJECT PART DESCRIPTION     | Textbox |
      | CODE                        | Textbox |
      | CODE DESCRIPTION            | Textbox |
      | Cancel                      | Button  |
      | Submit                      | Button  |
      | CloseIcon                   | Icon    |
    When I input data into input field
      | Field Name                  | Data                    |
      | CATALOG PROFILE             | ERBS Automation Testing |
      | CATALOG PROFILE DESCRIPTION | ERBS Automation Testing |
      | CATALOG                     | ERBS Automation Testing |
      | OBJECT PART                 | ERBS Automation Testing |
      | OBJECT PART DESCRIPTION     | ERBS Automation Testing |
      | CODE                        | ERBS Automation Testing |
      | CODE DESCRIPTION            | ERBS Automation Testing |
    And I click on 'Submit' button
    And I search for 'ERBS Automation Testing' in search bar
    Then The text message 'No data to show.' should 'not display' in the website

  #Priority 2
  @442143 @442142
  Scenario: [Object Part Code - P30] tick on checkbox and click on delete button, verify this item should be removed from table
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    And I select first 1 record options in the list
    And I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    Then The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Cancel' button
    And The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Ok' button
    When I click on 'Ok' button
    Then 9 rows in the table should be corresponding to the show option

  #Priority 2
  @442144
  Scenario: [Object Part Code - P30]Select checkbox(s), verify it should display correct number of selected record
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    And I select first 3 record options in the list
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority 2
  @442147
  Scenario: [Object Part Code - P30]: Verify it shoud direct to the page which user choose in Pagination
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    And I change the number of data rows in table into '5'
    And I click on '2' button
    Then Page '2' should be selected

  #Priority 2
  @442148
  Scenario: [Object Part Code - P30]: Verify it should display 5 rows data per page when user choose 5 in "Show" drop down list box
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
    And I upload 'Object Part Code_P30.xlsx' file to the website
    And I change the number of data rows in table into '5'
    Then 5 rows in the table should be corresponding to the show option

  #Priority 2
  @442152
  Scenario: [Object Part Code - P30] User input some word into search box and click on "Search" button, verify "total line item" should display number all record for selected filter correctlly
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
    And I upload 'Catalog Profile_P64.xlsx' file to the website
    And I select all ref no in the Stock Proposal Report page
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority 2
  @442236
  Scenario: At "General Input Data Maintenance" table, verify dataset name of "Company Code list (P30 & P64)" should be changed to "Company & Plant Code List"
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column       | Operator | Expected                  |
      | Dataset Name | EQUALS   | Company & Plant Code List |
      | No.          | EQUALS   |                         1 |

  #Priority 2
  @442237
  Scenario: At "General Input Data Maintenance" table, verify dataset name of "Catalogue Profile (P30 & P64)" should be change to "Catalogue Profile - P30 &P64"
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Catalogue Profile - P30 & P64' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column       | Operator | Expected                      |
      | Dataset Name | EQUALS   | Catalogue Profile - P30 & P64 |
      | No.          | EQUALS   |                             2 |

  #Priority 2
  @442238
  Scenario: At "General Input Data Maintenance" table, verify "Dataset Name" column  should have "Contract Catalog Report"
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Contract Catalog Report' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column       | Operator | Expected                |
      | Dataset Name | EQUALS   | Contract Catalog Report |
      | No.          | EQUALS   |                      12 |

  #Priority 2
  @442239
  Scenario: Click on "Company & Plant Code List" in dataset table, verify layout of detail dataset page
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
    Then The Breadcrumb should be displayed as 'Home > ERBS Input Data > General Input Data Maintenance > Company & Plant Code List'
    And The button 'Export to Excel' should be 'displayed'
    And Icon 'UploadIcon' should be displayed in the website
    And The button 'P30' should be 'displayed'
    And The button 'P64' should be 'displayed'
    And I should see input field 'Search by keyword' is displayed
    And Filters should be displayed in the screen
      | Company Code:      |
      | Planning Plant:    |
      | Maintenance Plant: |
    And Icon 'RestartAltOutlinedIcon' should be displayed in the website
    And I should see button 'Go to previous page' is 'disabled'
    And I should see button 'Go to first page' is 'disabled'
    And I should see button 'Go to next page' is 'enabled'
    And I should see button 'Go to last page' is 'enabled'

  #Priority 2
  @442270
  Scenario: Click on "Company & Plant Code List" in dataset table, verify color, font, size of detail dataset page
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    And The order of table headers should be displayed as design
      |                         |
      | Company Code            |
      | Company Description     |
      | Planning Plant          |
      | Maintenance Plant       |
      | Plant Description       |
      | Plant Short Description |
      | Region                  |
    And The color of column header should be 'rgba(236, 236, 236, 1)'
    And The color of column header text should be 'rgba(51, 51, 51, 1)'

  #Priority 2
  @442272
  Scenario: "Company & Plant Code List" detail page: Verify it should export all record of all page to excel file after click on "Export to Excel" button
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
    Then New file name 'No Delete-p30_CompanyCode-Plant.xlsx' should be downloaded
    When I convert data of table into list map 'DATA_FROM_ALL_PAGE' with format 'DATA_ALL_PAGE'
    And I convert excel file 'p30_CompanyCode-Plant' with index 0 into list map
    And I reverse order of the list 'LIST_MAP_FROM_EXCEL'
    Then I compare two list map 'DATA_FROM_ALL_PAGE' and 'LIST_MAP_FROM_EXCEL' with column below
      | list1                   | list2                   |
      | Company Code            | Company Code            |
      | Company Description     | Company Description     |
      | Planning Plant          | Planning Plant          |
      | Maintenance Plant       | Maintenance Plant       |
      | Plant Description       | Plant Description       |
      | Plant Short Description | Plant Short Description |
      | Region                  | Region                  |
    When I delete the data file 'p30_CompanyCode-Plant.xlsx' in the directory '/Data/Data Download/'
    And I click on 'P64' button
    And I click to 'DownloadIcon' icon on the screen
    Then New file name 'No Delete-p64_CompanyCode-Plant.xlsx' should be downloaded
    When I convert data of table into list map 'DATA_FROM_ALL_PAGE' with format 'DATA_ALL_PAGE'
    And I convert excel file 'p64_CompanyCode-Plant' with index 0 into list map
    Then I compare two list map 'DATA_FROM_ALL_PAGE' and 'LIST_MAP_FROM_EXCEL' with column below
      | list1                   | list2                   |
      | Company Code            | Company Code            |
      | Company Description     | Company Description     |
      | Planning Plant          | Planning Plant          |
      | Maintenance Plant       | Maintenance Plant       |
      | Plant Description       | Plant Description       |
      | Plant Short Description | Plant Short Description |
      | Region                  | Region                  |
    When I delete the data file 'p64_CompanyCode-Plant.xlsx' in the directory '/Data/Data Download/'

  #Priority 2
  @442277
  Scenario: "Company & Plant Code List" detail page: At "P30" tab, user click on "Upload" button, it should display error pop-up when column header in file upload is not match with column header of table in UI
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
    And I upload 'testing1.xlsx' file to the website
    Then An alert with text 'Upload has failed due to unmatched column found in your uploaded file' should be displayed

  #Priority 2
  @442279
  Scenario: [Company & Plant Code List][P30] Insert word into search box, verify table result should display only title column when there is no result included search's word (eg: search's word = "abcd")
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
    And I search for 'abcxyztesting' in search bar
    Then The text message 'No data to show.' should 'display' in the website

  #Priority 2
  @442283
  Scenario: [Company & Plant Code List][P30] Choose some filter option, click on revert button, verify filter should reset to untick all option and table should display all record by default
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
    And I select 'Company Code:' in SPF Tracking Summary
      | random |
    Then Column in table should have data match with expected result
      | Column       | Operator | Expected            |
      | Company Code | EQUALS   | Global-RANDOM_VALUE |
    When I press button to refresh the website
    And I select 'Planning Plant:' in SPF Tracking Summary
      | random |
    Then Column in table should have data match with expected result
      | Column         | Operator | Expected            |
      | Planning Plant | EQUALS   | Global-RANDOM_VALUE |
    When I press button to refresh the website
    And I select 'Maintenance Plant:' in SPF Tracking Summary
      | random |
    Then Column in table should have data match with expected result
      | Column            | Operator | Expected            |
      | Maintenance Plant | EQUALS   | Global-RANDOM_VALUE |
    When I press button to refresh the website
    Then The filter 'Company Code:' is displayed as default
    And The filter 'Planning Plant:' is displayed as default
    And The filter 'Maintenance Plant:' is displayed as default

  #Priority 2
  @442291
  Scenario: [Company & Plant Code List][P30] Verifydata in table should be match with data in DB
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
    And I change the number of data rows in table into '100'
    When I get all data from database with query in data file
      | p30 |
    And I convert data of table into list map 'DATA_FROM_ALL_PAGE' with format 'DATA_ALL_PAGE'
    Then I compare two list map 'DATA_FROM_ALL_PAGE' and 'LIST_MAP_FROM_DB' with column below
      | list1                   | list2                   |
      | Company Code            | company_code            |
      | Company Description     | company_description     |
      | Planning Plant          | plant_code              |
      | Maintenance Plant       | maintenance_plant       |
      | Plant Description       | plant_description       |
      | Plant Short Description | plant_short_description |
      | Region                  | region                  |

  #Priority 2
  @442298
  Scenario: [Company & Plant Code List][P30] Pagination: Verify when user at first page, previous button should be disable
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
    Then I should see button 'Go to previous page' is 'disabled'
    And I should see button 'Go to first page' is 'disabled'

  #Priority 2
  @442299
  Scenario: [Company & Plant Code List][P30] Pagination: Verify when user at last page, next button should be disable
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
    And I click to move to 'Go to last page' page
    Then I should see button 'Go to next page' is 'disabled'
    And I should see button 'Go to last page' is 'disabled'

  #Priority 2
  @442301
  Scenario: [Company & Plant Code List][P30] Pagination: Verify it should display 5 rows data per page when user choose 5 in Show drop down list box
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
    And I delete all Company Code '0499' in the General Data List
    And I upload 'Company and Plant Code List_5 records.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    When I press button to refresh the website
    And I change the number of data rows in table into '5'
    Then 5 rows in the table should be corresponding to the show option
    When I select all ref no in the Stock Proposal Report page
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority 2
  @442302
  Scenario: [Company & Plant Code List][P30] Pagination: Verify it should display 10 rows data per page when user choose 10 in Show drop down list box
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
    And I delete all Company Code '0499' in the General Data List
    And I upload 'Company and Plant Code List_10 records.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    When I press button to refresh the website
    And I change the number of data rows in table into '10'
    Then 10 rows in the table should be corresponding to the show option
    When I select all ref no in the Stock Proposal Report page
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority 2
  @442303
  Scenario: [Company & Plant Code List][P30] Pagination: Verify it should display 100 rows data per page when user choose 100 in Show drop down list box
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
    And I delete all Company Code '0499' in the General Data List
    And I upload 'Company and Plant Code List_100 records.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    When I press button to refresh the website
    And I change the number of data rows in table into '100'
    Then 100 rows in the table should be corresponding to the show option
    And I select all ref no in the Stock Proposal Report page
    Then I count all selected record then check with message 'items are selected' in General Data

  #Priority 2
  @442307
  Scenario: "Company & Plant Code List" detail page: At "P64" tab, user click on "Upload" button, it should display error pop-up when column header in file upload is not match with column header of table in UI
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    And I upload 'testing1.xlsx' file to the website
    Then An alert with text 'Upload has failed due to unmatched column found in your uploaded file' should be displayed

  #Priority 2
  @442309
  Scenario: [Company & Plant Code List][P64] Insert word into search box, verify table result should display only title column when there is no result included search's word (eg: search's word = "abcd")
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    And I search for 'abcxyztesting' in search bar
    Then The text message 'No data to show.' should 'display' in the website

  #Priority 2
  @442310
  Scenario: [Company & Plant Code List][P64] Insert word into search box to show result, then clear search's word, verify table should show all record
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    And I get number of all record 'Company Code' in table then put it to list
    And I search for 'PETRONAS' in search bar
    Then Company or Plant Description in Company Plant Code List should contain data 'PETRONAS'
    When I search for '' in search bar
    Then Number record of table should match 'Global-COMPANY_CODE' and column 'Company Code'

  #Priority 2
  @442313
  Scenario: [Company & Plant Code List][P64] Verify table should have 9 columns
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    And I upload 'P30_Company and Plant Code List.xlsx' file to the website
    Then An alert with text 'The newly inputted data are updated.' should be displayed
    When I press button to refresh the website
    And I click on 'P64' button
    And I select 'Company Code:' in SPF Tracking Summary
      | 0499 |
    And I select 'Planning Plant:' in SPF Tracking Summary
      | M237 |
    And I select 'Maintenance Plant:' in SPF Tracking Summary
      | M237 |
    When I click to 'RestartAltOutlinedIcon' icon on the screen
    Then The filter 'Company Code:' is displayed as default
    And The filter 'Planning Plant:' is displayed as default
    And The filter 'Maintenance Plant:' is displayed as default
    When I delete all Company Code '0499' in the General Data List

  #Priority 2
  @442318
  Scenario: [Company & Plant Code List][P30] Verifydata in table should be match with data in DB
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Company & Plant Code List' in search bar
    And I click to SPF Ref No 'General Data-Company & Plant Code List' in the SPF Tracking Summary table
    Then 'Company & Plant Code List' page title should be displayed
    When I click on 'P64' button
    And I change the number of data rows in table into '100'
    When I get all data from database with query in data file
      | p64 |
    And I convert data of table into list map 'DATA_FROM_ALL_PAGE' with format 'DATA_ALL_PAGE'
    Then I compare two list map 'DATA_FROM_ALL_PAGE' and 'LIST_MAP_FROM_DB' with column below
      | list1                   | list2                   |
      | Company Code            | company_code            |
      | Company Description     | company_description     |
      | Planning Plant          | plant_code              |
      | Maintenance Plant       | maintenance_plant       |
      | Plant Description       | plant_description       |
      | Plant Short Description | plant_short_description |
      | Region                  | region                  |

  #Priority 2
  @466250
  Scenario: [Failure words][Edit] User should be able to edit data on Failure words screen
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Failure words' in search bar
    And I click to SPF Ref No 'General Data-Failure words' in the SPF Tracking Summary table
    Then 'Failure Words' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name    | Data                  |
      | FAILURE WORD  | TC 466250             |
      | STANDARD WORD | Automation script bug |
    And I click on 'Submit' button
    And I search for 'Automation script bug' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator | Expected              |
      | Standard Word | EQUALS   | Automation script bug |
      | Failure Word  | EQUALS   | TC 466250             |

  #Priority 2
  @466252
  Scenario: [Failure words][Edit] System should display error message when user edit duplicated data in 2 lines
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Failure words' in search bar
    And I click to SPF Ref No 'General Data-Failure words' in the SPF Tracking Summary table
    Then 'Failure Words' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name    | Data                  |
      | FAILURE WORD  | bug for tc 466251     |
      | STANDARD WORD | Automation script bug |
    And I click on 'Submit' button
    And I click next button
    Then Page '2' should be selected
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name    | Data                  |
      | FAILURE WORD  | bug for tc 466251     |
      | STANDARD WORD | Automation script bug |
    And I click on 'Submit' button
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466253
  Scenario: [Failure words][Add new pop-upt] System should display message when user add a new valid data
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Failure words' in search bar
    And I click to SPF Ref No 'General Data-Failure words' in the SPF Tracking Summary table
    Then 'Failure Words' page title should be displayed
    #Edit data before delete
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name    | Data                  |
      | FAILURE WORD  | TC 466253             |
      | STANDARD WORD | Automation script bug |
    And I click on 'Submit' button
    And I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    And I click on 'Ok' button
    #Add new
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name          | Type    |
      | FAILURE WORD  | Textbox |
      | STANDARD WORD | Textbox |
      | Cancel        | Button  |
      | Submit        | Button  |
      | CloseIcon     | Icon    |
    And I input data into input field
      | Field Name    | Data                  |
      | FAILURE WORD  | TC 466253             |
      | STANDARD WORD | Automation script bug |
    And I click on 'Submit' button
    And I search for 'TC 466253' in search bar
    Then The text message 'No data to show.' should 'not display' in the website

  #Priority 2
  @466254
  Scenario: [Failure words][Delete] User should be able to delete data on Failure words screen
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Failure words' in search bar
    And I click to SPF Ref No 'General Data-Failure words' in the SPF Tracking Summary table
    Then 'Failure Words' page title should be displayed
    #Edit data before delete
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name    | Data                  |
      | FAILURE WORD  | TC 466254             |
      | STANDARD WORD | Automation script bug |
    And I click on 'Submit' button
    #Delete
    And I search for 'TC 466254' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    And I click on 'Ok' button
    And I search for 'TC 466254' in search bar
    Then The text message 'No data to show.' should 'display' in the website

  #Priority 2
  @466259
  Scenario: [Compiled words check][Edit] User should be able to edit data on Compiled words check screen
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Compiled words check' in search bar
    And I click to SPF Ref No 'General Data-Compiled words check' in the SPF Tracking Summary table
    Then 'Compiled Words Check' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name | Data                  |
      | WORD       | TC 466259             |
      | VARIATION  | Automation script bug |
    And I click on 'Submit' button
    And I search for 'Automation script bug' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected              |
      | Word      | EQUALS   | TC 466259             |
      | Variation | EQUALS   | Automation script bug |

  #Priority 2
  @466261
  Scenario: [Compiled words check][Edit] System should display error message when user edit duplicated data in 2 lines
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Compiled words check' in search bar
    And I click to SPF Ref No 'General Data-Compiled words check' in the SPF Tracking Summary table
    Then 'Compiled Words Check' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name | Data                  |
      | WORD       | bug for tc 466261     |
      | VARIATION  | Automation script bug |
    And I click on 'Submit' button
    And I click next button
    Then Page '2' should be selected
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name | Data                  |
      | WORD       | bug for tc 466261     |
      | VARIATION  | Automation script bug |
    And I click on 'Submit' button
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466262
  Scenario: [Compiled words check][Add new pop-upt] System should display message when user add a new valid data
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Compiled words check' in search bar
    And I click to SPF Ref No 'General Data-Compiled words check' in the SPF Tracking Summary table
    Then 'Compiled Words Check' page title should be displayed
    #Edit data before delete
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name | Data                  |
      | WORD       | TC 466262             |
      | VARIATION  | Automation script bug |
    And I click on 'Submit' button
    And I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    And I click on 'Ok' button
    #Add new
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name      | Type    |
      | WORD      | Textbox |
      | VARIATION | Textbox |
      | Cancel    | Button  |
      | Submit    | Button  |
      | CloseIcon | Icon    |
    And I input data into input field
      | Field Name | Data                  |
      | WORD       | TC 466262             |
      | VARIATION  | Automation script bug |
    And I click on 'Submit' button
    And I search for 'TC 466262' in search bar
    Then The text message 'No data to show.' should 'not display' in the website

  #Priority 2
  @466263
  Scenario: [Compiled words check][Delete] User should be able to delete data on Compiled words check screen
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Compiled words check' in search bar
    And I click to SPF Ref No 'General Data-Compiled words check' in the SPF Tracking Summary table
    Then 'Compiled Words Check' page title should be displayed
    #Edit data before delete
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name | Data                  |
      | WORD       | TC 466263             |
      | VARIATION  | Automation script bug |
    And I click on 'Submit' button
    #Delete
    And I search for 'TC 466263' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    And I click on 'Ok' button
    And I search for 'TC 466263' in search bar
    Then The text message 'No data to show.' should 'display' in the website

  #Priority 2
  @466268
  Scenario: [Abbreviations][Edit] User should be able to edit data on Abbreviations screen
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
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
      | Field Name     | Data                  |
      | WORDS          | TC 466268             |
      | CORRECTED WORD | Automation script bug |
    And I click on 'Submit' button
    And I search for 'Automation script bug' in search bar
    Then Column in table should have data match with expected result
      | Column         | Operator | Expected              |
      | Words          | CONTAINS | TC 466268             |
      | Corrected Word | CONTAINS | Automation script bug |

  #Priority 2
  @466269
  Scenario: [Abbreviations][Edit] System should display error message when user edit duplicated data in 2 lines
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Abbreviations' in search bar
    And I click to SPF Ref No 'General Data-Abbreviations' in the SPF Tracking Summary table
    Then 'Abbreviations' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name     | Data                  |
      | WORDS          | bug for tc 4662269    |
      | CORRECTED WORD | Automation script bug |
    And I click on 'Submit' button
    And I click next button
    Then Page '2' should be selected
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name     | Data                  |
      | WORDS          | bug for tc 4662269    |
      | CORRECTED WORD | Automation script bug |
    And I click on 'Submit' button
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466271
  Scenario: [Abbreviations][Add new pop-upt] System should display new data when user add a new valid data
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Abbreviations' in search bar
    And I click to SPF Ref No 'General Data-Abbreviations' in the SPF Tracking Summary table
    Then 'Abbreviations' page title should be displayed
    #Edit data before delete
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name     | Data                  |
      | WORDS          | TC 466271             |
      | CORRECTED WORD | Automation script bug |
    And I click on 'Submit' button
    And I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    And I click on 'Ok' button
    #Add new
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And Pop-up should contain fields and buttons as design
      | Name           | Type    |
      | WORDS          | Textbox |
      | CORRECTED WORD | Textbox |
      | Cancel         | Button  |
      | Submit         | Button  |
      | CloseIcon      | Icon    |
    And I input data into input field
      | Field Name     | Data                  |
      | WORDS          | TC 466271             |
      | CORRECTED WORD | Automation script bug |
    And I click on 'Submit' button
    And I search for 'TC 466271' in search bar
    Then The text message 'No data to show.' should 'not display' in the website

  #Priority 2
  @466272
  Scenario: [Abbreviations][Delete] User should be able to delete data on Abbreviations screen
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Abbreviations' in search bar
    And I click to SPF Ref No 'General Data-Abbreviations' in the SPF Tracking Summary table
    Then 'Abbreviations' page title should be displayed
    #Edit data before delete
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name     | Data                  |
      | WORDS          | TC 466272             |
      | CORRECTED WORD | Automation script bug |
    And I click on 'Submit' button
    #Delete
    And I search for 'TC 466272' in search bar
    Then The text message 'No data to show.' should 'not display' in the website
    When I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    And I click on 'Ok' button
    And I search for 'TC 466272' in search bar
    Then The text message 'No data to show.' should 'display' in the website

  #Priority 2
  @466277
  Scenario: [Msel assemblies][Edit] User should be able to edit existing data when click on Edit button
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Msel assemblies' in search bar
    And I click to SPF Ref No 'General Data-Msel assemblies' in the SPF Tracking Summary table
    Then 'Msel Assemblies' page title should be displayed
    #When I delete record with material no '50727744' in the Msel Assemblies page
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name   | Data     |
      | MATERIAL NO. | 50029899 |
    And I delay for 10 seconds
    And I click on 'Submit' button
    And I search for '50029899' in search bar
    Then The text message 'No data to show.' should 'not display' in the website

  #Priority 2
  #Not Done
  @466278
  Scenario: [Msel assemblies][Edit] System should display error message when user input invalid data into "Material No." column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Msel assemblies' in search bar
    And I click to SPF Ref No 'General Data-Msel assemblies' in the SPF Tracking Summary table
    Then 'Msel Assemblies' page title should be displayed
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name   | Data          |
      | MATERIAL NO. | testingabc123 |
    And I delay for 10 seconds
    And I click on 'Submit' button

  #Priority 2
  @466279
  Scenario: [Msel assemblies][Edit] System should display error message when user input  duplictae data in "Material No." column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Msel assemblies' in search bar
    And I click to SPF Ref No 'General Data-Msel assemblies' in the SPF Tracking Summary table
    Then 'Msel Assemblies' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name   | Data     |
      | MATERIAL NO. | 50029900 |
    And I delay for 10 seconds
    And I click on 'Submit' button
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466280
  Scenario: [Msel assemblies][Add new pop-upt] User should able to add a new valid data when click on Add New button
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Msel assemblies' in search bar
    And I click to SPF Ref No 'General Data-Msel assemblies' in the SPF Tracking Summary table
    Then 'Msel Assemblies' page title should be displayed
    When I delete record with material no '50727745' in the Msel Assemblies page
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And I input data into input field
      | Field Name   | Data     |
      | MATERIAL NO. | 50727745 |
    And I delay for 10 seconds
    And I click on 'Submit' button
    And I search for '50727745' in search bar
    Then Column in table should have data match with expected result
      | Column       | Operator | Expected |
      | Material No. | EQUALS   | 50727745 |

  #Priority 2
  @466281
  Scenario: [Msel assemblies][Delete] User should be able to delete data on Msel assemblies screen
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Msel assemblies' in search bar
    And I click to SPF Ref No 'General Data-Msel assemblies' in the SPF Tracking Summary table
    Then 'Msel Assemblies' page title should be displayed
    And I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    Then The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Cancel' button
    And The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Ok' button
    When I click on 'Ok' button
    And I search for 'Global-RANDOM_MATNO' in search bar
    Then The text message 'No data to show.' should 'display' in the website

  #Priority 2
  @466285:
  Scenario: [Valve Assemblies][Edit] User should be able to edit existing data when click on Edit button
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Valve assemblies' in search bar
    And I click to SPF Ref No 'General Data-Valve assemblies' in the SPF Tracking Summary table
    Then 'Valve Assemblies' page title should be displayed
    When I create new random number for Material No
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name   | Data                |
      | MATERIAL NO. | Global-RANDOM_MATNO |
    And I delay for 10 seconds
    And I click on 'Submit' button
    And I search for 'Global-RANDOM_MATNO' in search bar
    Then The text message 'No data to show.' should 'not display' in the website

  #Not Done
  #Priority 2
  @466286
  Scenario: [Valve Assemblies][Edit] System should display error message when user input invalid data into "Material No." column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Valve assemblies' in search bar
    And I click to SPF Ref No 'General Data-Valve assemblies' in the SPF Tracking Summary table
    Then 'Valve Assemblies' page title should be displayed
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name   | Data          |
      | MATERIAL NO. | testingabc123 |
    And I delay for 10 seconds
    And I click on 'Submit' button

  #Priority 2
  @466287
  Scenario: [Valve Assemblies][Edit] System should display error message when user input  duplictae data in "Material No." column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Valve assemblies' in search bar
    And I click to SPF Ref No 'General Data-Valve assemblies' in the SPF Tracking Summary table
    Then 'Valve Assemblies' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    When I input data into input field
      | Field Name   | Data     |
      | MATERIAL NO. | 50303632 |
    And I delay for 10 seconds
    And I click on 'Submit' button
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466288
  Scenario: [Valve Assemblies][Add new pop-upt] User should able to add a new valid data when click on Add New button
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Valve assemblies' in search bar
    And I click to SPF Ref No 'General Data-Valve assemblies' in the SPF Tracking Summary table
    Then 'Valve Assemblies' page title should be displayed
    When I search for '50771996' in search bar
    And I delete record with material no '50771996' in the Msel Assemblies page
    And I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    And I input data into input field
      | Field Name   | Data     |
      | MATERIAL NO. | 50771996 |
    And I delay for 10 seconds
    And I click on 'Submit' button
    And I search for '50771996' in search bar
    Then Column in table should have data match with expected result
      | Column       | Operator | Expected |
      | Material No. | EQUALS   | 50771996 |

  #Priority 2
  @466289
  Scenario: [Valve assemblies][Delete] User should be able to delete data on Msel assemblies screen
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Valve assemblies' in search bar
    And I click to SPF Ref No 'General Data-Valve assemblies' in the SPF Tracking Summary table
    Then 'Valve Assemblies' page title should be displayed
    And I click on button in column of table in ERBS Input
      | Column | Name                |
      | Action | Delete General Data |
    Then The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Cancel' button
    And The 'Confirmation' pop-up should be displayed with message 'Are you sure you want to delete this item?' and 'Ok' button
    When I click on 'Ok' button
    And I search for 'Global-RANDOM_MATNO' in search bar
    Then The text message 'No data to show.' should 'display' in the website

  #Priority 2
  @466293
  Scenario: [Equipment sensitive to Content] Verify the layout of Equipment sensitive to Content screen
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Equipment sensitivity to content' in search bar
    And I click to SPF Ref No 'General Data-Equipment sensitivity to content' in the SPF Tracking Summary table
    Then 'Equipment Sensitivity To Content' page title should be displayed
    And The Breadcrumb should be displayed as 'Home > ERBS Input Data > General Input Data Maintenance > Equipment Sensitivity To Content'
    And The button 'Bulk Amendment' should be 'displayed'
    And Icon 'UploadIcon' should be displayed in the website
    And I should see input field 'Search by keyword' is displayed
    And Icon 'RestartAltOutlinedIcon' should be displayed in the website
    And I should see button 'Go to previous page' is 'disabled'
    And I should see button 'Go to first page' is 'disabled'
    And I should see button 'Go to next page' is 'enabled'
    And I should see button 'Go to last page' is 'enabled'
    And The order of table headers should be displayed as design
      |                             |
      | Equipment Class             |
      | Equipment Class Description |
      | Sensitive To Content        |

  #Priority 2
  @466297
  Scenario: [Chemicals affecting equipment][Edit] System should display error message when user input  duplictae data in "Contents" column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Chemicals affecting equipment' in search bar
    And I click to SPF Ref No 'General Data-Chemicals affecting equipment' in the SPF Tracking Summary table
    Then 'Chemicals Affecting Equipment' page title should be displayed
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A new pop-up 'Edit' should be displayed
    And I input data into input field
      | Field Name | Data    |
      | CONTENTS   | testing |
    And I click on 'Submit' button
    Then An alert with text 'Data are duplicated in Database' should be displayed

  #Priority 2
  @466298
  Scenario: [Chemicals affecting equipment][Add new pop-up] System should display error message when user input duplictae data in "Contents" column
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed
    When I search for 'Chemicals affecting equipment' in search bar
    And I click to SPF Ref No 'General Data-Chemicals affecting equipment' in the SPF Tracking Summary table
    Then 'Chemicals Affecting Equipment' page title should be displayed
    When I click to 'UploadFileIcon' icon on the screen
    Then A new pop-up 'Add New' should be displayed
    When I input data into input field
      | Field Name | Data    |
      | CONTENTS   | testing |
    And I click on 'Submit' button
    Then An alert with text 'Data are duplicated in Database' should be displayed
