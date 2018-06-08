*** Settings ***
Library  Selenium2Library
Resource  keywords/integration.robot

Test Setup  setup browser
Test Teardown  teardown and download diag


*** Test Cases ***
Install generic headless,splunk web headless and custom apps
    [Tags]     C12418,C12419,C12420
    [Setup]   Setup for login UI
    :FOR    ${INDEX}    IN RANGE    1   25
    \   sleep  5s  reason=wait for page to load
    \   Navigate to the Home page
    \   Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s
    \   Wait Until Element Is Visible      xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/context-menu/div/ico      120s
    \   Click Element      xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/context-menu/div/ico
    \   Wait Until Element Is Visible        xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/context-menu/div/div/ng-transclude/ul/li[2]/a       30s 
    \   Click Element      xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/context-menu/div/div/ng-transclude/ul/li[2]/a
    \   Wait Until Element Is Visible    xpath=//*[text()="No logs found."]    20s  #This is the pre condition
    \   Wait Until Element Is Visible   xpath=/html/body/popup-window-object/popup-window/popup-window-container/div/footer/button[2]   30s
    \   Click Element     xpath=/html/body/popup-window-object/popup-window/popup-window-container/div/footer/button[2]
    \   Wait Until Element Is Visible      xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/div[1]/button        30s   
    \   Click Element     xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/div[1]/button
    \   Wait Until Element Is Visible       xpath=/html/body/div[2]/div[1]/form/div[3]    60s
    \   Click Button   Confirm
    \   Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/div[2]/button    1800s   #30 minutes for the launch button to appear
    Close Browser
    [Teardown]    Teardown And Download Diag

Uninstall generic headless,splunk web headless and custom apps
    [Tags]     C12421,C12422,C12423
    [Setup]   Setup for login UI
    :FOR    ${INDEX}    IN RANGE    1   25
    \   sleep  5s  reason=wait for page to load
    \   Navigate to the Home page
    \   Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s
    \   Wait Until Element Is Visible      xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/context-menu/div/ico      120s
    \   Click Element      xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/context-menu/div/ico
    \   Wait Until Element Is Visible        xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/context-menu/div/div/ng-transclude/ul/li[5]/a       30s 
    \   Click Element      xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/context-menu/div/div/ng-transclude/ul/li[5]/a
    \   Wait Until Element Is Visible       xpath=/html/body/div[2]/div[1]/form/div[3]    60s
    \   Click Button   Confirm   
    \   Wait Until Element Is Not Visible   xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[${INDEX}]/div[3]/div[3]/ico   1800s   #30 minutes for the install button to appear
    Close Browser
    [Teardown]    Teardown And Download Diag


