@US25
Feature: Create Contact Setup

  @456078
  Scenario: It should be able to add new module and active expert user
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I click on 'Add New' button
    And I add new into module 'testing automation' and expert user 'admin,0,1' in Contact Setup
    And I input data into input field
      | Field Name     | Data                 |
      | CONTACT NUMBER |                12345 |
      | EMAIL ADDRESS  | testing@petronas.com |
    And I click on 'Save Changes' button
    And I click on 'Ok' button
    Then An alert with text 'Successfully saved' should be displayed
    When I delete all module with name 'testing automation'

  #Priority 2
  @456079
  Scenario: [Contact Setup] It should be able to add new module in drop down list
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I click on 'Add New' button
    Then New field Module and Expert User are displayed with null value in Contact Setup page

  #Priority 2
  @456080
  Scenario: [Contact Setup] It should displayed all active user from User Management page in Expert user drop down
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I change the number of data rows in table into '100'
    And I get all data of column 'User Name' base on the condition 'Status is Active'
    And I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    Then 'EXPERT USER' field should contain data match with list 'Global-CONTACT_COLUMN'

  #Priority 2
  @456082
  Scenario: [Contact Setup] When user input new module which has not existed in module drop down list and click on Add New button, new module should be added into drop down list
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I click on 'Add New' button
    And I add new module 'testing' into newest module
    And I select 'testing' in last 'MODULE' in Contact Setup page
    Then New module should have name is 'testing' in the Contact Setup page

  #Priority 2
  @456083
  Scenario: [Contact Setup] When a module is selected in any of the dropdown and Saved, then the value should not be available again in another dropdown list
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I get all module name in the Contact Setup page
    And I click on 'Add New' button
    Then New module should not contain any data from list 'MODULE_NAMES' in Contact Setup page

  #Priority 2
  @456084
  Scenario: [Contact Setup] Module and expert user should be removed when user click on Delete button
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I click on 'Add New' button
    And I add new into module 'testing automation' and expert user 'admin,0,1' in Contact Setup
    And I input data into input field
      | Field Name     | Data                 |
      | CONTACT NUMBER |                12345 |
      | EMAIL ADDRESS  | testing@petronas.com |
    And I click on 'Save Changes' button
    And I click on 'Ok' button
    Then An alert with text 'Successfully saved' should be displayed
    When I delete all module with name 'testing automation'

  #Priority 2
  @456085
  Scenario: [Contact Setup] It should be able to edit information in this page
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I update data of the 1 module in Contact Setup page
      | Field       | Data       |
      | EXPERT USER | ERBS.SSO   |
      | EXPERT USER | Stag.SSO   |
      | EXPERT USER | Stag.SSO01 |
    And I scroll to the top of the website
    And I click on 'Save Changes' button
    And I click on 'Ok' button
    Then An alert with text 'Successfully saved' should be displayed
    And The module of index 1 should have user as displayed
      | ERBS.SSO   |
      | Stag.SSO   |
      | Stag.SSO01 |

  #Priority 2
  @456634
  Scenario: [Contact Setup] It should be able to edit information in this page
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I click on 'Add New' button
    And I add new into module 'test case 456634' and expert user 'phuc' in Contact Setup
    And I input data into input field
      | Field Name     | Data                 |
      | CONTACT NUMBER |                12345 |
      | EMAIL ADDRESS  | testing@petronas.com |
    And I click on 'Save Changes' button
    And I click on 'Ok' button
    Then An alert with text 'Successfully saved' should be displayed
    When I go back to the 'User Management' page
    Then 'User Management' page title should be displayed
    When I search for 'Phuc' in search bar
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A pop-up name 'User Information' should be 'displayed' as design
    When I select data from the dropdown list in the input field of 'STATUS'
      | Inactive |
    And I click on 'Save' button
    Then An alert with text 'User updated successfully' should be displayed
    And A pop-up name 'User Information' should be 'not displayed' as design
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    And User of module 'last' should contain user as expected ''
    When I delete all module with name 'test case 456634'
    #Roll back user
    And I go back to the 'User Management' page
    Then 'User Management' page title should be displayed
    When I search for 'Phuc' in search bar
    And I click on button in column of table in ERBS Input
      | Column | Name              |
      | Action | Edit General Data |
    Then A pop-up name 'User Information' should be 'displayed' as design
    When I select data from the dropdown list in the input field of 'STATUS'
      | Active |
    And I click on 'Save' button
    Then An alert with text 'User updated successfully' should be displayed
