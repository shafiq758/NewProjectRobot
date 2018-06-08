*** Settings ***
Library  Selenium2Library
Resource  keywords/hadoop.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
Verify that "No Hadoop Providers Configured" is appearing when no Hadoop Providers added
    [Tags]     C7557
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Hunk
    Wait Until Element Is Visible  xpath=//div//main//section//info//p[text()="No Hadoop Providers Configured"]   20s
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify HDFS NameNode FQDN field validation by entering special characters
    [Tags]     C7565
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Hunk
    Click Icon By Class    Add
    Wait Until Element Is Visible    name=provider_name      60s
    Input Text    name=provider_name     	'</n></t>      
    Input Text    name=namenode_host        localhost
    Wait Until Element Is Visible    class=primary      10s
    sleep  2s  reason=wait for page to load
    Click Button      Add
    Should Display Flash Message    It only supports alphabet, numeric, dot, dash and underscore character in 'Provider Name' field and less than 25 characters.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Provider name validation by entering HTML tags
    [Tags]     C7559
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Hunk
    Click Icon By Class    Add
    Wait Until Element Is Visible    name=provider_name      60s
    Input Text    name=provider_name     	TestProvider      
    Input Text    name=namenode_host        '</n></t>
    Wait Until Element Is Visible    class=primary      10s
    sleep  2s  reason=wait for page to load
    Click Button      Add
    Should Display Flash Message    Invalid name node FQDN.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Provider name validation by entering large text
    [Tags]     C7566
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Hunk
    Click Icon By Class    Add
    Wait Until Element Is Visible    name=provider_name      60s
    Input Text    name=provider_name     	absdefargarfavav123bagbababafwgt123batgvavgsbb123      
    Input Text    name=namenode_host        localhost
    Wait Until Element Is Visible    class=primary      10s
    sleep  2s  reason=wait for page to load
    Click Button      Add
    Should Display Flash Message    It only supports alphabet, numeric, dot, dash and underscore character in 'Provider Name' field and less than 25 characters.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify HDFS NameNode FQDN field validation by entering large text
    [Tags]     C7567
    [Setup]   Setup for login UI
    Navigate to Splunk
    Click on Submenu Hunk
    Click Icon By Class    Add
    Wait Until Element Is Visible    name=provider_name      60s
    Input Text    name=provider_name     	TestProvider      
    Input Text    name=namenode_host        absdefargarfavav123bagbababafwgt123batgvavgsbb123
    Wait Until Element Is Visible    class=primary      10s
    sleep  2s  reason=wait for page to load
    Click Button      Add
    Should Display Flash Message    Setting has been saved to configuration, please restart Splunk to apply the change.
    Close All Browsers
    [Teardown]    Teardown And Download Diag

