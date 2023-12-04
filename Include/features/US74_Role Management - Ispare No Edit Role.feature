@US74
Feature: Role Management - Ispare No Edit Role

  @689997 @689999
  Scenario: User can only view all records of all paged and download if view toggle button of user is ON
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Role Management' page
    Then 'Role Management' page title should be displayed
    When Check full access to each page of account 'Admin/Support'
      | Page                                         | Status |
      | Landing Page                                 | On     |
      | User Management                              | On     |
      | Role Management                              | On     |
      | Contact Setup                                | On     |
      | Contact Us                                   | On     |
      | Data Input                                   | On     |
      | ECA Online Form Submission                   | On     |
      | ECA View/Amendment                           | On     |
      | Company & Plant Code List P30 & P64          | On     |
      | Catalogue Profile - P30 &P64                 | On     |
      | PMMS Equipment Criticality Catalogue Profile | On     |
      | Petronas Business Nature                     | On     |
      | Failure Words                                | On     |
      | Compiled Words Check                         | On     |
      | Abbreviations                                | On     |
      | Valve Assemblies                             | On     |
      | Msel Assemblies                              | On     |
      | Chemicals Affecting Equipment                | On     |
      | Equipment Sensitivity To Content             | On     |
      | Contract Catalog Report                      | On     |
      | OPU View                                     | On     |
      | SRC Secretary View                           | On     |
      | Landing Page For Material Forecast           | On     |
      | Material Forecast Report                     | On     |
      | Petronas Reliability Data (PREDA)            | On     |
    Then Current account should be able to access to all page below
      | Landing Page                      |
      | User Management                   |
      | Role Management                   |
      | Contact Setup                     |
      | Contact Us                        |
      | Data Input                        |
      #| ECA Online Form Submission                   |
      #| ECA View/Amendment                           |
      #| Company & Plant Code List P30 & P64          |
      #| Catalogue Profile - P30 &P64                 |
      #| PMMS Equipment Criticality Catalogue Profile |
      #| Petronas Business Nature                     |
      #| Failure Words                                |
      #| Compiled Words Check                         |
      #| Abbreviations                                |
      #| Valve Assemblies                             |
      #| Msel Assemblies                              |
      #| Chemicals Affecting Equipment                |
      #| Equipment Sensitivity To Content             |
      #| Contract Catalog Report                      |
      #| OPU View                                     |
      #| SRC Secretary View                           |
      #| Landing Page For Material Forecast           |
      | Material Forecast Report          |
      | Petronas Reliability Data (PREDA) |

  #Priority 2
  @690008
  Scenario: [US74] It should have error message when user create/edit/delete data of page user only has view permission
    Given I go to the 'Initial Spare Analyzer' page with 'SRC SECRETARY' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click to avatar icon
    And I choose option 'Administration' in the dropdown list
    Then 'User Management' page title should be displayed
    When I go back to the 'Role Management' page
    Then 'Role Management' page title should be displayed
    When I hover the mouse to 'Edit Permissions' button
    Then A tooltip with message "You don't have permission to edit this page. Please contact Admin." should be display