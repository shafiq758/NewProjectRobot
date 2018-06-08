*** Settings ***
Library          Selenium2Library
Resource  ../../../test_resources/web.robot
Resource   ../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Navigate to the Home page
    [Documentation]  Navigate to the Home page. (/SOLUTION/root/index)
    sleep  2s  reason=wait for page to load
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      90
