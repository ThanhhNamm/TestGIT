@US31
Feature: Stock Proposal Submission Enhancement

  @451458
  Scenario: When user one click on cell, user should be able to delete cell
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    When I input data into fields in SPF Submission
      | Material No | Lead Time | Estimated Unit Price |
      |    51326574 |        10 |                 1000 |
    And I click on 'Clear' button
    And I click on 'OK' button
    Then All cell in the SPF Submission page should be blank
      | cellLeft   |
      | cellCenter |
      | cellRight  |

  @451460
  Scenario: When user input invalid and duplicate value into SPF Submission, Confirmation pop-up should display as design
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    When I select 'M047 - PC Fertilizer Kedah' Plan Code - Plan Name
    And I put data into 'Material No' field in SPF Submission
      | 10 |
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Mat no text in popup should have color as 'rgba(224, 32, 32, 1)'
    When I click on 'OK' button
    And I input data into fields in SPF Submission
      | Material No | Lead Time | Estimated Unit Price |
      |    50000000 |        10 |                   10 |
    And I put data into 'Material No' field in SPF Submission
      | 50000000 |
      | 50000000 |
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Mat no text in popup should have color as 'rgba(241, 141, 0, 1)'
    When I click on 'OK' button
