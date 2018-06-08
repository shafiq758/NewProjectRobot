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
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/button[2]      120

Navigate to Splunk
    [Documentation]  Navigate to the Splunk page. (/SPLUNK/web/index)
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]   120s

Click Restart Button
    Click Element    xpath=/html/body/div/main/segment[3]/footer/button
    Wait Until Element Is Visible         xpath=//*[@id="btnClose"]                 210s    

Click Close Button
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   id=btnClose
    Run Keyword If    ${present}    Click Button                 id=btnClose
    Wait Until Element Is Visible    xpath=/html/body/div/main/segment[3]/footer/button       120s

Check Splunk Version
    [Arguments]
    ...  ${name}
    Element Should Be Visible   xpath=//table[@class="props"]//tbody//tr//td[text()="${name}"]
