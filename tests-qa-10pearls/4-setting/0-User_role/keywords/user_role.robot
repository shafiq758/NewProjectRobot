*** Settings ***
Library      Selenium2Library
Library      String
Resource   ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Navigate to Settings
    [Documentation]  Go to Settings page
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/PLATFORM"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/user/index"]   60s  

Navigate to Settings Sub menu Authentication
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/user/index"]
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/user/index"]                          
    Wait Until Element Is Visible     xpath=//*[@href="#admin"]   60s

Click Tab
    [Documentation]
    [Arguments]
    ...  ${text1}
    Click Element     xpath=/html/body/div/tabs/tabs-wrapper/a[1]/tab
    #Under Tab                       ${text1}
    ${present}=  Run Keyword And Return Status      Wait Until Element Is Visible   xpath=/html/body/div/div/main/section/actions/a/ico   15s
    sleep  2s  reason=wait for page to load
    #Run Keyword If    ${present}   Tab Should Be                   ${text1}

Check Precondition
    Element Should Be Visible         xpath=//*[@href="#supervisor"]
    Element Should Not Be Visible     xpath=/html/body/div/div/main/section/table/tbody/tr[9]/td[1]/a

Click Save Button
    Wait Until Element Is Visible        xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]    20s
    Click Element       xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]

Delete Entry
    Click Element     xpath=/html/body/div/div/main/section/table/tbody/tr[9]/td[4]/a[1]/ico
    Wait Until Element Is Visible       xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[1]    30s
    Click Element         xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[1]    
    Wait Until Element Is Not Visible   xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[1]    30s

Click User Role
    [Arguments]
    ...  ${user}
    Click Element     xpath=//*[@href="#${user}"]
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[1]/input   30s

Select Write Options For Manage License
     :FOR   ${INDEX}    IN  1  2  3  4
     \   Click Element  xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[3]/table[1]/tbody/tr[${INDEX}]/td[4]/label/label 

Click Add Button
    Click Element    xpath=/html/body/div/div/main/section/actions/a/ico
    Wait Until Element Is Visible      xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section[1]/form-row[1]/input       30s




