@US8
Feature: Notification Dropdown

  #Priority 2
  @466508
  Scenario: [Notification pop-up] System should display all notification message in notification pop-up when user click "All" button
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Notification' on the top of the screen
    Then 'Notifications' popup should be shown up
    When I click on 'All' button
    Then The button 'All' should be 'selected'

  #Priority 2
  @466509
  Scenario: [Notification pop-up] System should make unopened notification as opened notification when user click on "Mark all as unread"
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Notification' on the top of the screen
    Then 'Notifications' popup should be shown up
    When I click on 'Unread' button
    Then The button 'Unread' should be 'selected'
    When I click on message 'Mark all as read' on the screen
    Then No notification message should be displayed

  #Priority 2
  @466513
  Scenario: [ERBS Input Data] User should be redirected to correct page when click on notification on notification pop-up
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'input data' on the top of the screen
    Then 'ERBS Input Data - currentMonth' page title should be displayed
    When I delete all uploaded file in ERBS Input Data
    And I search for '1 : WO Notification Long Text' in search bar
    And I click on button in column of table in ERBS Input
      | Column        | Name        |
      | Uploaded File | Upload File |
    Then Radio button should be displayed as design
      | Name | Status   |
      | p30  | Unselect |
      | p64  | Unselect |
    When I click on radio button 'p30' on the screen
    And I upload 'testing1.xlsx' file to the website
    Then The 'Uploaded Documents' table in ERBS Input Data page
      | File Name     | File Source |
      | testing1.xlsx | P30         |
    When I click on 'Close' button
    And I select 'Notification' on the top of the screen
    Then 'Notifications' popup should be shown up
    When I click on 'Unread' button
    Then The button 'Unread' should be 'selected'

  #Priority 2
  @466522
  Scenario: [Stock Proposal Submission] User should be redirected to correct page when click on notification on notification bell
    Given I go to the 'Initial Spare Analyzer' page with 'DATA FOCAL' role
    Then 'Initial Spare Analyzer' page title should be displayed
    And I select 'Notification' on the top of the screen
    Then 'Notifications' popup should be shown up
    When I click on 'All' button
    Then The button 'All' should be 'selected'
    When I click option 'Recommendation is ready' in the notification
    Then 'SPF Recommendation and Deliberation Submission' page title should be displayed

  #Priority 2
  @466527
  Scenario: [Stock Proposal Summary] SRC Secretary should be redireted to correct page when click on notification on notification bell
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I select 'Notification' on the top of the screen
    Then 'Notifications' popup should be shown up
    When I click on 'All' button
    Then The button 'All' should be 'selected'
    When I click option 'Received new SPF Submission' in the notification
    Then 'Stock Proposal Summary' page title should be displayed
