*** Settings ***
Library  Selenium2Library
Resource  keywords/time.robot

Test Setup  setup browser
Test Teardown  teardown and download diag


*** Test Cases ***
Verify apply to cluster functionality from NTP page
    [Tags]     C4865
    [Timeout]  300
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Add NTP Server
    Input Text                  name=ntp_server      time-d-b.nist.gov
    sleep  1s      reason=wait for page to load
    Click Add Button
    Should Display Flash Message   NTP server has been added successfully.
    Close Browser
    [Teardown]    Teardown And Download Diag     

    
