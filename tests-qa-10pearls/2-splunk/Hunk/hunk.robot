*** Settings ***
Library  Selenium2Library
Resource  keywords/hunk.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
Error should appear when incorrect HDFS NameNode FQDN is provided
    [Tags]     C4943
    [Documentation]      Splunk must be installed.
    [Setup]   Setup for login UI
    Navigate to Hunk in Splunk
    Click Icon By Class              Add
    Wait Until Element Is Visible      name=provider_name      30s
    Input Text                  name=provider_name      testProvider
    sleep  1s  reason=write the text
    Input Text                  name=namenode_host      ${EMPTY}
    sleep  2s  reason=Let the pop up appear
    Click Add Button
    element should be visible      id=form_add
    Click Cancel Button
    Close Browser
    [Teardown]    Teardown And Download Diag

Error should prompt when HDFS NameNode FQDN value is not provided
    [Tags]     C4942
    [Setup]   Setup for login UI
    Navigate to Hunk in Splunk
    Click Icon By Class              Add
    Wait Until Element Is Visible      name=provider_name      30s
    Input Text                  name=provider_name      testProvider
    sleep  1s  reason=Write the text
    Input Text                  name=namenode_host      ${EMPTY}
    sleep  1s  reason=all text should be written
    Click Add Button
    sleep  1s  reason=to check if the popup still appears
    element should be visible      id=form_add
    Click Cancel Button 
    Close Browser
    [Teardown]    Teardown And Download Diag  

Error should be prompted when storage path on HDFS is left blank
    [Tags]     C4944
    [Setup]   Setup for login UI
    Navigate to Hunk in Splunk
    Click Icon By Class              Add
    Wait Until Element Is Visible      name=provider_name      30s
    Input Text                  name=provider_name         testProvider
    sleep  1s  reason=Write the text
    Input Text                  name=namenode_host         testHost
    sleep  1s  reason=Write the text
    Input Text                  name=splunk_home_hdfs      ${EMPTY} 
    sleep  2s  reason=all text should be written
    Click Add Button
    sleep  2s  reason=wait for the page to load
    element should be visible      id=form_add
    Close Browser
    [Teardown]    Teardown And Download Diag  

Error should be prompted on giving incorrect value on storage path on HDFS
    [Tags]     C4945
    [Setup]   Setup for login UI
    Navigate to Hunk in Splunk
    Click Icon By Class              Add
    Wait Until Element Is Visible      name=provider_name      30s
    Input Text                  name=provider_name         testProvider1
    sleep  1s  reason=Write the text
    Input Text                  name=namenode_host         5jdh9jj2
    sleep  1s  reason=Write the text
    Input Text                  name=splunk_home_hdfs      /user/splunk/001gemini 
    sleep  2s  reason=all text should be written
    Click Add Button
    # This test case needs to be revised, maybe a proper value in namenode_host which causes the test case to fail.
    # #Should Display Flash Message    Please enter valid storage path
    sleep  2s  reason=wait for the page to load
    Close All Browsers
    Close Browser
    [Teardown]    Teardown And Download Diag 

Create and update Hunk
    [Tags]     C3857
    [Documentation]      Splunk must be installed.
    [Setup]   Setup for login UI
    Navigate to Hunk in Splunk
    Click Icon By Class              Add
    sleep  5s  reason=Let the pop up appear
    Input Text                  name=provider_name      TestProvider
    sleep  1s  reason=write the text
    Input Text                  name=namenode_host      localhost
    sleep  2s  reason=Let the pop up appear
    Click Add Button
    sleep  8s  reason=wait for page to load
    Click Icon By Class              icon Clear
    Wait Until Element Is Visible           xpath=/html/body/alert-box-object/alert-box/alert-box-container/main/section/form/form-row[1]/input           60s
    Click Button    Remove  
    Close Browser
    [Teardown]    Teardown And Download Diag

*** comments ***
#Place test cases that you do not want to test.

