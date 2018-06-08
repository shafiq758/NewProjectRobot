*** Settings ***
Library          Selenium2Library
Resource  ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Navigate to the Home page
    [Documentation]  Navigate to the Home page. (/SOLUTION/root/index)
    sleep  1s  reason=wait for page to load
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]
    Wait Until Element Is Visible   xpath=xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      90

Navigate to Splunk
    [Documentation]  Navigate to the Splunk page. (/SPLUNK/web/index) 
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Wait Until Element Is Not Visible   id=spinLoader      90
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      90
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]   90s

Click on Submenu Web Interface
    Wait Until Element Is Visible         xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/web/index"]        60s
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/web/index"] 
    Run Keyword If    ${present}     Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/web/index"]  
    Wait Until Element Is Visible    name=httpport         60s 

Click Cancel Button
    sleep  3s  reason=Let the pop up disappear
    Click Element                   xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[2]
    sleep  1s  reason=Let the pop up disappear
    Wait Until Element Is Not Visible   xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[2]  60s
