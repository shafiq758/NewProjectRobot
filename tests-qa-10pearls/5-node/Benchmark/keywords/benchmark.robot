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
    Wait Until Element Is Visible    xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]      120s

Login To Home
    Maximize Browser Window
    Click Starter Page
    Input Text                   id=username     admin                #change id here
    Input Text                   id=password     Demo12345            #change password here
    Click Login Button
    Location Should Contain     SOLUTION/root/index            #HOME/solution/index

Navigate to Node
    [Documentation]  Navigate to the Node page. (/SPLUNK/web/index)
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SYSTEM"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/ethernet/index"]   120s

Click on Submenu Benchmark
    sleep  1s      reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/benchmark/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/benchmark/index"]
    Wait Until Element Is Visible   class=description       120s
