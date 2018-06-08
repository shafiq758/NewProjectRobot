*** Settings ***
Library  Selenium2Library
Resource  keywords/snmp.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***    
Add SNMP Agent with invalid Name field 
    [Documentation]      
    [Tags]     C5298
    [Timeout]  300
    [Setup]   Setup for login UI 
    Navigate to Node
    Click on Submenu SNMP
    Activate Precondition
    Click Add SNMP Agent
    Input Text                  name=name      @#$!%^&!
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Invalid character in name. It only supports alphabet, number, dot, dash and underscore.
    Click Add SNMP Agent
    Input Text                  name=name      ${EMPTY}
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Need a name.
    Close Browser
    [Teardown]    Teardown And Download Diag

Add SNMP Agent with invalid Network field     
    [Tags]     C5299
    [Timeout]  300
    [Setup]   Setup for login UI 
    Navigate to Node
    Click on Submenu SNMP
    Click Add SNMP Agent
    Input Text                  name=name      snmp1
    sleep  1s      reason=wait for page to load
    Input Text                  name=network     ${EMPTY}
    sleep  1s      reason=wait for page to load
    Click Add Button
    # #Should Display Flash Message    invalid literal for int() with base 10: ''
    Click Add SNMP Agent
    Input Text                  name=name      snmp1
    sleep  1s      reason=wait for page to load
    Input Text                  name=network      @#$!%^&!
    sleep  1s      reason=wait for page to load
    Click Add Button
    # #Should Display Flash Message    invalid literal for int() with base 10: ''
    Close Browser
    [Teardown]    Teardown And Download Diag

Add SNMP Agent with invalid Maskbit field
    [Tags]     C5300
    [Timeout]  300
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu SNMP
    Click Add SNMP Agent
    Input Text                  name=name      snmp1
    sleep  1s      reason=wait for page to load
    Input Text                  name=network     192.168.200.0
    sleep  1s      reason=wait for page to load
    Input Text                  name=mask        ${EMPTY}
    sleep  1s      reason=wait for page to load
    Click Add Button
    # #Should Display Flash Message    invalid literal for int() with base 10: '@#$!%^&!'
    Click Add SNMP Agent
    Input Text                  name=name      snmp1
    sleep  1s      reason=wait for page to load
    Input Text                  name=network      192.168.200.0
    sleep  1s      reason=wait for page to load
    Input Text                  name=mask         @#$!%^&!
    sleep  1s      reason=wait for page to load
    Click Add Button
    # #Should Display Flash Message    invalid literal for int() with base 10: ''
    Close Browser
    [Teardown]    Teardown And Download Diag

Add SNMP Trap Destination with trap2sink protocol
    [Documentation]  This should be the first entry in table.
    [Tags]     C10403
    [Timeout]  300
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu SNMP
    Click Tab Trap Destination
    Click Add Trap
    Input Text                  name=host           192.168.200.1
    sleep  1s      reason=wait for page to load
    Click Element     xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[2]/label[2]/label  
    sleep  1s      reason=wait for page to load
    Input Text                  name=community      geminipub
    sleep  1s      reason=wait for page to load
    Input Text                  name=port           10240
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Notification has been created successfully.
    Click Destroy
    Should Display Flash Message    The notification has been removed.
    Close Browser
    [Teardown]    Teardown And Download Diag

Add SNMP Trap Destination with informsink protocol
    [Documentation]  This should be the first entry in table.
    [Tags]     C10404
    [Timeout]  300
    [Setup]   Setup for login UI 
    Navigate to Node
    Click on Submenu SNMP
    Click Tab Trap Destination
    Click Add Trap
    Input Text                  name=host           192.168.200.1
    sleep  1s      reason=wait for page to load
    Click Element     xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/form/section/form-row[2]/label[3]/label  
    sleep  1s      reason=wait for page to load
    Input Text                  name=community      geminipub
    sleep  1s      reason=wait for page to load
    Input Text                  name=port           10240
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message    Notification has been created successfully.
    Click Destroy
    Should Display Flash Message    The notification has been removed.
    Close Browser
    [Teardown]    Teardown And Download Diag


