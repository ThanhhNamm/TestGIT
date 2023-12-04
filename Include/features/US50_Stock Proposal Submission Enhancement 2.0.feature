@US50
Feature: Stock Proposal Submission Enhancement 2.0

  #Priority 2
  @480744
  Scenario: [US 50][SPF Submission] It should display tooltip when user hover on "i" icon of 3 colume
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' tab
    Then 'SPF Submission' page title should be displayed
    And The icon in column header 'Material No' should be 'Please insert 8 digit numbers only and starting number with 5'
    And The icon in column header 'Lead Time (Weeks)' should be 'Please insert maximum 3 digit no only by weeks'
    And The icon in column header 'Estimated Unit Price (RM)' should be 'Unit Price cannot be below RM 1'
