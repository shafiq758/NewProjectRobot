*** Settings ***
Library  Selenium2Library
Resource  ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Variables ***
${Admin_tab}                   Admin Users
${User_tab}                    User Role

${dummy_name}                  fakeuser
${dummy_fullname}              Fakeuser fakeuser
${dummy_password}              fakepassword
${dummy_confirm_password}      fakepassword

${invalid_html_name}           '</n></t>

${dummy_fake_pasword}          fakepassword123

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Click User Add Button
    Click Element                   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]

Click Save Button
    Click Element                   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]

Click Remove Button
    Click Element                   xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button[1]

Click Reset Button
    Click Element                   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]

Check Flash Message
    sleep  2s  reason=wait for page load
    Click Element                   xpath=//*[@href="#admin"]  #change username here
    sleep  3s  reason=wait for form load
    Element Should Be Visible       id=hideFlash-0
    CheckBox Status Should Be       hideFlash-0    enable
    Element Should Be Visible       name=language

Click Footer And Display Message
     [Arguments]
    ...  ${username}
    Click Element                   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    ${result} =  wait until keyword succeeds  1x  1 sec   Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    Should Display Flash Message    ${username}

Click Toggle By Class
    [Documentation]
    ...  item[0] = toggle clss
    [Arguments]  @{item}
    log  ${item}

    ${locator}=  set variable  xpath=//*toggle-button[@class="${item[0]}"]

    fail if element not exist
    ...  locator=${locator}
    ...  error=Unable to find element locator

    click element  ${locator}

Toggle Button Status Should Be
    [Documentation]
    ...  item[0] = toggle status
    [Arguments]  @{items}
    log  ${items}

    capture page screenshot
    element should be visible
    ...  xpath=//toggle-button[@class="${items[0]}"]

Click Form CheckBox
    [Documentation]
    ...  ${items[0]} = id
    [Arguments]  @{items}
    log  ${items}

    fail if element not exist
    ...  locator=${items[0]}
    ...  error=Unable to find element locator

    click element  xpath=//*[@id="${items[0]}"]

Navigate to Settings
    [Documentation]  Go to Settings page
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/PLATFORM"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/user/index"]   90s  

Navigate to Settings Sub menu Authentication
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/user/index"]
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/PLATFORM/user/index"]                          
    Wait Until Element Is Visible     xpath=//*[@href="#admin"]   90s

Click Tab
     [Documentation]
     [Arguments]
    ...  ${text1}
    Under Tab                       ${text1}
    sleep  5s  reason=wait for page to load
    Tab Should Be                   ${text1}

Click on Table item
    [Documentation]
     [Arguments]
    ...  ${text1}
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//*[@href="#${text1}"]
    Run Keyword If    ${present}    Click Element                   xpath=//*[@href="#${text1}"]
    sleep  12s  reason=wait for page to load

Fill User Form Details With Incorrect User Name
    [Documentation]  Fill the user form details with invalid username
    Input Text                      name=username                ${invalid_html_name}
    sleep  1s  reason=write text 
    Input Text                      name=fullname                ${dummy_fullname}
    sleep  1s  reason=write text
    Input Text                      id=password                  ${dummy_password}
    sleep  1s  reason=write text
    Input Text                      id=password_confirm          ${dummy_confirm_password}
    sleep  1s  reason=page refresh

Fill User Form Details With Incorrect Full Name
    [Documentation]  Fill the user form details with invalid fullname
    Input Text                      name=username          ${dummy_name}
    sleep  1s  reason=write text
    Input Text                      name=fullname          ${invalid_html_name}
    sleep  1s  reason=write text 
    Input Text                      id=password            ${dummy_password}
    sleep  1s  reason=write text
    Input Text                      id=password_confirm    ${dummy_confirm_password}
    sleep  1s  reason=page refresh

Fill Password Form
    Input Text                      name=current_password    ${dummy_fake_pasword} 
    sleep  2s  reason=write text    
    Input Text                      id=password              ${dummy_password}
    sleep  2s  reason=write text
    Input Text                      id=password_confirm      ${dummy_password}
    sleep  2s  reason=page refresh

Allow Login Toggle Verification
    [Documentation]
     [Arguments]
    ...  ${text1}
    ...  ${text2}
    Click Element                   xpath=/html/body/div/div/main/section/table/tbody/tr[1]/td[1]/a 
    sleep  10s  reason=wait for form load
    Input Text                      name=current_password      ${text1} 
    Input Text                      name=password              ${text2}        
    Click Save Button
    sleep  1s  reason=wait for flash load
    Should Display Flash Message    Failed to set new password.


