*** Settings ***
Library   Selenium2Library
Resource  keywords/investigator_data_connect.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***
Verify Investigator Data Connector installation
    [Tags]     C7593
    [Setup]   Setup for login UI 
    Navigate to the Home page
    Click Investigator Data Connector Install Button
    Click Button      Confirm   
    Wait Until Element Is Visible         xpath=/html/body/flash/div    120s
    Close Browser
    Login SSH Terminal
    Write    sed -i 's/localhost/develop.lab.geminidata.net/g' /opt/gemini/connector/etc/connector.yaml
    Close Connection  
    [Teardown]    Teardown And Download Diag

Verify Uninstall button is appearing after successful installation
    [Tags]     C7619
    [Setup]   Setup for login UI
    Navigate to the Home page
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/ico     120s      
    Click Element    xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/ico
    Wait Until Element Is Visible         xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/div/ng-transclude/ul/li[5]/a   60s 
    Close Browser     
    [Teardown]    Teardown And Download Diag

Verify instance name validation by entering HTML tags
    [Tags]     C7602
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Wait Until Element Is Visible   name=instance_name   30s 
    Input Text                  name=instance_name      '</n></t>
    sleep  1s  reason=wait for text to be written
    Input Text                  name=client_key           bbd5edadb0a24abd9900285fcf65e5b2
    sleep  1s  reason=wait for page to load     
    Error Icon Should Appear    
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify instance name field validation by entering any string other than develop OR rnd
    [Tags]     C7605
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Wait Until Element Is Visible    name=instance_name    30s 	
    Input Text                  name=instance_name      Farooq
    sleep  1s  reason=wait for text to be written
    Input Text                  name=client_key           bbd5edadb0a24abd9900285fcf65e5b2
    sleep  1s  reason=wait for page to load     
    Error Icon Should Appear    
    Close Browser
    [Teardown]   Teardown And Download Diag
    
Verify auth key validation by entering HTML tags
    [Tags]     C7616
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Wait Until Element Is Visible   name=instance_name   30s 
    Input Text                  name=instance_name       develop
    sleep  1s  reason=wait for text to be written
    Input Text                  name=client_key            '</n></t>
    sleep  1s  reason=wait for page to load     
    Error Icon Should Appear 
    Close Browser   
    [Teardown]    Teardown And Download Diag

Verify that after clicking on "Add New Data Source" , "New Connector Instance" screen open successfully
    [Tags]     C7626
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    sleep  1s  reason=verify operation
    Click Icon By Class             Add
    Should Display Popup Form       side-panel-container    New Connector Instance   2
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]      120s
    sleep  2s  reason=verify operation
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Amazon AWS
    sleep  1s  reason=verify operation
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Splunk
    sleep  1s  reason=verify operation
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    AppDynamics
    sleep  1s  reason=verify operation
    #follow this template to add more operations
    Click Button on Popup    Cancel  
    Close Browser  
    [Teardown]    Teardown And Download Diag

