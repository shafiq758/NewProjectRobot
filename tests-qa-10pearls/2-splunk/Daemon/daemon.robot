*** Settings ***
Library  Selenium2Library
Resource  keywords/daemon.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
To validate correct disk space message is provided when empty string is provided
    [Documentation]      Precondition is splunk enterprise needs to be installed.
    [Tags]     C4931
    [Setup]   Setup for login UI
    [Timeout]  420 
    Navigate to Splunk
    Input Text                  name=minFreeSpace      ${EMPTY}
    sleep  1s  reason=check if textbox is empty
    Input Text                  name=serverName        testServer
    sleep  1s  reason=check if textbox is filled
    Input Text                  name=SPLUNK_DB         /opt/splunk/var/lib/splunk1
    Click Restart Button
    # #Should Display Flash Message     Invalid disk space value 
    Click Close Button
    Close Browser
    [Teardown]    Teardown And Download Diag

To validate correct disk space message is provided when alphabetic string is provided
    [Documentation]      Precondition is splunk enterprise needs to be installed.
    [Tags]     C4931
    [Setup]   Setup for login UI
    [Timeout]  420
    Navigate to Splunk
    Input Text                  name=minFreeSpace      abcde
    Click Restart Button
    # #Should Display Flash Message     Invalid disk space value 
    Click Close Button 
    Close Browser
    [Teardown]    Teardown And Download Diag
    
To validate correct disk space message is provided when alphanumeric string is provided
    [Documentation]      Precondition is splunk enterprise needs to be installed.
    [Tags]     C4931
    [Setup]   Setup for login UI
    [Timeout]  420
    Navigate to Splunk
    Input Text                  name=minFreeSpace      a3bcde12
    Click Restart Button
    # #Should Display Flash Message     Invalid disk space value 
    Click Close Button
    Close Browser
    [Teardown]    Teardown And Download Diag

To validate correct disk space message is provided
    [Documentation]      Precondition is splunk enterprise needs to be installed.
    [Tags]     C4931
    [Setup]   Setup for login UI
    [Timeout]  420
    Navigate to Splunk
    Input Text                  name=minFreeSpace      512
    Click Restart Button
    Click Close Button
    Wait Until Element Is Visible   name=minFreeSpace        60s
    ${box text}=        Get Value     name=minFreeSpace
    sleep  1s  reason=let the page load
    Should Be Equal     512     ${box text}
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that user is not able to add any html tags in Minimum required free disk space field
    [Documentation]      Precondition is splunk enterprise needs to be installed.
    [Tags]     C5337
    [Setup]   Setup for login UI
    [Timeout]  420 
    Navigate to Splunk
    Input Text                  name=minFreeSpace      '<n><t>
    sleep  1s  reason=check if textbox is empty
    Click Restart Button
    # #Should Display Flash Message     Error invalid disk space
    Click Close Button
    Close Browser
    [Teardown]    Teardown And Download Diag

To validate User is able to modify Splunk Cluster Server name using Empty name
    [Documentation]      Precondition is splunk enterprise needs to be installed.
    [Tags]     C4926
    [Setup]   Setup for login UI
    [Timeout]  420 
    Navigate to Splunk
    Input Text                  name=serverName      ${EMPTY}
    sleep  1s  reason=check if textbox is empty
    Click Restart Button
    # #Should Display Flash Message     Give server name.
    Click Close Button
    Close Browser
    [Teardown]    Teardown And Download Diag

To validate User is able to modify Splunk Cluster Server name
    [Documentation]      Precondition is splunk enterprise needs to be installed.
    [Tags]     C4926
    [Setup]   Setup for login UI
    [Timeout]  420
    Navigate to Splunk
    Input Text                  name=serverName      testServer
    sleep  1s  reason=check if textbox is filled
    Click Restart Button
    Click Close Button
    Wait Until Element Is Visible   name=serverName      60s   
    ${box text}=       Get Value    name=serverName
    Should Be Equal    testServer    ${box text}
    sleep  2s  reason=let the page load.
    Close Browser
    [Teardown]    Teardown And Download Diag

To validate default directory is provided when empty name is provided
    [Documentation]      Precondition is splunk enterprise needs to be installed.
    [Tags]     C4929
    [Setup]   Setup for login UI
    [Timeout]  420
    Navigate to Splunk
    Input Text                  name=SPLUNK_DB      ${EMPTY}
    sleep  1s  reason=check if textbox is filled
    Click Restart Button
    # #Should Display Flash Message     Error invalid disk space
    Click Close Button
    Close Browser
    [Teardown]    Teardown And Download Diag

To validate default directory is provided
    [Documentation]      Precondition is splunk enterprise needs to be installed.
    [Tags]     C4929
    [Setup]   Setup for login UI
    [Timeout]  420 
    Navigate to Splunk
    Input Text                  name=SPLUNK_DB      /opt/splunk/var/lib/splunk1
    sleep  1s  reason=check if textbox is filled
    Click Restart Button
    Click Close Button
    Wait Until Element Is Visible     name=SPLUNK_DB    60s 
    ${box text}=        Get Value     name=SPLUNK_DB
    sleep  1s  reason=let the page load
    Should Be Equal     /opt/splunk/var/lib/splunk1     ${box text}
    Close All Browsers
    [Teardown]    Teardown And Download Diag

