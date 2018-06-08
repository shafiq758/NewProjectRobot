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

Click on Submenu Monitoring
    sleep  2s      reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/adminlog/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/adminlog/index"]
    Wait Until Element Is Visible   xpath=/html/body/div/tabs/tabs-wrapper/tab   60s

Click Add Forwarding Rule
    ${present}=  Run Keyword And Return Status   Wait Until Element Is Visible  xpath=//*[@id="ico_new_rule"]   10s
    Run Keyword If    ${present}    Click Element   xpath=//*[@id="ico_new_rule"] 
    ${present}=  Run Keyword And Return Status   Wait Until Element Is Visible  xpath=//*[@id="ico_add_rule"]   10s
    Run Keyword If    ${present}    Click Element   xpath=//*[@id="ico_add_rule"] 
    Wait Until Element Is Visible      xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section[1]/form-row[1]/input    30s

Click Add Button
    Click Element   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    Wait Until Element Is Not Visible    xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]       60s

Click Tab System Log Forwarding
    Wait Until Element Is Visible    xpath=/html/body/div/tabs/tabs-wrapper/tab          120s
    Click Element   xpath=/html/body/div/tabs/tabs-wrapper/a[1]/tab    
    ${present}=  Run Keyword And Return Status   Wait Until Element Is Visible   xpath=/html/body/div/div/main/section/info/a/ico   20s