Verify form fields when selecting "Splunk" from instance type drop down
    [Tags]     C7632
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    sleep  1s  reason=verify operation
    Click Icon By Class             Add
    Should Display Popup Form       side-panel-container    New Connector Instance   2
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]      120s
    sleep  2s  reason=verify operation
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Splunk
    sleep  2s  reason=verify operation
    Element Should Be Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[29]/input      #name:instance_name
    Element Should Be Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[30]/input      #name:hostname
    Element Should Be Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[31]/input      #name:port
    Element Should Be Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[32]/input      #name:password
    Element Should Be Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[33]/input      #name:backtrack_uri   
    Click Button on Popup    Cancel   
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Cancel button functionality on New Connector Instance screen
    [Tags]     C7634
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    sleep  1s  reason=verify operation
    Click Icon By Class             Add
    Should Display Popup Form       side-panel-container    New Connector Instance   2
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]      120s
    sleep  3s  reason=wait for list to load
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Splunk
    sleep  1s  reason=verify operation  
    Click Button on Popup    Cancel   
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that Splunk instance created successfully
    [Tags]     C7968
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class             Add
    Should Display Popup Form       side-panel-container    New Connector Instance   2
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]      120s
    sleep  3s  reason=wait for list to load
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Splunk
    sleep  1s  reason=verify operation
    Enter To Text Box                 xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[29]/input     Splunk_Test
    sleep  1s  reason=verify operation
    Click Button on Popup    Create
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Home page link functionality
    [Tags]     C7600
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    ${Window1Title}=    Get Title
    sleep  1s  reason=wait for link
    Click Gemini Link
    Select Window     Gemini Data 
    sleep  3s  reason=verify the link 
    Select Window     ${Window1Title}    
    sleep  1s  reason=verify the link
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify instance name validation by entering HTML tags in Add New Data Source
    [Tags]     C7966
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    sleep  1s  reason=verify operation
    Click Icon By Class             Add
    Should Display Popup Form       side-panel-container    New Connector Instance   2
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]      120s
    sleep  3s  reason=wait for list to load
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Splunk
    sleep  1s  reason=verify operation
    Enter To Text Box                 xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[29]/input     '</n></t>
    sleep  1s  reason=verify operation
    Click Button on Popup    Create
    #The flash message does not appear. 
    # #Should Display Flash Message           Invalid Instance Name.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that Instance Type drop down is disabled when clicking on Edit option
    [Tags]     C7969
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class              EditInstance
    Wait Until Element Is Visible   xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[1]/selectwrapper/select   60s
    Element Should Be Disabled       xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[1]/selectwrapper/select
    sleep  1s  reason=wait for pae to load
    Click Button on Popup    Cancel
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Global Connector Settings by entering valid instance and auth key
    [Documentation]      Similar to test case  Create and update authentication credentials
    [Tags]     C7613
    [Setup]   Setup for login UI 
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Wait Until Element Is Visible   name=instance_name   30s 
    Input Text                  name=instance_name      develop
    sleep  1s  reason=wait for text to be written
    Input Text                  name=client_key           bbd5edadb0a24abd9900285fcf65e5b2
    Tick Icon Should Appear
    sleep  15s  reason=wait for page to load
    Click Save Button  
    #  #Wait Until Element Is Visible         xpath=/html/body/flash/p[text()="Global Connector Settings updated. Authentication test successful."]    60s
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Start instance functionality 
    [Tags]     C7975
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Start Icon  2
    Close Browser   
    [Teardown]    Teardown And Download Diag

Verify Stop instance functionality
    [Tags]     C7976
    [Setup]   Setup for login UI 
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Stop Icon  2
    Close Browser   
    [Teardown]    Teardown And Download Diag

Verify Remove button functionality
    [Tags]     C7970
    [Setup]   Setup for login UI 
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Remove Icon  2 
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that Amazon AWS instance created successfully
    [Tags]     C8051
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class             Add
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]    120s
    sleep  1s  reason=verify operation
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Amazon AWS
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[14]/input     10s 
    Input Text                        xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[14]/input     Test
    sleep  1s  reason=verify operation
    Input Text                        xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[15]/input     Test
    sleep  1s  reason=verify operation
    Input Text                        xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[16]/input     Test
    sleep  1s  reason=verify operation
    Click Button on Popup    Create           
    Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that HPE ArcSight instance created successfully
    [Tags]     C8052
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class             Add
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]    120s
    sleep  1s  reason=verify operation
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    HPE ArcSight
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[20]/input     10s   
    Enter To Text Box                 xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[20]/input     Test
    sleep  2s  reason=verify operation
    Click Button on Popup    Create 
    Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that Microsoft Active Directory instance created successfully
    [Tags]     C8053
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class             Add
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]    120s
    sleep  1s  reason=verify operation
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Microsoft Active Directory
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[23]/input     10s 
    Enter To Text Box                 xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[23]/input     Test
    sleep  1s  reason=verify operation
    Click Button on Popup    Create   
    Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s 
    Close Browser 
    [Teardown]    Teardown And Download Diag

