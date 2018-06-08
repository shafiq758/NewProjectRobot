*** Settings ***
Library          Selenium2Library
Resource  ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Navigate to Settings
    [Documentation]  Go to Settings page
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/PLATFORM"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/user/index"]   60s

Click Tab
     [Documentation]
     [Arguments]
    ...  ${text1}
    Under Tab                       ${text1}
    sleep  10s  reason=wait for page to load
    Tab Should Be                   ${text1}


