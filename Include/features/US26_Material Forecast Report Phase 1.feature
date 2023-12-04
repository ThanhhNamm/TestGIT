@US26
Feature: Material Forecast Report Phase 1

  @445784
  Scenario: After user choose some option in search box and click on "Search" button, verify table should display correct result
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'REGION' field
      | SOUTHERN |
    And I select options in 'SWEC MATERIAL GROUP' field
      | 24212200P |
    And I select options in 'CURRENT MATERIAL PLANT STATUS' field
      | N-Non Stock |
    And I click on 'Search' button
    And I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column                        | Operator | Expected    |
      | Region                        | EQUALS   | SOUTHERN    |
      | SWEC Material Group           | EQUALS   | 24212200P   |
      | Current Material Plant Status | EQUALS   | N-Non Stock |

  @445793
  Scenario: User click on one saved card, change some filter parameter and click on "Save Filter" button, it should able to save the new change
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select filter option 'index-1' in Material Forecast Report page
    And I select options in 'MATERIAL NO' field
      | random |
      | random |
    And I click on 'Save Filters' button
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    When I click on 'OK' button
    Then An alert with text 'New filter changes has been successfully updated.' should be displayed
    When I delete all option of filter option in Material Forecast Report
      | Name                          | Type   |
      | REGION                        | FIELD  |
      | PLANT CODE - PLANT NAME       | FIELD  |
      | SWEC MATERIAL GROUP           | FIELD  |
      | MATERIAL CRITICALITY          | OPTION |
      | FUTURE MOVEMENT               | FIELD  |
      | MATERIAL NO                   | FIELD  |
      | CURRENT MATERIAL PLANT STATUS | FIELD  |
    And I click on 'Save Filters' button
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    When I click on 'OK' button
    Then An alert with text 'New filter changes has been successfully updated.' should be displayed
    And I select options in 'SWEC MATERIAL GROUP' field
      | 24212200P |
    And I select options in 'FUTURE MOVEMENT' field
      | Non Move  |
      | Fast Move |
    And I select options in 'MATERIAL NO' field
      | 50000516 |
      | 50000518 |
      | 50000520 |
    And I click on 'Save Filters' button
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    When I click on 'OK' button
    Then An alert with text 'New filter changes has been successfully updated.' should be displayed

  @445829
  Scenario: Pagination Search Verify record of table in the next page should display correct result and search parameter column should include search word
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'FUTURE MOVEMENT' field
      | Non Move  |
      | Slow Move |
    And I click on 'Search' button
    And I click to move to 'Go to next page' page
    Then Option in the field of Material Forecast Report should be displayed as expected
      | Name            | Type  | Data      |
      | FUTURE MOVEMENT | FIELD | Non Move  |
      | FUTURE MOVEMENT | FIELD | Slow Move |

  #Priority 2
  @445779
  Scenario: [Material Forecast Analyzer][Material Forecast Report] When user toggle on "Stock out" and click on "Search" button, verify it should only display record which has "stock quantity" column = 0
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'REGION' field
      | EAST COAST |
    And I select options in 'FUTURE MOVEMENT' field
      | Fast Move |
    And I select options in multiple choice 'MATERIAL CRITICALITY'
      | E-95 |
    And I turn 'on' the toggle 'STOCK OUT'
    And I click on 'Search' button
    When I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    Then All data in the Material Forecast Report table must match condition 'Stock equal 0'

  #Priority 2
  @445780
  Scenario: [Material Forecast Analyzer][Material Forecast Report] When user toggle off "Stock out" and click on "Search" button, verify it should only display all records
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'REGION' field
      | EAST COAST |
    And I select options in multiple choice 'MATERIAL CRITICALITY'
      | E - 95 |
    And I turn 'off' the toggle 'STOCK OUT'
    And I click on 'Search' button
    When I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    And I change the number of data rows in table into '100'
    Then All data in the Material Forecast Report table must match condition 'Stock off'

  #Priority 2
  @445781
  Scenario: [Material Forecast Analyzer][Material Forecast Report] When user select one Region in Region search box, verify Plant Code - Plant Name search box should display all values belong to selected region
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'REGION' field
      | random |
    And I click on 'Search' button
    And I change the number of data rows in table into '100'
    Then All data in the Material Forecast Report table must match condition 'match plant code name'

  #Priority 2
  @445782
  Scenario: [Material Forecast Analyzer][Material Forecast Report] When user  choose any option in "Plant Code - Plant Name", "Region" parameter ​would display the region ties to the Plant Code-Plant Name selected
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'PLANT CODE - PLANT NAME' field
      | random |
    Then A new 'REGION' should be displayed automatically
    And New region displayed should be matched with plant code and plant name in database

  #Priority 2
  @445783
  Scenario: [Material Forecast Analyzer][Material Forecast Report] After user input search word into search box, drop down list will appear to display search result with multi select
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I input 'MALAYSIA' into 'PLANT CODE - PLANT NAME' search box in PREDA
    Then 'MALAYSIA' should be contained in search results in PREDA

  #Priority 2
  @445785
  Scenario: [Material Forecast Analyzer][Material Forecast Report] After user select some result in search box, click on "Search" button and click on "Reset" button, all results in search box should be removed and table should display all record by default
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'REGION' field
      | SOUTHERN |
    And I select options in 'CURRENT MATERIAL PLANT STATUS' field
      | N-Non Stock |
    And I click on 'Search' button
    And I delete all option of filter option in Material Forecast Report
      | Name                          | Type  |
      | REGION                        | FIELD |
      | CURRENT MATERIAL PLANT STATUS | FIELD |
    Then The filter of these field should be displayed as default
      | Name                          | Type  |
      | REGION                        | FIELD |
      | CURRENT MATERIAL PLANT STATUS | FIELD |

  #Priority 2
  @445786
  Scenario: [Material Forecast Analyzer][Material Forecast Report] If the filter parameter is on "ALL" or default value, the "Save Filter" buttons should be disable.
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    And The filter of these field should be displayed as default
      | Name                          | Type   |
      | REGION                        | FIELD  |
      | PLANT CODE - PLANT NAME       | FIELD  |
      | SWEC MATERIAL GROUP           | FIELD  |
      | FUTURE MOVEMENT               | FIELD  |
      | MATERIAL NO                   | FIELD  |
      | CURRENT MATERIAL PLANT STATUS | FIELD  |
      | MATERIAL CRITICALITY          | OPTION |
      | STOCK OUT                     | TOGGLE |
    And The button 'Save Filters' should be 'disabled'

  #Priority 2
  @445787
  Scenario: [Material Forecast Analyzer][Material Forecast Report] When clicked "Save Filter" Button, "Add New Filter" po​p-up should appear to save the customized filter
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I delete first filter in the Material Forecast Report
    And I select options in 'REGION' field
      | SOUTHERN |
    And I select options in 'SWEC MATERIAL GROUP' field
      | 24212200P |
    And I select options in 'CURRENT MATERIAL PLANT STATUS' field
      | N-Non Stock |
    Then The button 'Save Filters' should be 'enabled'
    When I click on 'Save Filters' button
    Then A pop-up name 'Add New Filter' should be 'displayed' as design
    When I input text into field in the 'Add New Filter' pop up
      | FIELD       | VALUE    |
      | FILTER NAME | random-5 |
    And I click on 'Save' button
    And I get all filter name in Material Forecast Report and put it to list 'LIST1'
    Then The list 'LIST1' should contain these elements below
      | Global-RANDOM_STRING |

  #Priority 2
  @445788
  Scenario: [Material Forecast Analyzer][Material Forecast Report] Add new pop-up: Verify user should be able to input maximum 25 character in field name
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'REGION' field
      | SOUTHERN |
    Then The button 'Save Filters' should be 'enabled'
    When I click on 'Save Filters' button
    Then A pop-up name 'Add New Filter' should be 'displayed' as design
    When I input text into field in the 'Add New Filter' pop up
      | FIELD       | VALUE     |
      | FILTER NAME | random-26 |
    Then An error message of 'FILTER NAME' in popup should be displayed as 'filter_name must be at most 25 characters'

  #Priority 2
  @445792
  Scenario: [Material Forecast Analyzer][Material Forecast Report] It should display error message when user want to save 11th filter
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'REGION' field
      | SOUTHERN |
    And I add new filter until it reach 10 filters in Material Forecast Report
    Then The button 'Save Filters' should be 'enabled'
    When I click on 'Save Filters' button
    Then A pop-up name 'Add New Filter' should be 'displayed' as design
    When I input text into field in the 'Add New Filter' pop up
      | FIELD       | VALUE    |
      | FILTER NAME | random-1 |
    And I click on 'Save' button
    Then An error message of 'FILTER NAME' in popup should be displayed as 'You have reached the maximum limit of saved filter. Please delete the current saved filter to add more.'

  #Priority 2
  @445797
  Scenario: [Material Forecast Analyzer][Material Forecast Report] Verify that the sequence of the saved filters will be sorted by displayed value in descending order.
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I delete first filter in the Material Forecast Report
    And I get all filter name in Material Forecast Report and put it to list 'FILTERS'
    And I get all value of all filter in Material Forecast Report
    Then Value in the list 'FILTERS_VALUE' should been sorted from 'DSC'

  #Priority 2
  @445798
  Scenario: [Material Forecast Analyzer][Material Forecast Report] User should be able to duplicate filter
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'REGION' field
      | random |
    When I add new filter until it reach 10 filters in Material Forecast Report
    When I delete first filter in the Material Forecast Report
    And I select filter option 'index-1' in Material Forecast Report page
    #get value
    And I delete all option of filter option in Material Forecast Report
      | Name                          | Type   |
      | REGION                        | FIELD  |
      | PLANT CODE - PLANT NAME       | FIELD  |
      | SWEC MATERIAL GROUP           | FIELD  |
      | MATERIAL CRITICALITY          | OPTION |
      | FUTURE MOVEMENT               | FIELD  |
      | MATERIAL NO                   | FIELD  |
      | CURRENT MATERIAL PLANT STATUS | FIELD  |
    And I select options in 'REGION' field
      | random |
    And I click on 'Search' button
    And I click on 'Save Filters' button
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    When I click on 'OK' button
    Then An alert with text 'New filter changes has been successfully updated.' should be displayed
    And I duplicate filter 'Global-FILTER_NAME' in the Material Forecast Report
    Then A pop-up name 'Duplicate' should be 'displayed' as design
    When I input text into field in the 'Duplicate' pop up
      | FIELD       | VALUE    |
      | FILTER NAME | random-5 |
    And I click on 'Save' button
    And I select filter option 'Global-RANDOM_STRING' in Material Forecast Report page
    And I click on 'Search' button
    Then Column in table should have data match with expected result in Material Forecast Report
      | Column | Operator | Expected                        |
      | Region | EQUALS   | Global-RANDOM_VALUE_FROM_FILTER |

  #Priority 2
  @445799
  Scenario: [Material Forecast Analyzer][Material Forecast Report] User should be able to delete filter
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I click to three dots icon in any filter in the Material Forecast Report page
    Then The button 'Delete' should be 'displayed'
    And The button 'Duplicate' should be 'displayed'
    When I click on 'Delete' button
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Message in pop up SPF Submission should be displayed as 'Are you sure you want to delete this filter?'
    When I click on 'OK' button
    Then The filter with name 'Global-ANY_FILTER_IN_MAT' should not be displayed in the Material Forecast Report page

  #Priority 2
  @445800
  Scenario: [Material Forecast Analyzer][Material Forecast Report] when user untick some check box in "Column Option", verify those column which was unticked should not be display in table result
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    Then These columns should not be displayed in the table
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |

  #Priority 2
  @445803
  Scenario: [Material Forecast Analyzer][Material Forecast Report] When user click on sort icon at one column, data in this column should be sort by alphabet and all record should be display according to sort column
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I click sort icon in column 'Material No' to make it 'ASC'
    Then The table should be order 'ascending' in the column 'Material No'

  #Priority 2
  @445825
  Scenario: [Material Forecast Analyzer][Material Forecast Report] : Verify it shoud direct to the page which user choose in Pagination
    Given I go to the 'Material Forecast Analyzer' page with 'OPU ENGINEER' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I click next button
    Then Page '2' should be selected

  #Priority 2
  @445831
  Scenario: The column options should displayed as default when login by different account in different browser
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select checkboxes in Column Option
      | Region               |
      | Plant Code           |
      | Plant Name           |
      | SWEC Material Group  |
      | Material Description |
      | Brand                |
      | Material Criticality |
      | Future Movement      |
      | UOM                  |
    And I click on 'Apply Changes' button
    Then The order of table headers displayed on the screen should be as design
      | Material No                            |
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
      | Potential Value Opportunity            |
      | Current Material Plant Status          |
      | Y1                                     |
      | Y2                                     |
      | Y3                                     |
      | Y4                                     |
      | Y5                                     |
      | Y1                                     |
      | Y2                                     |
      | Y3                                     |
      | Y4                                     |
      | Y5                                     |
    Given I go to the 'Material Forecast Analyzer' page with 'ADMIN' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    And The order of table headers displayed on the screen should be as design
      | Region                                 |
      | Plant Code                             |
      | Plant Name                             |
      | SWEC Material Group                    |
      | Material No                            |
      | Material Description                   |
      | Brand                                  |
      | Material Criticality                   |
      | Future Movement                        |
      | UOM                                    |
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
      | Potential Value Opportunity            |
      | Current Material Plant Status          |
      | Y1                                     |
      | Y2                                     |
      | Y3                                     |
      | Y4                                     |
      | Y5                                     |
      | Y1                                     |
      | Y2                                     |
      | Y3                                     |
      | Y4                                     |
      | Y5                                     |

  #Priority 2
  @445833
  Scenario: The column options should displayed as default when login by same account in different browser
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select checkboxes in Column Option
      | Region               |
      | Plant Code           |
      | Plant Name           |
      | SWEC Material Group  |
      | Material Description |
      | Brand                |
      | Material Criticality |
      | Future Movement      |
      | UOM                  |
    And I click on 'Apply Changes' button
    Then The order of table headers displayed on the screen should be as design
      | Material No                            |
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
      | Potential Value Opportunity            |
      | Current Material Plant Status          |
      | Y1                                     |
      | Y2                                     |
      | Y3                                     |
      | Y4                                     |
      | Y5                                     |
      | Y1                                     |
      | Y2                                     |
      | Y3                                     |
      | Y4                                     |
      | Y5                                     |
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    And The order of table headers displayed on the screen should be as design
      | Region                                 |
      | Plant Code                             |
      | Plant Name                             |
      | SWEC Material Group                    |
      | Material No                            |
      | Material Description                   |
      | Brand                                  |
      | Material Criticality                   |
      | Future Movement                        |
      | UOM                                    |
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
      | Potential Value Opportunity            |
      | Current Material Plant Status          |
      | Y1                                     |
      | Y2                                     |
      | Y3                                     |
      | Y4                                     |
      | Y5                                     |
      | Y1                                     |
      | Y2                                     |
      | Y3                                     |
      | Y4                                     |
      | Y5                                     |

  #Priority 2
  @459357
  Scenario: Saved filter should be displayed by username who save it
    Given I go to the 'Material Forecast Analyzer' page with 'OPU ENGINEER' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I get all filter name in Material Forecast Report and put it to list 'FILTER_1'
    Given I go to the 'Material Forecast Analyzer' page with 'DATA FOCAL' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I get all filter name in Material Forecast Report and put it to list 'FILTER_2'
    Then Two list should match with the condition between two lists
      | List 1   | Operator  | List 2   |
      | FILTER_1 | NOT EQUAL | FILTER_2 |

  #Priority 2
  @466455
  Scenario: [Material Forecast Report] Data in UI should display correctly when user select "Fast Move" in "Future Movement" filter
    Given I go to the 'Material Forecast Analyzer' page with 'OPU ENGINEER' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'FUTURE MOVEMENT' field
      | Fast Move |
    And I click on 'Search' button
    When I change the number of data rows in table into '10'
    And I get 10 data from database with query in data file
      | Fast Move |
    And I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    And I convert data of table into list map 'DATA_FROM_TABLE_10' with format 'DATA_FROM_PAGE-1'
    Then I compare two list map 'DATA_FROM_TABLE_10' and 'PART_LIST_MAP_FROM_DB' with column below
      | list1                         | list2                         |
      | Region                        | region                        |
      | Plant Code                    | plant_code                    |
      | Plant Name                    | plant_name                    |
      | SWEC Material Group           | swec_material_group           |
      | Material No                   | material_no                   |
      | Material Description          | material_desc                 |
      | Brand                         | brand                         |
      | Material Criticality          | material_criticality          |
      | Future Movement               | future_movement               |
      | UOM                           | uom                           |
      | Potential Value Opportunity   | potential_value_opportunity   |
      | Current Material Plant Status | current_material_plant_status |

  #Priority 2
  @466456
  Scenario: [Material Forecast Report] Data in UI should display correctly when user select "Slow Move" in "Future Movement" filter
    Given I go to the 'Material Forecast Analyzer' page with 'OPU ENGINEER' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'FUTURE MOVEMENT' field
      | Slow Move |
    And I click on 'Search' button
    When I change the number of data rows in table into '10'
    And I get 10 data from database with query in data file
      | Slow Move |
    And I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    And I convert data of table into list map 'DATA_FROM_TABLE_10' with format 'DATA_FROM_PAGE-1'
    Then I compare two list map 'DATA_FROM_TABLE_10' and 'PART_LIST_MAP_FROM_DB' with column below
      | list1                         | list2                         |
      | Region                        | region                        |
      | Plant Code                    | plant_code                    |
      | Plant Name                    | plant_name                    |
      | SWEC Material Group           | swec_material_group           |
      | Material No                   | material_no                   |
      | Material Description          | material_desc                 |
      | Brand                         | brand                         |
      | Material Criticality          | material_criticality          |
      | Future Movement               | future_movement               |
      | UOM                           | uom                           |
      | Potential Value Opportunity   | potential_value_opportunity   |
      | Current Material Plant Status | current_material_plant_status |

  #Priority 2
  @466457
  Scenario: [Material Forecast Report] Data in UI should display correctly when user select "Non Move" in "Future Movement" filter
    Given I go to the 'Material Forecast Analyzer' page with 'OPU ENGINEER' role
    Then 'Material Forecast Analyzer' page title should be displayed
    When I click on 'Material Forecast Report' tab
    Then 'Material Forecast Report' page title should be displayed
    When I select options in 'FUTURE MOVEMENT' field
      | Non Move |
    And I click on 'Search' button
    When I change the number of data rows in table into '10'
    And I get 10 data from database with query in data file
      | Non Move |
    And I select checkboxes in Column Option
      | Potential Cumulative Demand (Quantity) |
      | Potential Cumulative Demand (Value)    |
    And I click on 'Apply Changes' button
    And I convert data of table into list map 'DATA_FROM_TABLE_10' with format 'DATA_FROM_PAGE-1'
    And I update data in key of list map 'PART_LIST_MAP_FROM_DB'
      | potential_value_opportunity |
    And I update data in key of list map 'DATA_FROM_TABLE_10'
      | Potential Value Opportunity |
    Then I compare two list map 'DATA_FROM_TABLE_10' and 'PART_LIST_MAP_FROM_DB' with column below
      | list1                         | list2                         |
      | Region                        | region                        |
      | Plant Code                    | plant_code                    |
      | Plant Name                    | plant_name                    |
      | SWEC Material Group           | swec_material_group           |
      | Material No                   | material_no                   |
      | Material Description          | material_desc                 |
      | Brand                         | brand                         |
      | Material Criticality          | material_criticality          |
      | Future Movement               | future_movement               |
      | UOM                           | uom                           |
      | Potential Value Opportunity   | potential_value_opportunity   |
      | Current Material Plant Status | current_material_plant_status |