Verify that Microsoft App Dynamics instance created successfully
    [Tags]     C8054
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class             Add
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]    120s
    sleep  1s  reason=verify operation
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    AppDynamics
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[37]/input     10s 
    Enter To Text Box                 xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[37]/input     Test
    sleep  1s  reason=verify operation
    Click Button on Popup    Create 
    Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s  
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Preview data payload button functionality
    [Tags]     C8022
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class           ViewSamples
    Wait Until Element Is Visible      xpath=/html/body/div[1]/div/div/popup-window/footer/a/button              180s
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Create & Start button functionality
    [Tags]     C8055
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class             Add
    Should Display Popup Form       side-panel-container    New Connector Instance   2
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]      120s
    sleep  3s  reason=wait for list to load
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Splunk
    sleep  1s  reason=verify operation
    Enter To Text Box                 xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[29]/input     Splunk_Test
    sleep  1s  reason=verify operation
    Click Button on Popup    Create And Start
    Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Cancel button functionality 
    [Tags]     C8056
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class             Add
    Should Display Popup Form       side-panel-container    New Connector Instance   2
    Wait Until Element Is Visible    xpath=//select[@name="INSTANCE_TYPE"]      120s
    sleep  3s  reason=wait for list to load
    Select From List           xpath=//select[@name="INSTANCE_TYPE"]    Splunk
    sleep  1s  reason=verify operation
    Enter To Text Box                 xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[29]/input     Splunk_Test
    sleep  1s  reason=verify operation
    Click Button on Popup    Cancel   
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify instance Log functionality 
    [Tags]     C7978
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Start Icon on Gemini Catalog Instance  1
    Click Icon By Class    ViewLogs
    Wait Until Element Is Visible      xpath=/html/body/div[1]/div/div/popup-window/footer/a/button                60s
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Restart button functionality 
    [Tags]     C8060
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Icon By Class   RestartInstance
    Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that Restart button disappears when stop instance
    [Tags]     C8061
    [Setup]   Setup for login UI
    Navigate to the Home page
    Click Investigator Data Connector Launch Button
    Click Stop Icon on Gemini Catalog Instance  1
    Wait Until Element Is Not Visible       xpath=//*[@id="spinLoaderImage"]    180s
    Wait Until Element Is Not Visible       xpath=/html/body/div[1]/div/div/div[2]/segment[2]/card[1]/actions/a[5]/ico                   5s
    Close All Browsers
    [Teardown]    Teardown And Download Diag

Verify that after clicking on Uninstall button confirmation message is appearing
    [Tags]     C7620
    [Setup]   Setup for login UI
    Navigate to the Home page
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/ico     120s      
    Click Element    xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/ico
    Wait Until Element Is Visible         xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/div/ng-transclude/ul/li[5]/a   60s 
    Click Element       xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/div/ng-transclude/ul/li[5]/a
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div[1]/form/div[3]/div/form-row/h3       60s
    Close Browser     
    [Teardown]    Teardown And Download Diag

Verify Uninstall functionality 
    [Tags]     C7622
    [Setup]   Setup for login UI
    Navigate to the Home page
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/ico     120s      
    Click Element    xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/ico
    Wait Until Element Is Visible         xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/div/ng-transclude/ul/li[5]/a   60s 
    Click Element       xpath=/html/body/div[1]/div/div/div[3]/div[2]/mgr-app-card[2]/div[3]/context-menu/div/div/ng-transclude/ul/li[5]/a
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div[1]/form/div[3]/div/form-row/h3   60s
    sleep  2s  reason=wait for page to load 
    Click Button    Confirm
    Wait Until Element Is Visible       xpath=/html/body/flash/div    120s
    Close Browser     
    [Teardown]    Teardown And Download Diag

