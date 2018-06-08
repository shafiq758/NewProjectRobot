*** Settings ***
Library  Selenium2Library
Resource  keywords/account.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
To validate user is able to change Avatar of a user profile
    [Tags]     C11860
    [Setup]    Setup for login UI
    Navigate to Accounts
    Click on User Profile
    Change Avatar Image    02
    Click Popup Save Button
    # #Should Display Flash Message     User profile has been updated successfully.
    sleep  1s  reason=wait for page to load
    Close Browser 
    [Teardown]    Teardown And Download Diag

To validate user is able to change timing for flash message on screen
    [Tags]     C11861
    [Setup]    Setup for login UI
    Check Flash Message   5
    Check Flash Message   10
    sleep  1s  reason=wait for page to load    
    Close Browser   
    [Teardown]    Teardown And Download Diag

To validate admin is able to update name in Accounts
    [Tags]     C11865
    [Setup]    Setup for login UI
    Navigate to Accounts
    Click on User Profile    
    Input Text                  name=fullname      SHAFIQ
    sleep  1s  reason=wait for page to load
    Click Popup Save Button
    # #Should Display Flash Message     User profile has been updated successfully.
    Navigate to Accounts
    Account Logout
    sleep  20s  reason=wait for page to load
    Login To Web Home Page   ${sbox_web_user}   ${sbox_pass}          
    Close Browser        
    [Teardown]     Teardown And Download Diag  

To verify user should be able to change language of the system
    [Tags]     C11863
    [Setup]    Setup for login UI
    Navigate to Accounts
    Click on User Profile
    Select From List           xpath=//select[@name="language"]    German
    Click Popup Save Button
    # #Should Display Flash Message     User profile has been updated successfully.
    Navigate to Accounts
    Click on User Profile
    Select From List           xpath=//select[@name="language"]    System
    Click Popup Save Button
    # #Should Display Flash Message     Benutzerprofil wurde erfolgreich aktualisiert.
    sleep  2s  reason=wait for page to load    
    Close Browser  
    [Teardown]     Teardown And Download Diag

To validate Password validations for account are implemented correctly
    [Tags]     C11864
    [Setup]    Setup for login UI
    Navigate to Accounts
    Click on User Profile 
    Fill Password Form      wrongpassword     Demo12345    Demo12345     
    Click Button   Save
    # #Should Display Flash Message     Current password is incorrect.
    Fill Password Form      Demo12345      Demo12345    Demo1234
    Click Button   Save
    Element Should Be Visible       id=hideFlash-0
    sleep  1s  reason=wait for page to load
    Fill Password Form      ${sbox_pass}     ${sbox_pass}    ${sbox_pass}
    Click Popup Save Button
    # #Should Display Flash Message     User profile has been updated successfully.
    Close All Browsers     
    [Teardown]     Teardown And Download Diag

*** comments ***
#place test cases that you do not want to test.

