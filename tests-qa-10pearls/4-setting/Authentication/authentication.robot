*** Settings ***
Library  Selenium2Library
Resource  keywords/authentication.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
Verify Allow login toggle button functionality
    [Tags]     C5284
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    OS Users
    # #Make sure the toggle is switched on.
    Allow Login Toggle
    sleep  5s  reason=wait for page to load     
    Close Browser 
    [Teardown]   Teardown And Download Diag 

Verify that Allow login status on Authentication page grid
    [Tags]     C5286
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    OS Users
    Check Login Column Status
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify that after clicking on Username, User details opens successfully
    [Tags]     C4874
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click on Table item    admin
    Should Display Popup Form
    Click Save Button
    Close Browser
    [Teardown]    Teardown And Download Diag 
    

Verify Username field validation by entering HTML tags
    [Tags]     C4925
    [Timeout]  480
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click Icon By Class             Add
    sleep  7s  reason=wait for page to load
    Fill User Form Details With Incorrect User Name         
    Click Save Button
    Should Display Flash Message    Invalid username.
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify Full Name field validation by entering HTML tags
    [Tags]     C4927
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click Icon By Class             Add
    sleep  7s  reason=wait for page to load
    Fill User Form Details With Incorrect Full Name
    Click Save Button
    Should Display Flash Message     User 'fakeuser' has been created successfully.
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify updated avatar is appearing with Username
    [Tags]     C4930
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click Element     xpath=//*[@href="#admin"]
    sleep  10s  reason=wait for page to load
    Input Text                      name=current_password               Demo12345
    sleep  1s  reason=write text 
    Input Text                      id=password                         Demo12345
    sleep  1s  reason=write text
    Input Text                      id=password_confirm                 Demo12345
    sleep  1s  reason=page refresh
    Click Element  xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section[2]/form-row/label[4]/img
    sleep  2s  reason=page refresh
    Click Save Button
    Should Display Flash Message    User profile has been updated successfully.
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify Current password field validation
    [Tags]     C4928
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click on Table item    admin
    Fill Password Form
    Click Save Button
    Should Display Flash Message    Current password is incorrect.
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify Advanced Settings
    [Tags]     C4923
    [Timeout]  360
    [Setup]   Setup for login UI
    sleep  2s  reason=wait for page to load
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click on Table item    admin
    sleep  5s  reason=wait for form to load
    Element Should Be Visible       id=hideFlash-0
    CheckBox Status Should Be       hideFlash-0    enable
    Element Should Be Visible       name=language
    sleep  3s  reason=wait for page to load
    Click Save Button
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify Name field validation by entering HTML tags
    [Tags]     C4935
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    User Permissions
    Click Icon By Class             Add
    sleep  7s  reason=wait for page to load
    Input Text                        name=role_name      '</n></t> 
    Input Text                       xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[2]/input    Test 
    sleep  1s  reason=wait for page to load 
    Click Save Button
    sleep  1s  reason=wait for page to load
    # #Should Display Flash Message    Invalid role name, can accept alphanumeric only.
    Close Browser
    [Teardown]    Teardown And Download Diag 

    
Verify Description field validation by entering HTML tags
    [Tags]     4937
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    User Permissions
    Click Icon By Class             Add
    sleep  7s  reason=wait for page to load
    Input Text                          name=role_name      Test123
    Input Text                       xpath=/html/body/side-panel-object/side-panel/side-panel-container/form/main/section/form-row[2]/input    '</n></t>  
    sleep  1s  reason=wait for page to load 
    Click Save Button
    sleep  7s  reason=wait for page to load
    # #Should Display Flash Message    Invalid description, can accept alphanumeric only.
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify Current Password field validation by inserting HTML tags
    [Tags]     C5288
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    OS Users
    Allow Login Toggle Verification    <n><t>     Test
    sleep  7s  reason=wait for page to load
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify Password field validation by inserting HTML tags
    [Tags]     C5289
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    OS Users
    Allow Login Toggle Verification     Test    <n><t>    
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify that proper validation is appearing when user enter wrong Current Password
    [Tags]     C5290
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    OS Users
    Allow Login Toggle Verification     Test    Test    
    sleep  7s  reason=wait for page to load
    Close Browser
    [Teardown]   Teardown And Download Diag 

    
