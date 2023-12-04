@US37
Feature: Stock Proposal Submission

  @426873
  Scenario: OPU Engineer user can access to 'SPF Submission' screen from the Landing page of Initial Spare
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed

  @426891
  Scenario: OPU Engineer user can click on 'Submit' button for Material No submission and a confirmation pop-up will appear 'Are you sure you want to submit it?' with 2 buttons Cancel/OK
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    And I select 'M047 - PC Fertilizer Kedah' Plan Code - Plan Name
    And I input data into fields in SPF Submission
      | Material No | Lead Time | Estimated Unit Price |
      |    51326574 |        10 |                 1000 |
      |    50201647 |        10 |                 1000 |
    And I click on 'Submit' button
    And I click on 'OK' button
    And I click on 'Submit' button
    Then The pop up should be displayed as design after submit new submission in SPF Submission

  #Priority 2
  @426875
  Scenario: 'Plant Code - Plant Name' field will be MANDATORY for selection and OPU Engineer can perform SEARCH on it
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    And Field in the website should contain red asterisk
      | Plant Code - Plant Name |
    When I input value 'M039' into the search box 'Please select Plant Code - Plant Name' of field 'Plant Code - Plant Name'
    Then 'M039' should be contained in search results in PREDA

  #Priority 2
  @426878
  Scenario: There are 4 colums with blank box on the SPF submission screen: No./ Lead Time (Weeks)/ Estimated Unit Price (RM)
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    And Table in SPF Submission should contain 3 columns
      | Material No               |
      | Lead Time (Weeks)         |
      | Estimated Unit Price (RM) |

  #Priority 2
  @426880
  Scenario: 'Material No' field is allowed to key in with 8 digits numbers  and starting number with 5 (eg: 51234567 )
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    When I put data into 'Material No' field in SPF Submission
      | 51234567 |
    Then A pop-up name 'Confirmation' should be 'not displayed' as design

  #Priority 2
  @426881
  Scenario: Verify the confirmation pop-up  duplication UI. 2 buttons available: Download/OK
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    When I put data into 'Material No' field in SPF Submission
      | 50000000 |
      | 50000000 |
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Message in popup should be displayed as 'The 1 following material are duplicated/invalid/below 1RM and they will be removed from the list.'
    And Mat no text in popup should have color as 'rgba(241, 141, 0, 1)'
    And The button 'Download' should be 'displayed'
    And The button 'OK' should be 'displayed'
    When I click on 'OK' button

  #Priority 2
  @426883
  Scenario: 'Lead time' field is allow to key in with 3 digits number only maximim (minimum = 1) (eg: 999 or 0)
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    When I put data into 'Lead Time' field in SPF Submission
      | 0 |
    Then All cell in the SPF Submission page should be blank
      | cellLeft   |
      | cellCenter |
      | cellRight  |
    When I put data into 'Lead Time' field in SPF Submission
      | 1000 |
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Message in popup should be displayed as 'The 1 following material are duplicated/invalid/below 1RM and they will be removed from the list.'
    And The button 'Download' should be 'displayed'
    And The button 'OK' should be 'displayed'
    When I click on 'OK' button
    Then All cell in the SPF Submission page should be blank
      | cellLeft   |
      | cellCenter |
      | cellRight  |
    When I put data into 'Lead Time' field in SPF Submission
      | 999 |
      |   1 |
      |  50 |
    Then Cell of 'cellCenter' should have data as expected result in SPF Submission
      | 999 |
      |   1 |
      |  50 |

  #Priority 2
  @426884
  Scenario: [SPF Submission] 'Lead time' field will be rounded to 0 decimal point if user key in by themself or using copy & pates (eg: 1,2 -> 1)
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' tab
    Then 'SPF Submission' page title should be displayed
    When I put data into 'Lead Time' field in SPF Submission
      | 1.2455873497854 |
      | 5.4864846545798 |
      | 10.248735487947 |
    Then Cell of 'cellCenter' should have data as expected result in SPF Submission
      |  1 |
      |  5 |
      | 10 |

  #Priority 2
  @426890
  Scenario: OPU Engineer user can click on "Clear" button to clear the list in the column.
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    When I input data into fields in SPF Submission
      | Material No | Lead Time | Estimated Unit Price |
      |    51326574 |        10 |                 1000 |
    And I click on 'Clear' button
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Message in popup should be displayed as 'Are you sure you want to delete all material ?'
    When I click on 'OK' button
    Then All cell in the SPF Submission page should be blank
      | cellLeft   |
      | cellCenter |
      | cellRight  |

  #Priority 2
  @426898
  Scenario: When OPU Engineer input manually or copy & pates any INVALID value (Alphabet/ special characters), 'Lead Time' field will automactically removed all of it  with a pop-up message
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    When I put data into 'Lead Time' field in SPF Submission
      | ABC |
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Message in popup should be displayed as 'The 1 following material are duplicated/invalid/below 1RM and they will be removed from the list.'
    And The button 'Download' should be 'displayed'
    And The button 'OK' should be 'displayed'
    When I click on 'OK' button
    When I put data into 'Lead Time' field in SPF Submission
      | !@$%^&*()_+ |
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Message in popup should be displayed as 'The 1 following material are duplicated/invalid/below 1RM and they will be removed from the list.'
    And The button 'Download' should be 'displayed'
    And The button 'OK' should be 'displayed'
    When I click on 'OK' button

  #Priority 2
  @426899
  Scenario: After  Material No is submitted, the popup should show successfully message
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    When I click on 'SPF Submission' sub Menu
    Then 'SPF Submission' page title should be displayed
    When I select 'M050 - PCG - PC Methanol Plant 2' Plan Code - Plan Name
    And I create new random number for Material No
    And I input data into fields in SPF Submission
      | Material No         | Lead Time | Estimated Unit Price |
      | Global-RANDOM_MATNO |        10 |                 1000 |
    And I click on 'Submit' button
    And I click on 'OK' button
    And I click on 'Submit' button
    Then A pop-up name 'Confirmation' should be 'displayed' as design
    And Message in popup should be displayed as 'Are you sure you want to submit it?'
    And The button 'Cancel' should be 'displayed'
    And The button 'OK' should be 'displayed'
    When I click on 'OK' button
    And I wait and get the Ref No of new SPF Submission
    And I go to site 'MMW - Initial Spare Landing Page'
    And I search for 'Global-NEWREFNO' in search bar
    Then All Ref No in SPF Tracking Summary should have data match with expected result
      | Column | Expected                   |
      | Status | PENDING FOR RECOMMENDATION |
