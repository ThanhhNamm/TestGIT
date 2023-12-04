@US12
Feature: SPF Recommendation and Deliberation Submission

  #Priority 2
  @425703
  Scenario: When OPU Egineer clicks on Ref No., the screen will be navigated to SPF Recommendation and Deliberation Submission
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed

  #Priority 2
  @425704
  Scenario: The SPF R&D screen will appear with REQUESTER name, REFERENCE NO and 2 tabs: SUBMISSION FOR DELIBRATION & INSUFFICIENT DATA FOR RECOMMENDATION
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed
    And SPF Recommendation and Deliberation Submission page should contain requester name no and two tabs

  #Priority 2
  @425705
  Scenario Outline: When OPU Egineer clicks on Ref No., the SUBMISSION FOR DELIBRATION tab will be focused
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | <Status> |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed
    And SPF Recommendation and Deliberation Submission page should focus on 'submission for deliberation' tab

    Examples: 
      | Status                              |
      | Pending for Deliberation Submission |
      | Pending for SRC Secretary Review    |

  #Priority 2
  @425747
  Scenario: [SPF R&D] When OPU Engineer select the 'Insufficient Data for Recommendation' tab, a pop-up 'There is no ......' will DISPLAY once only when we are on that screen
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed
    And The button 'submission for deliberation' should be 'displayed'
    And The button 'submission for deliberation' should be 'enabled'
    When I click on 'insufficient data for recommendation' button
    Then A 'Confirmation' alert should be 'displayed'
    And Message in pop up SPF Submission should be displayed as 'There is no recommendation from ERBS Engine due to data issue. Please refer to error remarks and update the data accordingly.'
    When I click on 'OK' button
    Then A 'Confirmation' alert should be 'not displayed'
    When I click on 'submission for deliberation' button
    And I click on 'insufficient data for recommendation' button
    Then A 'Confirmation' alert should be 'not displayed'

  #Priority 2
  @425750
  Scenario: [SPF R&D] When OPU Engineer select 'Report' button, user will be allow to download the list of data in the columns.
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Status:' in SPF Tracking Summary
      | Pending for Deliberation Submission |
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed
    And The button 'submission for deliberation' should be 'displayed'
    And The button 'submission for deliberation' should be 'enabled'
    When I click on 'insufficient data for recommendation' button
    Then A 'Confirmation' alert should be 'displayed'
    And Message in pop up SPF Submission should be displayed as 'There is no recommendation from ERBS Engine due to data issue. Please refer to error remarks and update the data accordingly.'
    When I click on 'OK' button
    And I click on 'Report' button
    Then New file name 'InsufficianDataForDeliberations.csv' should be downloaded