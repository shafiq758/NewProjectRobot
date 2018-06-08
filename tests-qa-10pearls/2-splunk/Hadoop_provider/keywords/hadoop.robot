*** Settings ***
Library          Selenium2Library
Resource  ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Click Starter Page
    [Documentation]  For starting page
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=/html/body/main/card/banner/footer/button
    Run Keyword If    ${present}   Click Element               xpath=/html/body/main/card/banner/footer/button

Click Login Button
    ${present}=  Run Keyword And Return Status     Element Should Be Visible    xpath=/html/body/main/card/footer/button
    Run Keyword If    ${present}   Click Element               xpath=html/body/main/card/footer/button
    ${present}=  Run Keyword And Return Status     Element Should Be Visible   xpath=/html/body/main/card/footer/next/button
    Run Keyword If    ${present}   Click Element               xpath=/html/body/main/card/footer/next/button
    Wait Until Element Is Visible    xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]      60s

Login To Home
    Maximize Browser Window
    Click Starter Page
    Input Text                   id=username     admin                #change id here
    Input Text                   id=password     Demo12345            #change password here
    Click Login Button
    Location Should Contain     SOLUTION/root/index            #HOME/solution/index

Navigate to the Home page
    [Documentation]  Navigate to the Home page. (/SOLUTION/root/index)
    sleep  1s  reason=wait for page to load
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      90

Navigate to Splunk
    [Documentation]  Navigate to the Splunk page. (/SPLUNK/web/index) 
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Wait Until Element Is Not Visible   id=spinLoader      90
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      90
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]   90s

Click on Submenu Splunk Diag
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/diag/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/diag/index"]  
    Wait Until Element Is Visible        id=view-wrap    60s

Click on Submenu Config Editor
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/conf/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/conf/index"]  
    Wait Until Element Is Visible        xpath=/html/body/div/main/section/breadcrumb/a[text()="$SPLUNK_HOME/etc"]    120s

Click on Submenu Hunk
    sleep  2s   reason=wait for page to load
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]   90s
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]
    Wait Until Element Is Visible        id=view-wrap    60s

Click on Submenu Apps
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/apps/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/apps/index"]  
    Wait Until Element Is Visible        id=view-wrap    60s

Click Desired Name
    [Arguments]
    ...  ${name} 
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//*[@href="/SPLUNK/conf/index/apps/${name}"] 
    Run Keyword If    ${present}     Click Element                   xpath=//*[@href="/SPLUNK/conf/index/apps/${name}"]      
    Wait Until Element Is Visible    xpath=//*[@id="sort_by_name"]   30s
