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

Click on Submenu SNMP
    sleep  2s      reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/snmp/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/snmp/index"]
    Wait Until Element Is Visible       xpath=//*[@id="tb_snmp"]                                 180s

Activate Precondition
    ${present}=  Run Keyword And Return Status     Element Should Be Visible   xpath=//*[@class="off"]
    Run Keyword If    ${present}    Click Element               xpath=//*[@id="tb_snmp"]
    Wait Until Element Is Visible   xpath=//*[@class="on"]     30s  

Click Add SNMP Agent
    ${present}=  Run Keyword And Return Status   Wait Until Element Is Visible  xpath=//*[@id="ico_new_agent"]   10s
    Run Keyword If    ${present}    Click Element   xpath=//*[@id="ico_new_agent"] 
    ${present}=  Run Keyword And Return Status   Wait Until Element Is Visible  xpath=//*[@id="ico_add_agent"]   1s
    Run Keyword If    ${present}    Click Element   xpath=//*[@id="ico_add_agent"] 
    Wait Until Element Is Visible      xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section[1]/form-row[1]/input    30s

Click Add Button
    Click Element   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    Wait Until Element Is Not Visible    xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]       60s

Click Tab Trap Destination
    [Documentation]  Selects the tab bonding
    Wait Until Element Is Visible    xpath=/html/body/div/tabs/tabs-wrapper/tab          120s
    Click Element   xpath=/html/body/div/tabs/tabs-wrapper/a[2]/tab    
    ${present}=  Run Keyword And Return Status   Wait Until Element Is Visible   xpath=/html/body/div/div/main/section/info/a/ico   20s

Click Add Trap
    ${present}=  Run Keyword And Return Status   Wait Until Element Is Visible   xpath=//*[@id="ico_new_notification"]   10s
    Run Keyword If    ${present}    Click Element        xpath=//*[@id="ico_new_notification"]
    ${present}=  Run Keyword And Return Status   Wait Until Element Is Visible   xpath=//*[@id="ico_add_notification"]   10s
    Run Keyword If    ${present}    Click Element        xpath=//*[@id="ico_add_notification"]
    Wait Until Element Is Visible      xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[1]/input          60s

Click Destroy
    Click Element      xpath=/html/body/div/div/main/section/table/tbody/tr/td[5]/a/ico
    Wait Until Element Is Visible     xpath=/html/body/alert-box-object/alert-box/alert-box-container/main/section  30s
    Click Element   xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/a/button






