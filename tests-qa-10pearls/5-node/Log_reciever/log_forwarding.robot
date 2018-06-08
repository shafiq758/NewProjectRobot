*** Settings ***
Library  Selenium2Library
Resource  keywords/log_forwarding.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
Create TCP Log Receiver Rule 
    [Tags]     C3843
    [Setup]   Setup for login UI 
    Navigate to Node
    Click on Submenu Logreciever
    Click Icon By Class    Add
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input   60s
    Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input      TestRule1
    # These two fields are no longer used.
    #Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/div/input[1]   sourcetype
    #Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/div/input[2]   index
    sleep  1s      reason=wait for page to load
    Click Button    Save
    Click Radio3 Button
    Click Button    Save
    Click Rule Resource
    Click Add Filter
    Input Text      xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[3]/input  filter
    Click Button    Save
    Click Add Destination
    Click Button   Save
    Click Save Rule
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s
    Close Browser 
    [Teardown]    Teardown And Download Diag

Verify that validations are applied on "Rule Name" field
    [Tags]     C4910
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    sleep  5s      reason=wait for page to load
    Click Icon By Class  edit
    Wait Until Element Is Visible   xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input    60s
    Input Text    xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input   ${EMPTY}
    Click Button    Save
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s
    Close Browser 
    [Teardown]    Teardown And Download Diag

Verify that validations are applied on the "Source Name" field
    [Tags]     C7654
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    sleep  5s      reason=wait for page to load
    Click On Source Edit
    Input Text    xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input   +-*&abc
    sleep  1s      reason=wait for page to load
    Input Text    xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input   Source
    Click Button    Save
    Close Browser 
    [Teardown]    Teardown And Download Diag

Verify that validations are applied on the "Number of Copies" field
    [Tags]     C4912
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    sleep  5s      reason=wait for page to load
    Click Icon By Class  edit
    Wait Until Element Is Visible   xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[3]/input    60s
    Input Text    xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[3]/input   -eabc
    sleep  1s      reason=wait for page to load
    Input Text    xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[3]/input   1
    Click Button    Save
    Close Browser 
    [Teardown]    Teardown And Download Diag

Verify that validations are applied on the "Size" (Log Rotate) field
    [Tags]     C4916
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    sleep  5s      reason=wait for page to load
    Click Icon By Class  edit
    Wait Until Element Is Visible   xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[3]/input    60s
    Click Element  xpath=//*[@id="radio_1"]
    Input Text     xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[2]/md-radio-group/div/label/input  0
    sleep  1s      reason=wait for page to load
    Click Element  xpath=//*[@id="radio_0"]
    Click Button    Save
    Close Browser 
    [Teardown]    Teardown And Download Diag

Verify that validations are applied on "Filter Name" field
    [Tags]     C7651
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    Click On Filter Edit
    Input Text    xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[1]/input          ${EMPTY}
    Click Button  Save
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s
    Close Browser 
    [Teardown]    Teardown And Download Diag

Verify that validations are applied on "Destination Name" field
    [Tags]    C7653
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    Click On Destination Edit
    Input Text   xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[1]/input    +-*.
    Click Button  Save
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s
    Close Browser 
    [Teardown]    Teardown And Download Diag

Verify that validations are applied on the "Data Stream Port" field
    [Tags]     C7655
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    Click On Source Edit
    Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[6]/input  -1
    sleep  1s      reason=wait for page to load
    Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[6]/input  514
    Click Button   Save       
    Close Browser 
    [Teardown]    Teardown And Download Diag

Verify that Validations are applied on the "Private Key" field
    [Tags]     C7656
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    Click On Source Edit
    Click Element   xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[3]/md-checkbox/div[2]/label
    Input Text   name=tlsKey       &&@(#!@()
    Click Button  Save
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s
    Close Browser 
    [Teardown]    Teardown And Download Diag
    
Verify that Validations are applied on the "Certificate" field
    [Tags]     C7657
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    Click On Source Edit
    Click Element   xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[3]/md-checkbox/div[2]/label
    Input Text   name=tlsCert       &&@(#!@()
    Click Button  Save
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s
    Close Browser 
    [Teardown]    Teardown And Download Diag

Create a TCP Rule without adding a filter
    [Tags]     C7658
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    Delete Rule
    Click Icon By Class    Add
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input   60s
    Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input      TestRule2
    # These two fields are no longer used.
    #Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/div/input[1]   sourcetype
    #Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/div/input[2]   index
    sleep  1s      reason=wait for page to load
    Click Button    Save
    Click Radio3 Button
    Click Button    Save
    Click Add Destination From Source
    Click Button   Save
    Click Save Rule
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s
    Close Browser 
    [Teardown]    Teardown And Download Diag

Create TCP-TLS Log Receiver Rule
    [Tags]     C3063
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    Delete Rule
    Click Icon By Class    Add
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input   60s
    Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input      TestRule1
    # These two fields are no longer used.
    #Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/div/input[1]   sourcetype
    #Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/div/input[2]   index
    sleep  1s      reason=wait for page to load
    Click Button    Save
    Click Radio3 Button
    Click Element   xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[3]/md-checkbox/div[2]/label
    Input Text   name=tlsKey       <key>
    Input Text   name=tlsCert      <cert>
    Click Button    Save
    Click Rule Resource
    Click Add Filter
    Input Text      xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[3]/input  filter
    Click Button    Save
    Click Add Destination
    Click Button   Save
    Click Save Rule
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s
    Close Browser 
    [Teardown]    Teardown And Download Diag

Create UDP Log Receiver Rule
    [Tags]     C3064
    [Setup]   Setup for login UI
    Navigate to Node
    Click on Submenu Logreciever
    Delete Rule
    Click Icon By Class    Add
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input   60s
    Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input      TestRule1
    # These two fields are no longer used.
    #Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/div/input[1]   sourcetype
    #Input Text  xpath=/html/body/div[2]/div[1]/form/div[3]/form/div/input[2]   index
    sleep  1s      reason=wait for page to load
    Click Button    Save
    sleep  3s      reason=wait for page to load
    Click Button    Save
    Click Rule Resource
    Click Add Filter
    Input Text      xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[3]/input  filter
    Click Button    Save
    Click Add Destination
    Click Button   Save
    Click Save Rule
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s
    Delete Rule
    Close Browser 
    [Teardown]    Teardown And Download Diag