Verify Reset Password button functionality
    [Tags]     C5291
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    OS Users
    Allow Reset functionality
    sleep  7s  reason=wait for page to load
    Close Browser
    [Teardown]   Teardown And Download Diag 


Verify reset to default password functionality
    [Tags]     C5293
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    OS Users
    Allow Default Reset functionality
    sleep  7s  reason=wait for page to load
    Close Browser
    [Teardown]    Teardown And Download Diag 
    

Verify cancel button functionality on User information screen
    [Tags]     C4933
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click on Table item    admin
    sleep  10s  reason=wait for form to load
    Check Cancel Button Functionality 
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify user is able to create new user role
    [Tags]     C4934
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    User Permissions
    Create User                   Dummy         No Description
    sleep  7s  reason=wait for page to load
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify user is able to change permissions
    [Tags]     C4949
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    User Permissions
    Change Permission    
    sleep  7s  reason=wait for page to load
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify user is not able to duplicate role 
    [Tags]     C4952
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    User Permissions
    Duplicate Role
    Click Save Button
    sleep  1s  reason=wait for flash to load  
    Should Display Flash Message    User role already existed. 
    Close Browser    
    [Teardown]    Teardown And Download Diag 


Verify user is able to delete role 
    [Tags]     C4953
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    User Permissions
    Delete Role
    Click Remove Button
    sleep  1s  reason=wait for flash to load  
    Should Display Flash Message    This user role has been removed.
    Close Browser    
    [Teardown]    Teardown And Download Diag 


Verify that flash message is appearing as per advanced settings for Admin
    [Tags]     C8066
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click on Table item    admin
    sleep  5s  reason=wait for form to load
    execute javascript  document.getElementById('hideFlash-5').click()
    sleep  1s  reason=execute java script
    Click Save Button
    sleep  5s  reason=wait for flash message to disappear
    Element Should Not Be Visible          xpath=//flash[@style="display: none;"]
    Close Browser
    [Teardown]    Teardown And Download Diag 

    
Verify that flash message is appearing as per advanced settings for Admin for User
    [Tags]     C8074
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click on Table item    fakeuser
    sleep  5s  reason=wait for form to load
    execute javascript  document.getElementById('hideFlash-5').click()
    sleep  1s  reason=execute java script
    Click Save Button
    sleep  5s  reason=wait for flash message to disappear
    Element Should Not Be Visible          xpath=//flash[@style="display: none;"]
    Close Browser
    [Teardown]    Teardown And Download Diag 

Verify add user functionality 
    [Tags]     C8067
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    Manager Users
    Click Icon By Class             Add
    sleep  7s  reason=wait for page to load
    Input Text                      name=username          test
    sleep  1s  reason=write text
    Input Text                      name=fullname          test Test
    sleep  1s  reason=write text 
    Input Text                      id=password            test123
    sleep  1s  reason=write text
    Input Text                      id=password_confirm    test123
    sleep  3s  reason=page refresh
    Click Save Button
    sleep  2s  reason=page refresh
    Should Display Flash Message    User 'test' has been created successfully.
    sleep  7s  reason=wait for page to load
    Close Browser
    [Teardown]    Teardown And Download Diag 


Verify that User is able to Login with admin defined language 
    [Tags]     C8075
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click on Table item    admin
    Select From List           xpath=//select[@name="language"]    German
    Click Save Button
    # #Should Display Flash Message     User profile has been updated successfully.
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click on Table item    admin
    Select From List           xpath=//select[@name="language"]    System
    Click Save Button
    # #Should Display Flash Message     Benutzerprofil wurde erfolgreich aktualisiert.
    sleep  2s  reason=wait for page to load    
    Close Browser  
    [Teardown]    Teardown And Download Diag 

