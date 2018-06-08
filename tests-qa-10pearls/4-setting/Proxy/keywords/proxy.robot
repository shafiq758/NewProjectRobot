*** Settings ***
Library  Selenium2Library
Resource  ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Navigate to Settings
    [Documentation]  Go to Settings page
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/PLATFORM"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/user/index"]   60s  

Navigate to Settings Sub menu Proxy
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/proxy/index"]
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/proxy/index"]                          
    Wait Until Element Is Visible     xpath=/html/body/div/main/section[2]/form/form-row[1]/selectwrapper/select   60s

Click Tab
     [Documentation]
     [Arguments]
    ...  ${text1}
    Under Tab                       ${text1}
    sleep  5s  reason=wait for page to load
    Tab Should Be                   ${text1}

Click On Verify
    Click Element      xpath=/html/body/div/main/section[2]/footer/button[2]

Click On Save
    Click Element      xpath=/html/body/div/main/section[2]/footer/button[1]

Enable HTTP proxy
     ${present}=  Run Keyword And Return Status     Element Should Be Visible   xpath=/html/body/div/main/section[1]/h2/a/toggle-button[@class="off"]
     Run Keyword If    ${present}   Click Element   xpath=/html/body/div/main/section[1]/h2/a/toggle-button
     Wait Until Element Is Visible  xpath=/html/body/div/main/section[1]/h2/a/toggle-button[@class="on"]    30s
    
Disable HTTP proxy
     ${present}=  Run Keyword And Return Status     Element Should Be Visible   xpath=/html/body/div/main/section[1]/h2/a/toggle-button[@class="on"]
     Run Keyword If    ${present}   Click Element   xpath=/html/body/div/main/section[1]/h2/a/toggle-button
     Wait Until Element Is Visible  xpath=/html/body/div/main/section[1]/h2/a/toggle-button[@class="off"]    30s



