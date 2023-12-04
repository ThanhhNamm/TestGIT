@US7
Feature: Contact Page

  @451452
  Scenario: It should display "Contact Us" page after user click on "Contact Us"
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Contact Us' in the dropdown list
    Then 'Contact Us' page title should be displayed

  @451455
  Scenario: Select one Module, Name in Contact Us table should be the same with Name in Contact Setup
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I get random module and user list from Contact Setup Page
    And I click to avatar icon
    And I choose option 'Contact Us' in the dropdown list
    Then 'Contact Us' page title should be displayed
    When I input module 'Global-MODULE' into the search bar in Contact Us page
    Then The table in Contact Us page should display all users match with module

  #Priority 2
  @451454
  Scenario: [Contact US]Module in "Please Select Module" drop down should be the same with module in Contact Setup
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I get all module list from Contact Setup Page
    And I click to avatar icon
    And I choose option 'Contact Us' in the dropdown list
    Then 'Contact Us' page title should be displayed
    And I click to 'ArrowDropDownIcon' icon on the screen
    Then The dropdown in Contact Us page should display all module

  #Priority 2
  @451456
  Scenario: [Contact US] Expert User information should be match with information in User Management page
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I get random module and user list from Contact Setup Page
    And I click to avatar icon
    And I choose option 'Contact Us' in the dropdown list
    Then 'Contact Us' page title should be displayed
    When I input module 'Global-MODULE' into the search bar in Contact Us page
    Then The table in Contact Us page should display all users match with module
    When I verify Email and Role of random Expert User
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    And I search for 'Global-EMAIL_TEXT' in search bar
    Then Column in table should have data match with expected result
      | Column    | Operator | Expected         |
      | User Name | EQUALS   | Global-NAME_TEXT |
      | Role      | EQUALS   | Global-ROLE_TEXT |

  #Priority 2
  @451457
  Scenario: [Contact US] PETRONAS Helpdesk information should be the same with Helpdesk Contact Information in Contact Setup
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Contact Setup' page
    Then 'Contact Setup' page title should be displayed
    When I get helpdesk contact information from Contact Setup Page
    And I click to avatar icon
    And I choose option 'Contact Us' in the dropdown list
    Then 'Contact Us' page title should be displayed
    Then The Helpdask Information in Contact Us page should match with Contact Setup
