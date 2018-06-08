*** Settings ***
Library          Selenium2Library
Resource  ../../../test_resources/web.robot
Resource   ../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Navigate to the Home page
    [Documentation]  Navigate to the Home page. (/SOLUTION/root/index)
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]               60s         
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]
    Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s
    
Click Investigator Data Connector Install Button 
    ${present}=  Run Keyword And Return Status    Wait Until Element Is Visible           xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/div[1]/button       120s 
    Run Keyword If    ${present}     Click Element                   xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/div[1]/button  
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div[1]/form/div[2]/h1    60s

Click Investigator Data Connector Launch Button 
    ${present}=  Run Keyword And Return Status    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/div[2]/button   120s
    Run Keyword If    ${present}     Click Element                   xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/div[2]/button 
    Wait Until Element Is Visible    xpath=/html/body/div/div/div/div[1]/segment/table/tbody/tr[1]/th/img                   60s
    
Click Gemini Link
    Click Element        xpath=/html/body/div[1]/div/div/div[1]/segment/table/tbody/tr[4]/td/a
    sleep  5s  reason=wait for browser to open

Error Icon Should Appear
    Wait Until Element Is Visible           xpath=/html/body/div[1]/div/div/div[2]/segment[1]/form/table/tbody/tr[2]/td[2]/ico    30s

Tick Icon Should Appear
    Wait Until Element Is Visible           xpath=/html/body/div[1]/div/div/div[2]/segment[1]/form/table/tbody/tr[2]/td[2]/ico    30s

Click Yes Button on Popup
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    Run Keyword If    ${present}    Click Element     xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    Wait Until Element Is Not Visible           xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]   60s
    sleep  2s  reason=wait for page to load

Click Button on Popup
    [Arguments]
    ...  ${button}
    Wait Until Element Is Visible    xpath=//side-panel-object//side-panel//side-panel-container//footer[@id="action_footer"]       60s
    Click Button    ${button}   
    Wait Until Element Is Not Visible    xpath=//side-panel-object//side-panel//side-panel-container//footer[@id="action_footer"]         60s

Click Create Button
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]
    Run Keyword If    ${present}    Click Element     xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]
    Wait Until Element Is Not Visible    xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]       60s
    sleep  2s  reason=wait for page to load

Click Start Icon on Gemini Catalog Instance
    [Arguments]
    ...  ${no}
    Click Element         xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/actions/a[4]/ico 
    #Wait Until Element Is Visible      xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/description/p[1]          60s
    sleep  20s  reason=wait for page to load

Click Stop Icon on Gemini Catalog Instance
    [Arguments]
    ...  ${no}
    Click Element         xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/actions/a[4]/ico 
    Wait Until Element Is Not Visible      xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/description/p[1]          60s

Click Start Icon
    [Arguments]
    ...  ${no}
    Click Element         xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/actions/a[5]/ico 
    Wait Until Element Is Visible      xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/description/p[1]          60s

Click Stop Icon
    [Arguments]
    ...  ${no}
    Click Element         xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/actions/a[5]/ico 
    Wait Until Element Is Not Visible      xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/description/p[1]          60s

Click Remove Icon
    [Arguments]
    ...  ${no}
    Wait Until Element Is Visible      xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/actions/a[4]/ico          120s   
    Click Element         xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[${no}]/actions/a[4]/ico 
    Wait Until Element Is Visible           xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/p    60s
    Click Yes Button on Popup
    Wait Until Element Is Not Visible         xpath=//*[@id="spinLoaderImage"]    180s
    sleep  2s  reason=wait for instance to be removed

Click Save Button
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div/div[2]/segment[1]/a/button         60s
    Click Element       xpath=/html/body/div[1]/div/div/div[2]/segment[1]/a/button

