@81
Feature: Logic update for Stock Proposal Summary & Stock Proposal Report

  @111
  Scenario Outline: create spf
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    #When I select 'Status:' in SPF Tracking Summary
    #| Pending for Deliberation Submission |
    And I search for 'SPF/2023/M047/031' in search bar
    And I click to SPF Ref No 'random' in the SPF Tracking Summary table
    #And I get all data from table in SPF Recommendation and Deliberation Submission
    #| Material No |
    #And I go back to the 'ISA' page
    And I click on 'SPF Submission' tab
    And I select '<plant code>' Plan Code - Plan Name
    And I input data into fields in SPF Submission
      | Material No | Lead Time | Estimated Unit Price |
      | <mat>       |        10 |                 1000 |
    And I click on 'Submit' button
    And I click on 'OK' button
    And I click on 'Submit' button
    And I click on 'OK' button
    And I wait and get the Ref No of new SPF Submission
    And I go to site 'MMW - Initial Spare Landing Page'

    #And I search for '' in search bar
    #And I click to SPF Ref No 'Global-NEWREFNO' in the SPF Tracking Summary table
    Examples: 
      | plant code                      | mat      | lead | price |
      | M087 - PGB GPU GP Santong (GPS) | 50624309 |   10 |  1000 |
      | M087 - PGB GPU GP Santong (GPS) | 50624311 |   10 |  1000 |
      | M087 - PGB GPU GP Santong (GPS) | 50624306 |   10 |  1000 |

  #| M087 - PGB GPU GP Santong (GPS)      | 50624308 |   10 |  1000 |
  #| M089 - PGB GPU Utilities Kerteh (UK) | 51318115 |   10 |  1000 |
  #| M089 - PGB GPU Utilities Kerteh (UK) | 51534052 |   10 |  1000 |
  #| M089 - PGB GPU Utilities Kerteh (UK) | 51586023 |   10 |  1000 |
  #| M089 - PGB GPU Utilities Kerteh (UK) | 51534053 |   10 |  1000 |
  #| M089 - PGB GPU Utilities Kerteh (UK) | 51589249 |   10 |  1000 |
  #| M089 - PGB GPU Utilities Kerteh (UK) | 51587144 |   10 |  1000 |
  #| M089 - PGB GPU Utilities Kerteh (UK) | 51585940 |   10 |  1000 |
  #| M089 - PGB GPU Utilities Kerteh (UK) | 51585013 |   10 |  1000 |
  #| M089 - PGB GPU Utilities Kerteh (UK) | 51584912 |   10 |  1000 |
  #| M210 - PETRONAS Chemicals Isononanol | 50931243 |   10 |  1000 |
  #| M210 - PETRONAS Chemicals Isononanol | 51236242 |   10 |  1000 |
  #| M210 - PETRONAS Chemicals Isononanol | 51230894 |   10 |  1000 |
  #| M210 - PETRONAS Chemicals Isononanol | 50931242 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 50533037 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51451835 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 50533004 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51451641 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 50533009 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51451685 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51465752 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51464888 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51465753 |   10 |  1000 |
  #| M055 - PC Polyethylene Sdn Bhd       | 51532145 |   10 |  1000 |
  #| M055 - PC Polyethylene Sdn Bhd       | 51532143 |   10 |  1000 |
  #| M055 - PC Polyethylene Sdn Bhd       | 51532144 |   10 |  1000 |
  #| M055 - PC Polyethylene Sdn Bhd       | 51532146 |   10 |  1000 |
  #| M055 - PC Polyethylene Sdn Bhd       | 51532147 |   10 |  1000 |
  #| M055 - PC Polyethylene Sdn Bhd       | 51532161 |   10 |  1000 |
  #| M055 - PC Polyethylene Sdn Bhd       | 51532148 |   10 |  1000 |
  #| M055 - PC Polyethylene Sdn Bhd       | 51532149 |   10 |  1000 |
  #| M055 - PC Polyethylene Sdn Bhd       | 51532162 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081282 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081285 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51507460 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081280 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081283 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081287 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081251 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081249 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081250 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081284 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081279 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081275 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081276 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081278 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081277 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081272 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081273 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081274 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081281 |   10 |  1000 |
  #| M053 - PC Ethylene Sdn Bhd           | 51081286 |   10 |  1000 |
  #| M085 - PGB GPU GP Kerteh (GPK)       | 51181402 |   10 |  1000 |
  #| M085 - PGB GPU GP Kerteh (GPK)       | 51235128 |   10 |  1000 |
  #| M085 - PGB GPU GP Kerteh (GPK)       | 51181403 |   10 |  1000 |
  #| M085 - PGB GPU GP Kerteh (GPK)       | 51235129 |   10 |  1000 |
  #| M047 - PC Fertilizer Kedah           | 50919163 |   10 |  1000 |
  @222
  Scenario: submit spf
    Given I go to the 'Initial Spare Analyzer' page with 'OPU ENGINEER' role
    Then 'Initial Spare Analyzer' page title should be displayed
    And I get all list of current page
    And I input data to deliberation and submit