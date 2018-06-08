*** Settings ***
Library  Selenium2Library
Resource  keywords/benchmark.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
Start disk benchmark and wait for report
    [Tags]     C12463
    [Setup]   Setup for login UI
    Navigate to Node     
    Click on Submenu Benchmark
    Wait Until Element Is Visible       xpath=/html/body/div[1]/div/div/span/ico/label         30s
    Click Element     xpath=/html/body/div[1]/div/div/span/ico/label
    Wait Until Element Is Visible      id=partSelect   30s
    Select From List  id=partSelect   dm-0
    Click Button     Run Benchmark
    Wait Until Element Is Visible       xpath=/html/body/div[1]/div/div/div[4]/table/tbody/tr[2]    720s
    Wait Until Element Is Visible       xpath=/html/body/flash/p      120s
    Close Browser 
    [Teardown]    Teardown And Download Diag

Download disk benchmark report
    [Tags]     C12465
    [Setup]   Setup for login UI
    Navigate to Node     
    Click on Submenu Benchmark
    Wait Until Element Is Visible       xpath=/html/body/div[1]/div/div/div[4]/table/tbody/tr[2]/td[4]/context-menu/div/ico        30s 
    Click Icon By Class    ContextButton dropdown-toggle
    Click Element   xpath=/html/body/div[1]/div/div/div[4]/table/tbody/tr[2]/td[4]/context-menu/div/div/ng-transclude/ul/li[1]/a       
    Close Browser 
    [Teardown]    Teardown And Download Diag

Remove disk benchmark report 
    [Tags]     C12466
    [Setup]   Setup for login UI
    Navigate to Node     
    Click on Submenu Benchmark
    Wait Until Element Is Visible       xpath=/html/body/div[1]/div/div/div[4]/table/tbody/tr[2]/td[4]/context-menu/div/ico        30s 
    Click Icon By Class    ContextButton dropdown-toggle
    Click Element    xpath=/html/body/div[1]/div/div/div[4]/table/tbody/tr[2]/td[4]/context-menu/div/div/ng-transclude/ul/li[2]/a
    Wait Until Element Is Visible       xpath=/html/body/flash/p      120s
    Close All Browsers 
    [Teardown]    Teardown And Download Diag