Configure LDAP Settings
    [Tags]     C3525
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    LDAP
    Enable LDAP Authentication
    Click Icon By Class   Add
    Wait Until Element Is Visible    name=name   10s     
    Input Text   name=name       openldap
    Input Text   name=base_dn    dc=example,dc=com
    Input Text   name=uid_attr   cn
    Input Text   name=host       ldap.forumsys.com
    Input Text   name=port       389
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[7]/label/label  
    Click Button   Add
    Should Display Flash Message    LDAP resource has been created successully.
    Close Browser
    [Teardown]    Teardown And Download Diag

To validate admin is able enable/disable SSL for already created LDAP Resource
    [Documentation]  LDAP resource must be configured
    [Timeout]  360
    [Tags]     C9857
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    LDAP
    Check LDAP Resource  
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[6]/label/label    
    sleep  1s  reason=wait for page to load
    Click Save Button
    Should Display Flash Message    LDAP resource has been updated. 
    Check LDAP Resource  
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[6]/label/label    
    sleep  1s  reason=wait for page to load
    Click Save Button
    Should Display Flash Message    LDAP resource has been updated.
    Close Browser
    [Teardown]    Teardown And Download Diag 

# These test cases need to be remodelled. 
User should not be able to Login if incorrect port is set for LDAP resource
    [Tags]     C9861
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    LDAP
    Check LDAP Resource  
    Input Text                  name=port     38
    sleep  2s  reason=wait for page to load
    Click Save Button
    # #An error message should be displayed rather.
    Should Display Flash Message    LDAP resource has been updated.  
    Close Browser
    [Teardown]    Teardown And Download Diag 

User should not be able to Login if incorrect Host is set for LDAP resource
    [Tags]     C9858
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    LDAP
    Check LDAP Resource  
    Input Text                  name=host     100112
    sleep  2s  reason=wait for page to load
    Click Save Button
    # #An error message should be displayed rather.
    Should Display Flash Message    LDAP resource has been updated.  
    Close Browser
    [Teardown]    Teardown And Download Diag 
    
User should not be able to Login if incorrect Base DN is set for LDAP resource
    [Tags]     C9863
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    LDAP
    Check LDAP Resource  
    Input Text                  name=base_dn     fjhdhkhehdiu
    sleep  2s  reason=wait for page to load
    Click Save Button
    # #An error message should be displayed rather.
    Should Display Flash Message    LDAP resource has been updated. 
    Close Browser
    [Teardown]    Teardown And Download Diag 

User should not be able to Login if incorrect Login Attribute is set for LDAP resource
    [Tags]     C9861
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    LDAP
    Check LDAP Resource  
    Input Text                  name=uid_attr     uuid
    sleep  2s  reason=wait for page to load
    Click Save Button
    # #An error message should be displayed rather.
    Should Display Flash Message    LDAP resource has been updated. 
    Close Browser
    [Teardown]   Teardown And Download Diag 

Special characters should not be allowed in Port and Host field
    [Tags]     C9864
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    LDAP
    Check LDAP Resource  
    Input Text                  name=host     +-
    sleep  2s  reason=wait for page to load
    Input Text                  name=port     +-
    Click Save Button
    Should Display Flash Message    Invalid parameter.
    Close Browser
    [Teardown]    Teardown And Download Diag 
    
Boundary value analysis for LDAP Resource form
    [Timeout]  360
    [Tags]     C9866
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Authentication
    Click Tab    LDAP
    Check LDAP Resource  
    Input Text                  name=uid_attr     uuidcsujcbjhasbcjbscbajbhcjhBjhbhcdhbjhvghvhgvcfcf
    sleep  2s  reason=wait for page to load
    Click Save Button
    # #An error message should be displayed rather.
    Should Display Flash Message    LDAP resource has been updated.
    Close All Browsers
    [Teardown]    Teardown And Download Diag  

*** comments ***
#Place test cases that you do not want to test.