Allow Reset functionality
    Click Element                   xpath=/html/body/div/div/main/section/table/tbody/tr[1]/td[1]/a 
    sleep  10s  reason=wait for form load
    Click Reset Button
    Should Display Popup Form       alert-box-container    Are you sure?  2
    sleep  5s  reason=to verify form
    # This is for pressing cancel button.
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button
    Run Keyword If    ${present}    Click Element                   xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/button


Allow Default Reset functionality
    Click Element                   xpath=/html/body/div/div/main/section/table/tbody/tr[1]/td[1]/a 
    sleep  10s  reason=wait for form load
    Click Reset Button
    Should Display Popup Form       alert-box-container    Are you sure?  2
    sleep  5s  reason=wait for form to load
    Click Element    xpath=/html/body/alert-box-object/alert-box/alert-box-container/footer/a/button
    Should Display Flash Message    Password of user 'hadoop' has been reset to 'popular fully apple hello'.


Check Cancel Button Functionality
    Click Button   Cancel  
    sleep  10s  reason=wait for form to close
    Element Should Not Be Visible          id=form_profile  11

Create User
    [Arguments]
    ...  ${text1}
    ...  ${text2}
    Click Icon By Class              Add
    sleep  10s  reason=wait for form load
    Input Text                       name=role_name                ${text1} 
    #Input Text                      name=description              ${text2}     # Getting an error elementnotinteractable although provided valid name. 
    Click Save Button
    sleep  1s  reason=wait for flash to load 
    Should Display Flash Message    User role has been created.

Change Permission
    Click Element     xpath=/html/body/div/div/main/section/table/tbody/tr[9]/td[1]/a
    sleep  5s  reason=wait for form to load
    Click Form CheckBox     LICENSE.Status_1
    sleep  1s  reason=wait for checkbox
    Click Save Button
    Click Element     xpath=/html/body/div/div/main/section/table/tbody/tr[9]/td[1]/a
    sleep  5s  reason=wait for form to load
    CheckBox Status Should Be       LICENSE.Status_1    enable
    sleep  2s  reason=wait for form to load
     # This is for pressing cancel button.
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]
    Run Keyword If    ${present}    Click Element                   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]          
    

Duplicate Role
    Click Element                    xpath=/html/body/div/div/main/section/table/tbody/tr[10]/td[4]/a[2]/ico 
    sleep  5s  reason=wait for form to load

Delete Role
    Click Element                    xpath=/html/body/div/div/main/section/table/tbody/tr[10]/td[4]/a[1]/ico 
    sleep  5s  reason=wait for form to load

Allow Login Toggle
    Click Element                   xpath=/html/body/div/div/main/section/table/tbody/tr[1]/td[1]/a  # Select first OS User 
    Wait Until Element Is Visible                   xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/h2/a/toggle-button    30s
    Click Element      xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/h2/a/toggle-button   
    sleep  10s  reason=wait for page to load
    Click Element                   xpath=/html/body/div/div/main/section/table/tbody/tr[1]/td[1]/a   # Select first OS User 
    Wait Until Element Is Visible                   xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/h2/a/toggle-button    30s
    Toggle Button Status Should Be     off
    sleep  3s  reason=wait for form to load
    Click Save Button
    sleep  2s  reason=wait for form to load
    
Check Login Column Status
    Wait Until Element Is Visible     xpath=/html/body/div/div/main/section/table/tbody/tr[1]/td[text()="No"]         5s
  
Check LDAP Resource
    Wait Until Element Is Visible     xpath=/html/body/div/div/main/segment[2]/table/tbody/tr/td[1]/a[@href="#"]      5s
    Click Element                     xpath=/html/body/div/div/main/segment[2]/table/tbody/tr/td[1]/a[@href="#"]
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[6]/label/label           10s

Enable LDAP Authentication
     ${present}=  Run Keyword And Return Status     Element Should Be Visible   xpath=/html/body/div/div/main/segment[1]/h2/a/toggle-button[@class="off"]
     Run Keyword If    ${present}   Click Element   xpath=/html/body/div/div/main/segment[1]/h2/a/toggle-button
     Wait Until Element Is Visible  xpath=/html/body/div/div/main/segment[1]/h2/a/toggle-button[@class="on"]    30s
    
