*** Settings ***
Library  Selenium2Library
Resource  keywords/proxy.robot
Resource  ../../../test_resources/test_setup.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
Verify Protocol dropdown options 
    [Tags]     C5296
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Proxy
    Select From List    xpath=/html/body/div/main/section[2]/form/form-row[1]/selectwrapper/select    http
    sleep  1s  reason=wait for page to load
    Select From List    xpath=/html/body/div/main/section[2]/form/form-row[1]/selectwrapper/select    https
    sleep  1s  reason=wait for page to load
    Select From List    xpath=/html/body/div/main/section[2]/form/form-row[1]/selectwrapper/select    http
    sleep  1s  reason=wait for page to load
    Close Browser
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot

Verify host name field validation
    [Tags]     C8913
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Proxy
    Select From List    xpath=/html/body/div/main/section[2]/form/form-row[1]/selectwrapper/select    http
    sleep  1s  reason=wait for page to load
    Input Text                      name=host       zdsadadadad
    sleep  1s  reason=wait for page to load
    Click On Verify
    Close Browser
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot

Verify Port field validation by entering negative value
    [Tags]     C8914
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Proxy
    Select From List    xpath=/html/body/div/main/section[2]/form/form-row[1]/selectwrapper/select    http
    sleep  1s  reason=wait for page to load
    Input Text                      name=port       -1
    sleep  1s  reason=wait for page to load
    Click On Save
    Close Browser
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot

Verify Port field validation by entering html tags
    [Tags]     C8915
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Proxy
    Select From List    xpath=/html/body/div/main/section[2]/form/form-row[1]/selectwrapper/select    http
    sleep  1s  reason=wait for page to load
    Input Text                      name=port       '</n></t>
    sleep  1s  reason=wait for page to load
    Click On Save
    Close Browser
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    
Verify that after clicking on Save, Proxy information save successfully
    [Tags]     C8917
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Proxy
    Select From List    xpath=/html/body/div/main/section[2]/form/form-row[1]/selectwrapper/select    http
    sleep  1s  reason=wait for page to load
    Input Text                      name=host           example.com
    sleep  1s  reason=wait for page to load
    Input Text                      name=username       example
    sleep  1s  reason=wait for page to load
    Input Text                      name=password       example123
    sleep  1s  reason=wait for page to load
    Click On Save
    Should Display Flash Message    HTTP Proxy settings successfully updated.
    Close Browser
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot

Validate "Verify" button functionality after entering invalid information
    [Tags]     C8918
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Proxy
    Select From List    xpath=/html/body/div/main/section[2]/form/form-row[1]/selectwrapper/select    http
    sleep  1s  reason=wait for page to load
    Input Text                      name=host           example.com
    sleep  1s  reason=wait for page to load
    Input Text                      name=username       ${EMPTY}
    sleep  1s  reason=wait for page to load
    Input Text                      name=password       example123
    sleep  1s  reason=wait for page to load
    Click On Save
    Close Browser
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot

Verify Disable HTTP Proxy 
    [Tags]     C8919
    [Timeout]  360
    [Setup]   Setup for login UI
    Navigate to Settings
    Navigate to Settings Sub menu Proxy
    Enable HTTP proxy
    Disable HTTP proxy
    Should Display Flash Message    HTTP Proxy successfully disabled.
    Close Browser
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot

