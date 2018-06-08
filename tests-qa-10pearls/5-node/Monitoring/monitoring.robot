*** Settings ***
Library  Selenium2Library
Resource  keywords/monitoring.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***   
Add Admin Log Forwarding Rule with invalid Name
    [Documentation]      
    [Tags]     C4947
    [Timeout]  300
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Monitoring
    Click Add Forwarding Rule
    Input Text                  name=name      @#$!%^&!
    sleep  1s      reason=wait for page to load
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[2]/label[2]/label
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_host      192.168.200.100
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_port      514
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Need rule name.
    Close Browser 
    [Teardown]    Teardown And Download Diag

Add Admin Forwarding Rule with invalid Destination Host
    [Documentation]      
    [Tags]     C4948
    [Timeout]  300
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Monitoring
    Click Add Forwarding Rule
    Input Text                  name=name      UDP514
    sleep  1s      reason=wait for page to load
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[2]/label[2]/label
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_host      @^*!(!#^!)!(*@)
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_port      514
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Invalid destination host.
    Close Browser 
    [Teardown]     Teardown And Download Diag

Add Admin Forwarding Rule with invalid Port
    [Documentation]      
    [Tags]     C4950
    [Timeout]  300
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Monitoring
    Click Add Forwarding Rule
    Input Text                  name=name      UDP514
    sleep  1s      reason=wait for page to load
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[2]/label[2]/label
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_host      192.168.200.100
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_port      @^*!(!#^!)!(*@)
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Invalid port number.
    Close Browser 
    [Teardown]    Teardown And Download Diag

Add System Log Forwarding Rule with invalid Name
    [Tags]     C5360
    [Timeout]  300
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Monitoring
    Click Tab System Log Forwarding
    Click Add Forwarding Rule
    Input Text                  name=name      @#$!%^&!
    sleep  1s      reason=wait for page to load
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[2]/label[2]/label
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_host      192.168.200.100
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_port      514
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Need rule name.
    Close Browser 
    [Teardown]    Teardown And Download Diag

Add System Log Forwarding Rule with invalid Destination Host
    [Tags]     C5361
    [Timeout]  300
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Monitoring
    Click Tab System Log Forwarding
    Click Add Forwarding Rule
    Input Text                  name=name      UDP514
    sleep  1s      reason=wait for page to load
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[2]/label[2]/label
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_host      @^*!(!#^!)!(*@)
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_port      514
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Invalid destination host.
    Close Browser 
    [Teardown]    Teardown And Download Diag

Add System Log Forwarding Rule with invalid Port
    [Tags]     C5363
    [Timeout]  300
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Monitoring
    Click Tab System Log Forwarding
    Click Add Forwarding Rule
    Input Text                  name=name      UDP514
    sleep  1s      reason=wait for page to load
    Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[2]/label[2]/label
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_host      192.168.200.100
    sleep  1s      reason=wait for page to load
    Input Text                  name=udp_port      @^*!(!#^!)!(*@)
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Invalid port number.
    Close Browser 
    [Teardown]    Teardown And Download Diag

