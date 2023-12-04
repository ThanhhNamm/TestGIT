@US22
Feature: Rename 2 columns in Export to Excel on User Management Page

  @451465
  Scenario: [User Management] Data in "Approval/Rejected By" and "Approval/Rejected Date" column should be the same with data displaying in User Information pop-up for each user
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    And I click on 'Export to Excel' button
    Then New file name 'MMW User Management' should be downloaded
    When I change the number of data rows in table into '100'
    When I get all data from User Management screen with approver
    And I convert excel file 'MMW User Management' with sheet name 'User Management' into list map
    Then I compare two list map 'LIST_MAP_FROM_UI' and 'LIST_MAP_FROM_EXCEL' with column below
      | list1                                   | list2                                      |
      | User Name                               | Username                                   |
      | Email                                   | Email ID                                   |
      | Role                                    | Role                                       |
      | Status                                  | Status                                     |
      | Created On^dd MMM yyyy HH:mm a          | Created on^yyyy-MM-dd HH:mm:ss             |
      | Approval/Rejected By                    | Approval/Rejected By                       |
      | Approval/Rejected Date^yyyy-MM-dd HH:mm | Approval/Rejected Date^yyyy-MM-dd HH:mm:ss |
    When I delete the data file 'MMW User Management' in the directory '/Data/Data Download/'
