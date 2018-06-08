*** Settings ***
Library  Selenium2Library
Resource  keywords/admin_web.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***   
Change Admin Web listening port
    [Tags]     C1094
    [Setup]   Setup for login UI
    Navigate to Settings
    Click Tab    Admin Web
    Input Text   id=socket_port   443
    Click Button   Save
    Should Display Flash Message     Change has been saved.
    Close Browser 
    [Teardown]    Teardown And Download Diag  

Admin web listening port input invalid port number should fail
    [Tags]     C4869
    [Setup]   Setup for login UI
    Navigate to Settings
    Click Tab    Admin Web
    Input Text   id=socket_port   -8
    Click Button   Save
    Should Display Flash Message     Invalid port number. It must between 1 and 65535.
    Close Browser 
    [Teardown]    Teardown And Download Diag 
    
Change Admin Web language
    [Tags]     C3033
    [Setup]   Setup for login UI
    Navigate to Settings
    Click Tab    Admin Web
    Select From List   name=language   English (United States)
    Click Button   Save
    Should Display Flash Message     Change has been saved.
    Close Browser 
    [Teardown]    Teardown And Download Diag  

Admin web install invalid SSL Certificate should fail
    [Tags]     C6305
    [Setup]   Setup for login UI
    Navigate to Settings
    Click Tab    Admin Web
    Click Icon By Class    Upload
    Wait Until Element Is Visible         name=cert_file     60s
    Input Text   name=cert_file           gdsgdssdhsd46466@@fdhffdhfdhfd  
    sleep  3s  reason=wait for page to load
    Click Button   Apply
    Should Display Flash Message     Must provide both valid key and cert.
    Close Browser 
    [Teardown]    Teardown And Download Diag 

Admin web install invalid SSL Key should fail
    [Tags]     C6306
    [Setup]   Setup for login UI
    Navigate to Settings
    Click Tab    Admin Web
    Click Icon By Class    Upload
    Wait Until Element Is Visible         name=key_file     60s
    Input Text   name=key_file     gdsgdssdhsd46466@@fdhffdhfdhfd
    sleep  3s  reason=wait for page to load
    Click Button   Apply
    Should Display Flash Message      Must provide both valid key and cert.
    Close Browser 
    [Teardown]    Teardown And Download Diag 

Admin web install custom SSL click cancel
    [Tags]     C6307
    [Setup]   Setup for login UI
    Navigate to Settings
    Click Tab    Admin Web
    Click Icon By Class    Upload
    Wait Until Element Is Visible         name=key_file     60s
    sleep  3s  reason=wait for page to load
    Click Button   Cancel
    sleep  3s  reason=wait for page to load
    Wait Until Element Is Not Visible         name=key_file     60s
    Close All Browsers 
    [Teardown]    Teardown And Download Diag 


