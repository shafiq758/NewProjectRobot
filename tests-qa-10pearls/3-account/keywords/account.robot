*** Settings ***
Library          Selenium2Library
Resource   ../../../test_resources/web.robot
Resource   ../../0-qa-test_setup/qa-test_setup.robot

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

Navigate to the Home page
    [Documentation]  Navigate to the Home page. (/SOLUTION/root/index)
    sleep  1s  reason=wait for page to load
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/button[2]      90s

Navigate to Accounts
    [Documentation]  Navigate to accounts
    sleep  2s  reason=wait for page to load
    Click Element                   xpath=//aside//aside-wide//a//aside-package[@class="usernav"]
    Wait Until Element Is Visible        xpath=/html/body/aside/aside-menu         90s

Click on User Profile
    [Documentation]  Click on User Profile sub-menu
    Click Element     xpath=/html/body/aside/aside-menu/aside-menuitems/a[1]/aside-menuitem
    Wait Until Element Is Visible       xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    90s

Change Avatar Image
    [Arguments]
    ...  ${imageno}
    Click Element          xpath=//side-panel-object//side-panel//side-panel-container//form//main//section[@id="sectionThumbnail"]//form-row//label//img[@value="${imageno}"]
    sleep  10s  reason=wait to change picture

Click Popup Save Button
    sleep  2s  reason=wait for page to load
    Click Element       xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]
    sleep  3s  reason=wait for page to load
    Wait Until Element Is Not Visible   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[1]  60s

Click Popup Cancel Button
    Click Element       xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]
    Wait Until Element Is Not Visible   xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button[2]  60s

Keep Flash Message
    [Arguments]
    ...  ${popup_time}
    execute javascript  document.getElementById('hideFlash-${popup_time}').click()
    sleep  2s  reason=execute java script
    Click Popup Save Button
    sleep  ${popup_time}s  reason=wait for flash message to disappear
    Element Should Not Be Visible          xpath=//flash[@style="display: none;"]
    sleep  2s  reason=wait for flash message to disappear.

Account Logout
    Click Element                   xpath=/html/body/aside/aside-menu/aside-menuitems/a[2]/aside-menuitem

Fill Password Form
     [Arguments]
    ...  ${password_field1}
    ...  ${password_field2}
    ...  ${password_field3}
    Input Text                  name=current_password        ${password_field1}
    sleep  1s  reason=wait for text to be written
    Input Text                  id=password                  ${password_field2}
    sleep  1s  reason=wait for text to be written
    Input Text                  id=password_confirm          ${password_field3}
    sleep  1s  reason=wait for text to be written

Check Flash Message
    [Arguments]
    ...  ${popup_time}
    Navigate to Accounts
    Click on User Profile
    Keep Flash Message        ${popup_time}       

