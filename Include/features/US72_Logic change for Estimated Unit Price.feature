@US72
Feature: Logic change for Estimated Unit Price

  @615389
  Scenario: It should have error message when user input value Estimated Unit Price below 1RM
    Given I go to the 'Initial Spare Analyzer' page with 'ADMIN' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    When I put data into 'Estimated Unit Price' field in SPF Submission
      | 0.9 |
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Message in popup should be displayed as 'The 1 following material are duplicated/invalid/below 1RM and they will be removed from the list.'
    When I click on 'OK' button
    Then All cell in the SPF Submission page should be blank
      | cellLeft   |
      | cellCenter |
      | cellRight  |
