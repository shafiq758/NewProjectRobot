*** Settings ***
Library  Selenium2Library
Resource  keywords/splunk_diag.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
Get Splunk Diag File
    [Tags]     C3859
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Splunk Diag
    Click Icon By Class   Add
    Wait Until Element Is Visible  id=form_diag     60s
    Click Button     Create
    Wait Until Element Is Visible          class=primary         300s
    sleep  5s  reason=wait for page to load
    Click Button   Close
    Close Browser
    [Teardown]    Teardown And Download Diag

Delete one Splunk Diag File
    [Tags]     C3860
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Splunk Diag
    Click Icon By Class   icon Clear
    Wait Until Element Is Visible   class=form-view   60s
    Click Button    Remove
    Should Display Flash Message    Splunk diag file has been removed.
    Close Browser
    [Teardown]    Teardown And Download Diag

Click app should redirect to config editor page
    [Tags]     C6724
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name     SplunkForwarder
    Location Should Contain    conf/index/apps
    Close Browser
    [Teardown]    Teardown And Download Diag

Create and update Hunk
    [Tags]     C3857
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Hunk
    Click Icon By Class    Add
    Wait Until Element Is Visible    name=provider_name      60s
    Input Text    name=provider_name     	TestProvider      
    Input Text    name=namenode_host        localhost
    Wait Until Element Is Visible    class=primary      10s
    sleep  2s  reason=wait for page to load
    Click Button      Add    
    Click Icon By Class    icon Clear
    Wait Until Element Is Visible    id=form_delete      60s
    Wait Until Element Is Visible    class=primary      10s
    sleep  2s  reason=wait for page to load
    Click Button   Remove
    Close All Browsers
    [Teardown]    Teardown And Download Diag

