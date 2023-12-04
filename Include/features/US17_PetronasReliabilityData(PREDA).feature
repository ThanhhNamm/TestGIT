@US_17
Feature: Petronas Reliability Data (PREDA)

  #Priority 1
  @441887 @441855
  Scenario Outline: Verify Download button
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on '<Tables>' button
    Then The button 'Download' should be 'displayed'

    Examples: 
      | Tables          |
      | Preda Materials |
      | Preda Equipment |

  @441863
  Scenario: Preda Materials should have 5 search boxes
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    And I click on 'Preda Materials' button
    Then Number of search boxes should be displayed correctly in PREDA
      | PLANT CODE - PLANT NAME |
      | MATERIAL NO             |
      | MATERIAL FAMILY         |
      | MATERIAL FAMILY TYPE    |
      | EQUIPMENT TYPE          |

  @441864
  Scenario: Drop down list will appear to display search result with multi-select after user input search word into search box in Preda Materials
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    And I click on 'Preda Materials' button
    And I input 'm08' into 'PLANT CODE - PLANT NAME' search box in PREDA
    Then 'm08' should be contained in search results in PREDA

  @441866
  Scenario: Preview table should display all records which include selected word when user select any option and click on search button
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    #And I select '50000516' option in 'MATERIAL NO' field in PREDA
    When I select options in 'MATERIAL NO' field
      | 50000516 |
    And I click on 'Search' button
    #Then Table 'PREDA Materials' should display corect data based on selected '50000516' option of 'Material Number' column
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column          | Operator | Expected |
      | Material Number | EQUALS   | 50000516 |

  @441880
  Scenario: Record of Preview table in the next page should display correct result and search parameter column should include search word
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I select options in 'MATERIAL FAMILY TYPE' field
      | Abspn |
    And I click on 'Search' button
    And I change the number of data rows in table into '100'
    Then All records in the table should have data match with value in search box
      | Column               | Operator | Value |
      | Material Family Type | EQUAL    | Abspn |

  @441887
  Scenario: Verify Download button in PREDA Equipment
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    And I click on 'Preda Equipment' button
    Then The button 'Download' should be 'displayed'

  @441895
  Scenario: Preda Equipment should have 4 search boxes
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    And I click on 'Preda Equipment' button
    Then Number of search boxes should be displayed correctly in PREDA
      | PLANT CODE - PLANT NAME |
      | FUNCTIONAL LOCATION     |
      | EQUIPMENT               |
      | EQUIPMENT TYPE          |

  @441896
  Scenario: Drop down list will appear to display search result with multi-select after user input search word into search box in Preda Equipment
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    And I click on 'Preda Equipment' button
    And I input 'm08' into 'PLANT CODE - PLANT NAME' search box in PREDA
    Then 'm08' should be contained in search results in PREDA

  @441898
  Scenario: Preda Equipment tab: User search and tick some search result then click on "Search" button, Preview table should display all records which include search word
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on 'Preda Equipment' button
    And I select options in 'EQUIPMENT' field
      | Actuator Air Operated Valve Hydraulic |
    And I click on 'Search' button
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column    | Operator | Expected                              |
      | Equipment | EQUALS   | Actuator Air Operated Valve Hydraulic |

  @441910
  Scenario: Preda Equipment tab: Pagination + Search: Record of Preview  table in the next page should display correct result and search parameter column should include search word
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on 'Preda Equipment' button
    And I select options in 'EQUIPMENT' field
      | Actuator Air Operated Valve Hydraulic |
    And I click on 'Search' button
    And I change the number of data rows in table into '100'
    Then All records in the table should have data match with value in search box
      | Column    | Operator | Value                                 |
      | Equipment | EQUAL    | Actuator Air Operated Valve Hydraulic |

  #Priority 2
  @441867 @441899
  Scenario Outline: Preda Materials: Column Option should hide comlumn(s) that is not selected
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on '<Tables>' button
    And I click on 'Column Option' button
    Then I verify each deselected columns should not be displayed in the table

    Examples: 
      | Tables          |
      | Preda Materials |
      | Preda Equipment |

  #Priority 2
  @441857 @441888
  Scenario Outline: After click on Download button, verify it should display dialog pop-up
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on '<Tables>' button
    And I click on 'Download' button
    Then The 'Confirmation' pop-up should be displayed with message 'Please wait for 15 - 40 minutes. A download link will be sent to you in your email to download this report.' and 'Ok' button

    Examples: 
      | Tables          |
      | Preda Materials |
      | Preda Equipment |

  #Priority 2
  @441868 @906047
  Scenario Outline: Column Option should hide comlumn(s) that is not selected
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on '<Tables>' button
    Then Table '<Tables>' should have correct columns as in data file

    Examples: 
      | Tables          |
      | Preda Materials |
      | Preda Equipment |

  #Priority 2
  @441865 @441897
  Scenario Outline: Column Option should hide comlumn(s) that is not selected
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on '<Tables>' button
    Then I verify option should be removed from each filter when click on Reset

    Examples: 
      | Tables          |
      | Preda Materials |
      | Preda Equipment |

  #Priority 2
  @441870
  Scenario: [Material Forecast Analyzer][PREDA] Preda Materials tab: After click on "i" icon at Failure Probability (Years) column, it should display year popup
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I select checkboxes in Column Option
      | Select All                  |
      | Failure Probability (Years) |
    And I click on 'Apply Changes' button
    And I change the number of data rows in table into '5'
    Then All icon in Failure Probability column should contain data as in excel file

  #Priority 2
  @441877 @917641
  Scenario Outline: It should display 5 rows data per page when user choose 5 in "Show" drop down list box
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on '<Tables>' button
    And I change the number of data rows in table into '5'
    Then 5 rows in the table should be corresponding to the show option

    Examples: 
      | Tables          |
      | Preda Materials |
      | Preda Equipment |

  #Priority 2
  @441873 @441903
  Scenario Outline: Data in this column should be sort by alphabet according to sort column when user click on sort icon at one column
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on '<Tables>' button

    Examples: 
      | Tables          |
      | Preda Materials |
      | Preda Equipment |

  #Priority 2
  @441876 @441906
  Scenario Outline: It shoud direct to the page which user choose in Pagination
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on '<Tables>' button

    Examples: 
      | Tables          |
      | Preda Materials |
      | Preda Equipment |

  #Priority 2
  @441881 @952147
  Scenario Outline: "total line item" should display number correctlly
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    When I click on '<Tables>' button

    Examples: 
      | Tables          |
      | Preda Materials |
      | Preda Equipment |

  #Priority 2
  @441885
  Scenario: Verify layout of PREDA page after click on PREDA button
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    And The Breadcrumb should be displayed as 'Home > Material Forecast Analyzer > Petronas Reliability Data (PREDA)'
    And The button 'Download' should be 'displayed'
    And The button 'Preda Materials' should be 'displayed'
    And The button 'Preda Equipment' should be 'displayed'
    And The button 'Search' should be 'displayed'

  #Priority 2
  @441882
  Scenario: The column options should displayed as default when login by same account in different browser
    Given I go to the 'Material Forecast Analyzer' page with 'SRC SECRETARY' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then  'Petronas Reliability Data (PREDA)' page title should be displayed
    And The order of table headers should be displayed as design
      | Combination                               |
      | Unique_id_DS_use                          |
      | Common Failure Modes                      |
      | Material Number                           |
      | Material Family                           |
      | Material Family Type                      |
      | Material Specifications                   |
      | Material Sizing                           |
      | OPU Nature                                |
      | Plant Code                                |
      | Plant Name                                |
      | Equipment Type                            |
      | Distribution                              |
      | Parameter 1                               |
      | Parameter 2                               |
      | Total Number of Failures in 30 Years      |
      | Number of Failures in Year 1              |
      | Number of Failures in Year 2              |
      | Number of Failures in Year 3              |
      | Number of Failures in Year 4              |
      | Total Number of Failures in First 2 Years |
      | Total Number of Failures in First 4 Years |
      | Number of Years for First Failure         |
      | Mean Time Between Failure (days)          |
      | Std Dev Between Failure (days)            |
      | Mean Time Between Failure (years)         |
      | Std Dev Between Failure (years)           |
      | Mean Time Between Consumption (days)      |
      | Std Dev Between Consumption (days)        |
      | Mean Time Between Consumption (years)     |
      | Std Dev Between Consumption (years)       |
      | Failure Probability (Years)               |
    When I select checkboxes in Column Option
      | Mean Time Between Failure (days)      |
      | Std Dev Between Failure (days)        |
      | Mean Time Between Failure (years)     |
      | Std Dev Between Failure (years)       |
      | Mean Time Between Consumption (days)  |
      | Std Dev Between Consumption (days)    |
      | Mean Time Between Consumption (years) |
      | Std Dev Between Consumption (years)   |
      | Failure Probability (Years)           |
    And I click on 'Apply Changes' button
    Then The order of table headers should be displayed as design
      | Combination                               |
      | Unique_id_DS_use                          |
      | Common Failure Modes                      |
      | Material Number                           |
      | Material Family                           |
      | Material Family Type                      |
      | Material Specifications                   |
      | Material Sizing                           |
      | OPU Nature                                |
      | Plant Code                                |
      | Plant Name                                |
      | Equipment Type                            |
      | Distribution                              |
      | Parameter 1                               |
      | Parameter 2                               |
      | Total Number of Failures in 30 Years      |
      | Number of Failures in Year 1              |
      | Number of Failures in Year 2              |
      | Number of Failures in Year 3              |
      | Number of Failures in Year 4              |
      | Total Number of Failures in First 2 Years |
      | Total Number of Failures in First 4 Years |
      | Number of Years for First Failure         |
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then  'Petronas Reliability Data (PREDA)' page title should be displayed
    And The order of table headers should be displayed as design
      | Combination                               |
      | Unique_id_DS_use                          |
      | Common Failure Modes                      |
      | Material Number                           |
      | Material Family                           |
      | Material Family Type                      |
      | Material Specifications                   |
      | Material Sizing                           |
      | OPU Nature                                |
      | Plant Code                                |
      | Plant Name                                |
      | Equipment Type                            |
      | Distribution                              |
      | Parameter 1                               |
      | Parameter 2                               |
      | Total Number of Failures in 30 Years      |
      | Number of Failures in Year 1              |
      | Number of Failures in Year 2              |
      | Number of Failures in Year 3              |
      | Number of Failures in Year 4              |
      | Total Number of Failures in First 2 Years |
      | Total Number of Failures in First 4 Years |
      | Number of Years for First Failure         |
      | Mean Time Between Failure (days)          |
      | Std Dev Between Failure (days)            |
      | Mean Time Between Failure (years)         |
      | Std Dev Between Failure (years)           |
      | Mean Time Between Consumption (days)      |
      | Std Dev Between Consumption (days)        |
      | Mean Time Between Consumption (years)     |
      | Std Dev Between Consumption (years)       |
      | Failure Probability (Years)               |

  #Priority 2
  @441883
  Scenario: The column options should displayed as default when login by account who did NOT edit in Column Option field in same browse
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    And The order of table headers should be displayed as design
      | Combination                               |
      | Unique_id_DS_use                          |
      | Common Failure Modes                      |
      | Material Number                           |
      | Material Family                           |
      | Material Family Type                      |
      | Material Specifications                   |
      | Material Sizing                           |
      | OPU Nature                                |
      | Plant Code                                |
      | Plant Name                                |
      | Equipment Type                            |
      | Distribution                              |
      | Parameter 1                               |
      | Parameter 2                               |
      | Total Number of Failures in 30 Years      |
      | Number of Failures in Year 1              |
      | Number of Failures in Year 2              |
      | Number of Failures in Year 3              |
      | Number of Failures in Year 4              |
      | Total Number of Failures in First 2 Years |
      | Total Number of Failures in First 4 Years |
      | Number of Years for First Failure         |
      | Mean Time Between Failure (days)          |
      | Std Dev Between Failure (days)            |
      | Mean Time Between Failure (years)         |
      | Std Dev Between Failure (years)           |
      | Mean Time Between Consumption (days)      |
      | Std Dev Between Consumption (days)        |
      | Mean Time Between Consumption (years)     |
      | Std Dev Between Consumption (years)       |
      | Failure Probability (Years)               |
    When I select checkboxes in Column Option
      | Mean Time Between Failure (days)      |
      | Std Dev Between Failure (days)        |
      | Mean Time Between Failure (years)     |
      | Std Dev Between Failure (years)       |
      | Mean Time Between Consumption (days)  |
      | Std Dev Between Consumption (days)    |
      | Mean Time Between Consumption (years) |
      | Std Dev Between Consumption (years)   |
      | Failure Probability (Years)           |
    And I click on 'Apply Changes' button
    Then The order of table headers should be displayed as design
      | Combination                               |
      | Unique_id_DS_use                          |
      | Common Failure Modes                      |
      | Material Number                           |
      | Material Family                           |
      | Material Family Type                      |
      | Material Specifications                   |
      | Material Sizing                           |
      | OPU Nature                                |
      | Plant Code                                |
      | Plant Name                                |
      | Equipment Type                            |
      | Distribution                              |
      | Parameter 1                               |
      | Parameter 2                               |
      | Total Number of Failures in 30 Years      |
      | Number of Failures in Year 1              |
      | Number of Failures in Year 2              |
      | Number of Failures in Year 3              |
      | Number of Failures in Year 4              |
      | Total Number of Failures in First 2 Years |
      | Total Number of Failures in First 4 Years |
      | Number of Years for First Failure         |
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    When I click on 'PETRONAS Reliability Data (PREDA)' tab
    Then 'Petronas Reliability Data (PREDA)' page title should be displayed
    And The order of table headers should be displayed as design
      | Combination                               |
      | Unique_id_DS_use                          |
      | Common Failure Modes                      |
      | Material Number                           |
      | Material Family                           |
      | Material Family Type                      |
      | Material Specifications                   |
      | Material Sizing                           |
      | OPU Nature                                |
      | Plant Code                                |
      | Plant Name                                |
      | Equipment Type                            |
      | Distribution                              |
      | Parameter 1                               |
      | Parameter 2                               |
      | Total Number of Failures in 30 Years      |
      | Number of Failures in Year 1              |
      | Number of Failures in Year 2              |
      | Number of Failures in Year 3              |
      | Number of Failures in Year 4              |
      | Total Number of Failures in First 2 Years |
      | Total Number of Failures in First 4 Years |
      | Number of Years for First Failure         |
      | Mean Time Between Failure (days)          |
      | Std Dev Between Failure (days)            |
      | Mean Time Between Failure (years)         |
      | Std Dev Between Failure (years)           |
      | Mean Time Between Consumption (days)      |
      | Std Dev Between Consumption (days)        |
      | Mean Time Between Consumption (years)     |
      | Std Dev Between Consumption (years)       |
      | Failure Probability (Years)               |
