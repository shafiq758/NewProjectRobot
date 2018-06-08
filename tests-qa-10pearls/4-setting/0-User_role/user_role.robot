*** Settings ***
Library  Selenium2Library
Resource  keywords/user_role.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
Create a new user role
    [Tags]     C13930
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab   User Permissions
    Check Precondition
    Click Icon By Class             Add
    Wait Until Element Is Visible       name=role_name      30s
    sleep  1s  reason=wait for page to load
    Input Text                          name=role_name      test
    Input Text                          xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[2]/input       Tester
    sleep  1s  reason=wait for page to load 
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[3]/table[1]/tbody/tr[1]/td[3]/label/label 
    sleep  1s  reason=wait for page to load 
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[3]/table[1]/tbody/tr[2]/td[4]/label/label
    sleep  1s  reason=wait for page to load
    Click Save Button
    Should Display Flash Message    User role has been created.
    Close Browser
    [Teardown]    Teardown And Download Diag 

Remove previously created user role
    [Tags]     C13931
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab   User Permissions
    Delete Entry
    Should Display Flash Message    This user role has been removed.
    Close Browser
    [Teardown]    Teardown And Download Diag 

Change default user role settings
    [Tags]     C13933
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab   User Permissions
    Click User Role    group_admin
    Wait Until Element Is Visible        xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[2]/input    60s
    Input Text            xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[2]/input       Group Admin Role
    Click Save Button
    Should Display Flash Message     User role 'Group Admin Role' has been updated.  
    Wait Until Element Is Visible    xpath=/html/body/div/div/main/section/table/tbody/tr[2]/td[2]   10s
    Close Browser
    [Teardown]    Teardown And Download Diag 

Create customized user role by cloning existing default role
    [Tags]     C13932
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab   User Permissions
    Click Element       xpath=/html/body/div/div/main/section/table/tbody/tr[2]/td[4]/a[2]/ico
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[1]/input  60s
    Input Text                          name=role_name      group_user
    Input Text                          xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[2]/input       Group User
    Click Element     xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[3]/table[7]/tbody/tr[1]/td[3]/label/label
    Click Save Button
    Should Display Flash Message    User role has been created.
    Close Browser
    [Teardown]    Teardown And Download Diag  

Change customized user role settings
    [Tags]     C13934
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab   User Permissions
    Click User Role    group_admin
    Wait Until Element Is Visible        xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[2]/input    60s
    Input Text            xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[2]/input       Group User Role
    Select Write Options For Manage License
    Click Save Button
    # #Should Display Flash Message    User role 'Group Admin Role' has been updated.
    Close Browser
    [Teardown]    Teardown And Download Diag 

Remove user role in use should be forbidden
    [Tags]     C13935
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Under Tab    Manager Users
    Click Add Button
    Input Text        name=username    uno
    Input Text        name=fullname    iamuno
    Input Text        id=password      changeme 
    Input Text        id=password_confirm   changeme
    Select From List       role_name    Group User Role
    Click Save Button   
    Should Display Flash Message    User 'uno' has been created successfully.
    Click Tab   User Permissions
    Wait Until Element Is Visible       xpath=/html/body/div/div/main/section/table/tbody/tr[2]/td[text()="1"]    5s
    Under Tab    Manager Users
    Click User Role   uno
    Wait Until Element Is Visible      xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section[1]/form-row[2]/input  30s
    Select From List       role_name    Manager Admin
    Click Save Button   
    Should Display Flash Message    User profile has been updated successfully.
    Click Tab   User Permissions
    Wait Until Element Is Visible       xpath=/html/body/div/div/main/section/table/tbody/tr[2]/td[4]/a[1]/ico   10s
    Close Browser
    [Teardown]    Teardown And Download Diag 

Create user and check access permissions
    [Tags]     C13936
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Under Tab    Manager Users
    Click Add Button
    Input Text        name=username    sbox-test
    Input Text        name=fullname    sbox-test-qa
    Input Text        id=password      password 
    Input Text        id=password_confirm   password
    Select From List       role_name    Manager User
    Click Save Button   
    Should Display Flash Message    User 'sbox-test' has been created successfully.
    Click Element   xpath=/html/body/aside/aside-wide/a/aside-package/img
    Wait Until Element Is Visible   xpath=/html/body/aside/aside-menu/aside-menuitems/a[2]/aside-menuitem       30s
    Click Element     xpath=/html/body/aside/aside-menu/aside-menuitems/a[2]/aside-menuitem
    Login To Home Page    sbox-test     password 
    Location Should Contain     SOLUTION/root/index
    Wait Until Element Is Not Visible    xpath=//aside//aside-wide//aside-packages//a[@href="/SPLUNK"]      30s
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Under Tab    Manager Users
    Click Element    xpath=/html/body/div/div/main/section/actions/a/ico
    Wait Until Element Is Visible          xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button    30s
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button
    Wait Until Element Is Not Visible        xpath=/html/body/side-panel-object/side-panel/side-panel-container/footer/button        30s  
    Close All Browsers
    [Teardown]    Teardown And Download Diag 

