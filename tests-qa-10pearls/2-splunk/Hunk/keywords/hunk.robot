*** Settings ***
Library  Selenium2Library
Resource  ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Go To /SPLUNK/instance/index
    [Documentation]  Go to Splunk -> Daemon configuration page. (/SPLUNK/instance/index)
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]   90s

Click Add Button
    Click Element       xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    sleep  2s  reason=Let the page load

Click Cancel Button
    sleep  3s  reason=Let the pop up disappear
    Click Element       xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]
    sleep  1s  reason=Let the pop up disappear
    Wait Until Element Is Not Visible   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]  60s

Navigate to Hunk in Splunk
    [Documentation]  Navigate to Hunk in Splunk
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]   90s

    #For menu inside menu
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]                          
    sleep  10s  reason=Let the page load
