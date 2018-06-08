*** Settings ***
Library          Selenium2Library
Resource  ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Navigate to the Home page
    [Documentation]  Navigate to the Home page. (/SOLUTION/root/index)
    sleep  2s  reason=wait for page to load
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      90

Navigate to Splunk
    [Documentation]  Navigate to the Splunk page. (/SPLUNK/web/index) 
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Wait Until Element Is Not Visible   id=spinLoader      90
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      90
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]   90s

Click on Submenu Config Editor
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/conf/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/conf/index"]  
    Wait Until Element Is Visible        xpath=/html/body/div/main/section/breadcrumb/a[text()="$SPLUNK_HOME/etc"]    120s

Click Table Item
    [arguments]
    ...  ${folderName}
    Click Element       xpath=//table//tbody//tr//td//a[@href="/SPLUNK/conf/index/${folderName}"]
    Wait Until Element Is Visible       xpath=/html/body/div/main/section/breadcrumb/separator     60s

Click on Submenu Apps
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/apps/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/apps/index"]  
    Wait Until Element Is Visible        xpath=/html/body/div/main/section/table/tbody/tr[1]/td[1]/a    60s

Click on Submenu Versioning
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/versioning/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/versioning/index"]  

Click Desired Name
    [Arguments]
    ...  ${name}
    ${present}=  Run Keyword And Return Status    Wait Until Element Is Visible   xpath=//*[@href="/SPLUNK/conf/index/apps/${name}"]    60s
    Run Keyword If    ${present}     Click Element                   xpath=//*[@href="/SPLUNK/conf/index/apps/${name}"]      
    Wait Until Element Is Visible     xpath=//*[@id="sort_by_name"]   30s

Click Add Button
    sleep  2s   reason=wait for button to load
    Click Element   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    sleep  2s   reason=wait for button to load
    Wait Until Element Is Not Visible   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]        30s

Click Element Icon Of
    [Documentation]   Used for the first two icons namely Copy and Move of table entries
    [arguments]
    ...  ${fileName}
    ...  ${operation}
    Click Element       xpath=//section//table//tbody//tr[@id="${fileName}"]//td[5]//a//ico[@class="icon File${operation}"]
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]    60s

Click Copy Button
    sleep  2s   reason=wait for page to load
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]    60s
    Click Element     xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]

Click Add New Folder
    sleep  2s   reason=wait for page to load
    Wait Until Element Is Visible         xpath=//*[@id="new_folder_btn"]          60s
    Click Element       xpath=//*[@id="new_folder_btn"]
    Wait Until Element Is Visible        xpath=//*[@id="new_folder"]              60s

Click Folder
    [arguments]
    ...  ${folderName}
    Wait Until Element Is Visible        xpath=//side-panel-object//side-panel//side-panel-container//main//section//table//tbody//tr//td//a[text()="${folderName}"]             60s
    Click Element      xpath=//side-panel-object//side-panel//side-panel-container//main//section//table//tbody//tr//td//a[text()="${folderName}"]

Click Move Button
    sleep  2s   reason=wait for page to load
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]    60s
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
 
Click Rename Button
    sleep  2s   reason=wait for page to load
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]    60s
    Click Element     xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]

Click Rename Icon Of
    [Documentation]   Used for Rename icon of table entries
    [arguments]
    ...  ${fileName}
    ...  ${operation}
    Click Element       xpath=//section//table//tbody//tr[@id="${fileName}"]//td[5]//a//ico[@class="icon ${operation}"]
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]    60s

Click Delete Icon of
    [arguments]
    ...  ${fileName}
    ...  ${operation}
    Click Element       xpath=//section//table//tbody//tr[@id="${fileName}"]//td[5]//a//ico[@class="icon ${operation}"]
    Wait Until Element Is Visible     xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[1]    60s

Click Remove Sidepanel Button
    [arguments]
    ...  ${buttonName}
    Click Element     xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[text()="${buttonName}"]

