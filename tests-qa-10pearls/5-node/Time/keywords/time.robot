*** Settings ***
Library          Selenium2Library
Resource  ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Navigate to Node
    [Documentation]  Navigate to the Node page. (/SPLUNK/web/index)
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SYSTEM"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/ethernet/index"]   120s

Click on Add NTP Server
    ${present}=  Run Keyword And Return Status      Wait Until Element Is Visible   xpath=/html/body/div/main/section[3]/actions/a/ico   5s     
    Run Keyword If    ${present}    Click Element   xpath=/html/body/div/main/section[3]/actions/a/ico
    ${present}=  Run Keyword And Return Status      Element Should Be Visible   xpath=/html/body/div/main/section[3]/info/a/ico
    Run Keyword If    ${present}    Click Element   xpath=/html/body/div/main/section[3]/info/a/ico
    Wait Until Element Is Visible           xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[1]/input   30s

Click Add Button
    Click Element   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    Wait Until Element Is Not Visible    xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]       60s
