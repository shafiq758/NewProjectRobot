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
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      90

Navigate to Splunk
    [Documentation]  Navigate to the Splunk page. (/SPLUNK/web/index) 
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Wait Until Element Is Not Visible   id=spinLoader      90
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      90
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/hunk/index"]   90s

Click on Submenu Apps
    sleep  2s   reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/apps/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SPLUNK/apps/index"]  
    Wait Until Element Is Visible        xpath=/html/body/div/main/section/table/tbody/tr[1]/td[1]/a    90s

Click Desired Name
    [Arguments]
    ...  ${name}
    #xpath=//*[@href="/SPLUNK/conf/index/apps/SplunkForwarder"] 
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//*[@href="/SPLUNK/conf/index/apps/${name}"] 
    Run Keyword If    ${present}     Click Element                   xpath=//*[@href="/SPLUNK/conf/index/apps/${name}"]      
    Wait Until Element Is Visible     xpath=//*[@id="sort_by_name"]   30s

Click Add Button
    sleep  2s   reason=wait for button to load
    Click Element   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    sleep  2s   reason=wait for button to load
    Wait Until Element Is Not Visible   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]        30s

Click Remove Button
    sleep  2s   reason=wait for page to load
    Click Element   xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[1]
    sleep  2s   reason=wait for page to load
    Wait Until Element Is Not Visible   xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[1]       30s

Check If Icon is not Present
    [arguments]
    ...  ${folderName}
    ...  ${iconName}
    Wait Until Element Is Not Visible       xpath=//section//table//tbody//tr[@id="${folderName}"]//td[@class="actions"]//a[@title="${iconName}"]//ico    10s

Check If Folder Icon is Present
    [arguments]
    ...  ${folderName}
    Wait Until Element Is Visible        xpath=//section//table//tbody//tr[@id="${folderName}"]//td//ico[@class="icon _Folder"]   30s

Check If File Icon is Present
    [arguments]
    ...  ${folderName}
    Wait Until Element Is Visible        xpath=//section//table//tbody//tr[@id="${folderName}"]//td//ico[@class="icon _File"]    30s

Click Editor Icon
    [arguments]
    ...  ${Name}
    ...  ${iconName}
    Element Should Be Visible            xpath=//section//table//tbody//tr[@id="${Name}"]//td[@class="actions"]//a[@title="${iconName}"]//ico 
    Click Element                        xpath=//section//table//tbody//tr[@id="${Name}"]//td[@class="actions"]//a[@title="${iconName}"]//ico 
    Wait Until Element Is Visible        xpath=/html/body/side-panel-object/side-panel/side-panel-container/header   10s

Click Delete Editor Icon
    [arguments]
    ...  ${Name}
    ...  ${iconName}
    Element Should Be Visible            xpath=//section//table//tbody//tr[@id="${Name}"]//td[@class="actions"]//a[@title="${iconName}"]//ico 
    Click Element                        xpath=//section//table//tbody//tr[@id="${Name}"]//td[@class="actions"]//a[@title="${iconName}"]//ico 
    Wait Until Element Is Visible        xpath=/html/body/alert-box-object/alert-box/alert-box-container/main   10s

Click Cancel Button
    sleep  2s   reason=wait for button to load
    Click Element          xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[3]
    sleep  2s   reason=wait for button to unload
    Wait Until Element Is Not Visible       xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[3]     30s

