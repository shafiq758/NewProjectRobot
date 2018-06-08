*** Settings ***
Library  Selenium2Library
Resource  keywords/web_interface.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
To verify error is displayed when port field is left blank
    [Documentation]      Splunk must be installed and activated.
    [Tags]     C4938
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Web Interface
    Input Text                        name=httpport      ${EMPTY}
    sleep  1s  reason=check if textbox is empty
    Click Element       xpath=/html/body/div/main/segment[2]/footer/button
    Should Display Flash Message    Incorrect port number.
    Close Browser
    [Teardown]    Teardown And Download Diag

To verify error is displayed when incorrect port number is given
    [Documentation]      Splunk must be installed and activated.
    [Tags]     C4941
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Web Interface
    Input Text                        name=httpport      5
    sleep  2s  reason=check if textbox is empty
    Click Element       xpath=/html/body/div/main/segment[2]/footer/button
    Should Display Flash Message    Incorrect port number.
    Close Browser
    [Teardown]    Teardown And Download Diag
 
Verify that user is not able to add any html tags in Configure default HTTP/S port for Splunk Web field
    [Documentation]      Splunk must be installed and activated.
    [Tags]     C5339
    [Setup]   Setup for login UI 
    Navigate to Splunk
    Click on Submenu Web Interface
    Input Text        name=httpport        '</n></t>
    Click Element       xpath=/html/body/div/main/segment[2]/footer/button
    Should Display Flash Message    Incorrect port number.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Configure default HTTP/S port for Splunk Web field validation by entering large string
    [Documentation]      Splunk must be installed and activated.
    [Tags]     C5341
    [Setup]   Setup for login UI 
    Navigate to Splunk
    Click on Submenu Web Interface
    Input Text        name=httpport            dgdgdgddgdgdgbcbcbcbcb
    Click Element       xpath=/html/body/div/main/segment[2]/footer/button
    Should Display Flash Message    Incorrect port number.
    Close Browser
    [Teardown]    Teardown And Download Diag


Verify Configure default HTTP/S port for Splunk Web field validation by entering negative numbers
    [Documentation]      Splunk must be installed and activated.
    [Tags]     C5344
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Web Interface
    Input Text        name=httpport            -855222
    Click Element       xpath=/html/body/div/main/segment[2]/footer/button
    Should Display Flash Message    Incorrect port number.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Configure default HTTP/S port for Splunk Web field validation by entering empty spaces
    [Documentation]      Splunk must be installed and activated.
    [Tags]     C5345
    [Setup]   Setup for login UI 
    Navigate to Splunk
    Click on Submenu Web Interface
    Input Text        name=httpport            ${EMPTY}
    Click Element       xpath=/html/body/div/main/segment[2]/footer/button
    Should Display Flash Message    Incorrect port number.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Cancel button functionality on disable Splunk web screen
    [Documentation]      Splunk must be installed and activated.
    [Tags]     C5343
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Web Interface
    Click Toggle      toggleSplunkWeb
    sleep  15s  reason=wait for page to load
    Click Cancel Button
    Toggle Status Should Be    toggleSplunkWeb       on 
    Close All Browsers  
    [Teardown]    Teardown And Download Diag

*** comments ***
#Place test cases that you do not want to test.
    
