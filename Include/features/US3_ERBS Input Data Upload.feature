@US3
Feature: ERBS Input Data Upload

  @443489
  Scenario: The General Input Data Maintenance screen will display when click on General Data button
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'General Data' on the top of the screen
    Then 'General Input Data Maintenance' page title should be displayed

  @443490
  Scenario: The ECA Online Form Submission screen will display when click on ECA button
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'ECA' on the top of the screen
    Then 'ECA Online Form Submission' page title should be displayed

  @443491
  Scenario: The 8 columns is displayed accordingly as design
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    And The table in ERBS Input Data should contain columns as design
      | Domain             |
      | File name          |
      | Uploaded File      |
      | Status             |
      | Due Date           |
      | Uploaded Date      |
      | Last Modified Date |
      | Action             |

  @443493
  Scenario: The Upload File pop up will display when clicking on the "+" icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design

  @443495 @443500 @443505 @443510 @443515 @443520
  Scenario Outline: The file will be uploaded successfully
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    #file 1
    When I search for '<name>' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for '<name>' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing1.xlsx | h6 to X |
    #file 2
    And I search for '<name>' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p64' on the screen
    And I upload 'testing2.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing2.xlsx | P64         |
    When I click on 'Close' button
    And I search for '<name>' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing2.xlsx | h6 to X |

    Examples: 
      | name                            |
      | Material Classification         |
      | Material Plant Level            |
      | Bill of Material(BOM)           |
      | Functional Location master list |
      | 1 : WO Notification Long Text   |
      | 2 : WO Header Long Text         |

  #Priority 2
  @443492
  Scenario: The File Name should be displayed accordingly to each domain
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for 'Inventory Data' in search bar
    And I get all data of column 'File name' in Stock Proposal Summary
    Then The 'Global-COLUMN_LIST' should only contain following file name
      | Material Classification |
      | Material Plant Level    |
    When I search for 'Equipment Data' in search bar
    And I get all data of column 'File name' in Stock Proposal Summary
    Then The 'Global-COLUMN_LIST' should only contain following file name
      | Functional Location master list |
      | Bill of Material(BOM)           |
    When I search for 'Plant Data' in search bar
    And I get all data of column 'File name' in Stock Proposal Summary
    Then The 'Global-COLUMN_LIST' should only contain following file name
      | 1 : WO Notification Long Text |
      | 2 : WO Header Long Text       |
      | 3 : WO Operation Long Text    |
      | 4 : WO Services & Materials   |

  #Priority 2
  @443497
  Scenario: [Inventory-Classification] The file will be deleted when clicking on the delete icon of Uploaded Document table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for 'Material Classification' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                |
      | File name | EQUALS   | Material Classification |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for 'Material Classification' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing1.xlsx | h6 to X |
    Then Column in table should have data match with expected result
      | Column        | Operator    | Expected |
      | Uploaded File | NOT CONTAIN | testing  |

  #Priority 2
  @443498
  Scenario: [Inventory-Plant Level] The Upload File pop up will display when clicking on the "+" icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for 'Material Plant Level' in search bar
    Then Column in table should have data match with expected result
      | Column | Operator | Expected     |
      | Status | EQUALS   | Not Uploaded |
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design

  #Priority 2
  @443502
  Scenario: [Inventory-Plant Level] The file will be deleted when clicking on the delete icon of Uploaded Document table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for 'Material Plant Level' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected             |
      | File name | EQUALS   | Material Plant Level |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for 'Material Plant Level' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing1.xlsx | h6 to X |
    Then Column in table should have data match with expected result
      | Column        | Operator    | Expected |
      | Uploaded File | NOT CONTAIN | testing  |

  #Priority 2
  @443503
  Scenario: [Equipment-Bill of Material(BOM)] The Upload File pop up will display when clicking on the "+" icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for 'Bill of Material(BOM)' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected              |
      | File name | EQUALS   | Bill of Material(BOM) |
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design

  #Priority 2
  @443507
  Scenario: [Equipment-Bill of Material(BOM)] The file will be deleted when clicking on the delete icon of Uploaded Document table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for 'Bill of Material(BOM)' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected              |
      | File name | EQUALS   | Bill of Material(BOM) |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for 'Bill of Material(BOM)' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing1.xlsx | h6 to X |
    Then Column in table should have data match with expected result
      | Column        | Operator    | Expected |
      | Uploaded File | NOT CONTAIN | testing  |

  #Priority 2
  @443508
  Scenario: [Equipment-Functional Location] The Upload File pop up will display when clicking on the "+" icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for 'Functional Location master list' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected                        |
      | File name | EQUALS   | Functional Location master list |
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design

  #Priority
  @443512
  Scenario: [Equipment-Functional Location]] The file will be deleted when clicking on the delete icon of Uploaded Document table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for 'Functional Location master list' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                        |
      | File name | EQUALS   | Functional Location master list |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for 'Functional Location master list' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing1.xlsx | h6 to X |
    Then Column in table should have data match with expected result
      | Column        | Operator    | Expected |
      | Uploaded File | NOT CONTAIN | testing  |

  #Priority 2
  @443513
  Scenario: [Plant-1 : WO Notification] The Upload File pop up will display when clicking on the "+" icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for '1 : WO Notification Long Text' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected                      |
      | File name | EQUALS   | 1 : WO Notification Long Text |
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design

  #Priority 2
  @443517
  Scenario: [Plant-1 : WO Notification] The file will be deleted when clicking on the delete icon of Uploaded Document table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for '1 : WO Notification Long Text' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                      |
      | File name | EQUALS   | 1 : WO Notification Long Text |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for '1 : WO Notification Long Text' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing1.xlsx | h6 to X |
    Then Column in table should have data match with expected result
      | Column        | Operator    | Expected |
      | Uploaded File | NOT CONTAIN | testing  |

  #Priority 2
  @443518
  Scenario: [Plant- 2 : WO Header] The Upload File pop up will display when clicking on the "+" icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for '2 : WO Header Long Text' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected                |
      | File name | EQUALS   | 2 : WO Header Long Text |
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design

  #Priority 2
  @443522
  Scenario: [Plant- 2 : WO Header] The file will be deleted when clicking on the delete icon of Uploaded Document table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for '2 : WO Header Long Text' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                |
      | File name | EQUALS   | 2 : WO Header Long Text |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for '2 : WO Header Long Text' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing1.xlsx | h6 to X |
    Then Column in table should have data match with expected result
      | Column        | Operator    | Expected |
      | Uploaded File | NOT CONTAIN | testing  |

  #Priority 2
  @443523
  Scenario: [Plant- 3 : WO Operation] The Upload File pop up will display when clicking on the "+" icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for '3 : WO Operation Long Text' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected                   |
      | File name | EQUALS   | 3 : WO Operation Long Text |
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design

  #Priority 2
  @443524
  Scenario: [Plant- 3 : WO Operation] The error message will display when Data Focal User upload file without selectec File Source
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for '3 : WO Operation Long Text' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected                   |
      | File name | EQUALS   | 3 : WO Operation Long Text |
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    And Radio button should be displayed as design
      | Name | Status   |
      | p30  | Unselect |
      | p64  | Unselect |
    When I upload 'testing1.xlsx' file to the website
    Then An error message 'This field is required.' in radio 'file_source' should be displayed

  #Priority 2
  @443525
  Scenario: [Plant- 3 : WO Operation] The file will be uploaded successfully
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for '3 : WO Operation Long Text' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                   |
      | File name | EQUALS   | 3 : WO Operation Long Text |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for '3 : WO Operation Long Text' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete all uploaded file in ERBS Input Data

  #Priority 2
  @443526
  Scenario: [Plant- 3 : WO Operation] The error message will displayed accordingly when User select a dupplicate file
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for '3 : WO Operation Long Text' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                   |
      | File name | EQUALS   | 3 : WO Operation Long Text |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    Then Message should be displayed when uploaded duplicate file in Input Data

  #Priority 2
  @443527
  Scenario: [Plant- 3 : WO Operation] The file will be deleted when clicking on the delete icon of Uploaded Document table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for '3 : WO Operation Long Text' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                   |
      | File name | EQUALS   | 3 : WO Operation Long Text |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for '3 : WO Operation Long Text' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing1.xlsx | h6 to X |
    Then Column in table should have data match with expected result
      | Column        | Operator    | Expected |
      | Uploaded File | NOT CONTAIN | testing  |

  #Priority 2
  @443528
  Scenario: [Plant-  4 : WO Services & Materials] The Upload File pop up will display when clicking on the "+" icon
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for '4 : WO Services & Materials' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected                    |
      | File name | EQUALS   | 4 : WO Services & Materials |
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design

  #Priority 2
  @443529
  Scenario: [Plant-  4 : WO Services & Materials] The error message will display when Data Focal User upload file without selectec File Source
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for '4 : WO Services & Materials' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected                    |
      | File name | EQUALS   | 4 : WO Services & Materials |
    When I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    And Radio button should be displayed as design
      | Name | Status   |
      | p30  | Unselect |
      | p64  | Unselect |
    When I upload 'testing1.xlsx' file to the website
    Then An error message 'This field is required.' in radio 'file_source' should be displayed

  #Priority 2
  @443530
  Scenario: [Plant-  4 : WO Services & Materials] The file will be uploaded successfully
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for '4 : WO Services & Materials' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                    |
      | File name | EQUALS   | 4 : WO Services & Materials |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for '4 : WO Services & Materials' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete all uploaded file in ERBS Input Data

  #Priority 2
  @443531
  Scenario: [Plant-  4 : WO Services & Materials] The error message will displayed accordingly when User select a dupplicate file
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for '4 : WO Services & Materials' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                    |
      | File name | EQUALS   | 4 : WO Services & Materials |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    Then Message should be displayed when uploaded duplicate file in Input Data
    When I delete all uploaded file in ERBS Input Data

  #Priority 2
  @443532
  Scenario: [Plant-  4 : WO Services & Materials] The file will be deleted when clicking on the delete icon of Uploaded Document table
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for '4 : WO Services & Materials' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                    |
      | File name | EQUALS   | 4 : WO Services & Materials |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for '4 : WO Services & Materials' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator          | Expected |
      | Uploaded File | CONTAINS AT LEAST | testing  |
    When I delete data in the column
      | Column        | Data          | Keyword |
      | Uploaded File | testing1.xlsx | h6 to X |
    Then Column in table should have data match with expected result
      | Column        | Operator    | Expected |
      | Uploaded File | NOT CONTAIN | testing  |

  #Priority 2
  @443533
  Scenario: The Uploaded File field will display correctly as format: File Source-File Name
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    When I search for 'Material Classification' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                |
      | File name | EQUALS   | Material Classification |
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I search for 'Material Classification' in search bar
    Then Column in table should have data match with expected result
      | Column        | Operator | Expected         |
      | Uploaded File | EQUALS   | P30 testing1.xlsx |

  #Priority 2
  @443534
  Scenario: The status will change to uploaded when there is at least 1 file on the Uploaded File field
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected     |
      | Status | EQUALS   | Not Uploaded |
    #1
    When I search for 'Material Classification' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    #2
    And I search for 'Material Plant Level' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing2.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing2.xlsx | P30         |
    When I click on 'Close' button
    #3
    And I search for 'Functional Location master list' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing3.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing3.xlsx | P30         |
    When I click on 'Close' button
    #4
    And I search for 'Bill of Material(BOM)' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing4.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing4.xlsx | P30         |
    When I click on 'Close' button
    #5
    And I search for '1 : WO Notification Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing5.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing5.xlsx | P30         |
    When I click on 'Close' button
    #6
    And I search for '2 : WO Header Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing6.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing6.xlsx | P30         |
    When I click on 'Close' button
    #7
    And I search for '3 : WO Operation Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing7.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing7.xlsx | P30         |
    When I click on 'Close' button
    #8
    And I search for '4 : WO Services & Materials' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing8.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing8.xlsx | P30         |
    When I click on 'Close' button
    And I search for '' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected     |
      | Status | EQUALS   | Uploaded (1) |
    When I delete all uploaded file in ERBS Input Data

  #Priority 2
  @443535
  Scenario: The Due Date field will always display as format: " DD MMM YYYY 23:59 P.M"
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    Then Data in column 'Due Date' should have format as 'dd MMM yyyy HH:mm a'

  #Priority 2
  @443538
  Scenario: The Uploaded Date will will display the date time when User upload file latest
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected     |
      | Status | EQUALS   | Not Uploaded |
    #1
    When I search for 'Material Classification' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    #2
    And I search for 'Material Plant Level' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing2.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing2.xlsx | P30         |
    When I click on 'Close' button
    #3
    And I search for 'Functional Location master list' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing3.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing3.xlsx | P30         |
    When I click on 'Close' button
    #4
    And I search for 'Bill of Material(BOM)' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing4.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing4.xlsx | P30         |
    When I click on 'Close' button
    #5
    And I search for '1 : WO Notification Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing5.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing5.xlsx | P30         |
    When I click on 'Close' button
    #6
    And I search for '2 : WO Header Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing6.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing6.xlsx | P30         |
    When I click on 'Close' button
    #7
    And I search for '3 : WO Operation Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing7.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing7.xlsx | P30         |
    When I click on 'Close' button
    #8
    And I search for '4 : WO Services & Materials' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing8.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing8.xlsx | P30         |
    When I click on 'Close' button
    And I search for '' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column        | Operator | Expected              |
      | Uploaded Date | CONTAINS | Date Time-dd MMM yyyy |
    When I delete all uploaded file in ERBS Input Data

  #Priority 2
  @443539
  Scenario: The Last Modified Date will will display the date time when User upload file latest
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected     |
      | Status | EQUALS   | Not Uploaded |
    #1
    When I search for 'Material Classification' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    #2
    And I search for 'Material Plant Level' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing2.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing2.xlsx | P30         |
    When I click on 'Close' button
    #3
    And I search for 'Functional Location master list' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing3.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing3.xlsx | P30         |
    When I click on 'Close' button
    #4
    And I search for 'Bill of Material(BOM)' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing4.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing4.xlsx | P30         |
    When I click on 'Close' button
    #5
    And I search for '1 : WO Notification Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing5.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing5.xlsx | P30         |
    When I click on 'Close' button
    #6
    And I search for '2 : WO Header Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing6.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing6.xlsx | P30         |
    When I click on 'Close' button
    #7
    And I search for '3 : WO Operation Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing7.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing7.xlsx | P30         |
    When I click on 'Close' button
    #8
    And I search for '4 : WO Services & Materials' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing8.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing8.xlsx | P30         |
    When I click on 'Close' button
    And I search for '' in search bar
    And I delete all uploaded file in ERBS Input Data
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column             | Operator | Expected              |
      | Last Modified Date | CONTAINS | Date Time-dd MMM yyyy |
    When I delete all uploaded file in ERBS Input Data

  #Priority 2
  @443541
  Scenario: The options which is displayed on the table will display on the filter checklist
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I get all data of column 'Domain' in Stock Proposal Summary
    Then All data from list 'COLUMN_LIST' should be displayed in the 'Domain:' filter
    When I get all data of column 'Status' in Stock Proposal Summary
    Then All data from list 'COLUMN_LIST' should be displayed in the 'Status:' filter

  #Priority 2
  @443542
  Scenario: The table will display accordingly to Domain filter
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'Domain:' in SPF Tracking Summary
      | Inventory Data |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected       |
      | Domain | EQUALS   | Inventory Data |
    When I select 'Domain:' in SPF Tracking Summary
      | Inventory Data |
      | Equipment Data |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected       |
      | Domain | EQUALS   | Equipment Data |
    When I select 'Domain:' in SPF Tracking Summary
      | Equipment Data |
      | Plant Data     |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected   |
      | Domain | EQUALS   | Plant Data |

  #Priority 2
  @443543
  Scenario: The table will display accordingly to Status filter
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | random |
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected            |
      | Status | CONTAINS | Global-RANDOM_VALUE |

  #Priority 2
  @443544
  Scenario: The table will display accordingly to Uploaded Date filter
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    And I search for '3 : WO Operation Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing7.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing7.xlsx | P30         |
    When I click on 'Close' button
    When I select 'current date' in 'Uploaded Date:' filter in SPF Tracking Summary
    Then Column in table should have data match with expected result
      | Column        | Operator | Expected              |
      | Uploaded Date | EQUALS   | Date Time-dd MMM yyyy |
    When I delete all uploaded file in ERBS Input Data

  #Priority 2
  @443545
  Scenario: The table will display accordingly to Last Modified Date filter
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    And I search for '3 : WO Operation Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then A pop-up name 'Upload File' should be 'displayed' as design
    When I click on radio button 'p30' on the screen
    And I upload 'testing7.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing7.xlsx | P30         |
    When I click on 'Close' button
    When I select 'current date' in 'Uploaded Date:' filter in SPF Tracking Summary
    Then Column in table should have data match with expected result
      | Column             | Operator | Expected              |
      | Last Modified Date | EQUALS   | Date Time-dd MMM yyyy |
    When I delete all uploaded file in ERBS Input Data

  #Priority 2
  @443546
  Scenario: The table will display accordingly to Search result when user key in seach box
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I search for 'Inventory' in search bar
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected  |
      | Domain | CONTAINS | Inventory |
