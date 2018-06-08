*** Settings ***
Library  Selenium2Library
Library  test.py
Variables  variables/splunk.yaml
Resource  Keywords/upgrade.robot
#Resource  ../../test_resources/test_setup.robot
#Resource  ../../test_resources/web.robot
#Resource   ../0-qa-test_setup/qa-test_setup.robot
Test Setup  setup browser
Test Teardown  teardown and download diag

*** Variables ***
${splunk_version}           ${Splunk["version"]}

*** Test Cases ***
Download Splunk File
   [Documentation]      This is used to install splunk from the internet. 
   [Setup]  Setup for login UI
   import library   test.SboxApi  ${SBOX_HOME_PAGES[${parent_node}]}  ${SBOX_WEB_USER}  ${SBOX_PASS}
   ${diag_file}=   download splunk tgz version     ${splunk_version} 

Download Upgrade Pack
   [Documentation]      This is used to install Upgrade pack from the internet. 
   [Setup]  Setup for login UI
   import library   test.SboxApi  ${SBOX_HOME_PAGES[${parent_node}]}  ${SBOX_WEB_USER}  ${SBOX_PASS}
   ${diag_file}=  download upgrade pack 

   
Upgrade Preparation change node setting
   [Tags]     C4275
   [Documentation]   Node Settings For Upgrade preparation
   [Timeout]  2400
   [Setup]   Setup for login UI
   Navigate To Node
   Add NTP Server
   Update Time
   Add DNS Server
   Enable FTP
   Add FTP User
   Change Hostname
   Change SSH Port
   Enable SNMP Agent
   Add SNMP agent
   Add SNMP Trashold
   Add SNMP Trap Destination
   #Create Failover Group
   Create Admin Log Rule
   #Create Log Receiver Rule
   Close Browser
   [Teardown]    Teardown And Download Diag



Upgrade preparation change cluster settings
   [Tags]     C4276
   [Documentation]   Cluster Settings For Upgrade preparation
   [Timeout]  2400
   [Setup]   Setup for login UI
   Navigate to Cluster
   Create Node Group
   Create Job
   Close Browser
   [Teardown]    Teardown And Download Diag


Upgrade Preparation change Splunk settings
   [Tags]     C4849
   [Documentation]  To change splunk setting for Upgrade process 
   [Timeout]  2400
   [Setup]   Setup for login UI
   Navigate to Splunk
   Install Splunk
   #Validate Splunk Web Enabled
   Change Splunk HTTP port 
   Close Browser
   [Teardown]    Teardown And Download Diag


Upgrade Preparation change misc settings
   [Tags]     C4309
   [Documentation]  To change Misc setting for Upgrade process
   [Setup]   Setup for login UI
   Navigate to Setting
   Change Admin Web Listening Port
   Enable And Input In Login Banner
   Close Browser
   [Teardown]    Teardown And Download Diag







Ugrade Version
   [Tags]     C4277
   [Documentation]    Run Upgrade Script
   [Setup]  Setup Second Browser
   #Log To Console  ${ip}
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   #Navigate to Setting
   #UpgradePack
   #Upload gemini-appliance-889.patch
   Upload Upgrade Pack
   Close Browser
   [Teardown]    Teardown And Download Diag



Upgrade Complete Check Admin Web Settings and function
   [Tags]   C4330 
   [Documentation]    Validate Admin Web Settings
   [Setup]  Setup Second Browser
   #Log To Console  ${ip}
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Click Button   OK
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   Capture Page Screenshot
   Sleep  5s
   Validate Web Listeninig Port
   Validate Login Banner
   Close Browser
   [Teardown]    Teardown And Download Diag


Upgrade Complete Check Network Settings and Function
    [Tags]     C4278
    [Documentation]    Validate Network Settings 
    [Setup]  Setup Second Browser
    #Log To Console  ${ip}
    Go To      https://${ip}:10443
    Sleep   5s
    Capture Page Screenshot
    Input Text     id=username     ${sbox_web_user}
    Input Text      id=password     ${sbox_pass} 
    Click Login Button
    Validate Netowrk Settings
    Close Browser
    [Teardown]    Teardown And Download Diag

Upgrade Complete Check NTP server and Function 
    [Tags]     C4280
    [Documentation]    Validate NTP Server
    [Setup]  Setup Second Browser
    #Log To Console  ${ip}
    Go To      https://${ip}:10443
    Sleep   5s
    Capture Page Screenshot
    Input Text     id=username     ${sbox_web_user}
    Input Text      id=password     ${sbox_pass}
    Click Login Button
    Validate NTP Server
    Close Browser
    [Teardown]    Teardown And Download Diag


Upgrade Check Complete Time Setting and Function 
   [Tags]     C4282    
   [Documentation]    Validate Time Setitngs
   [Setup]  Setup Second Browser
   #Log To Console  ${ip}
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   Validate Time Stamp
   Close Browser
   [Teardown]    Teardown And Download Diag

Upgrade complete check SNMP setting and Function
   [Tags]     C4280  
   [Documentation]    Validate SNMP Settings
   [Setup]  Setup Second Browser
   #Log To Console  ${ip}
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   Validate SNMP Setting 
   Validate SNMP Trap Destination
   Close Browser
   [Teardown]    Teardown And Download Diag

Upgrade complete check FTP setting and Function
    [Tags]     C4285
    [Documentation]    Validate FTP Settings
    [Setup]  Setup Second Browser
    #Log To Console  ${ip}
    Go To      https://${ip}:10443
    Sleep   5s
    Capture Page Screenshot
    Input Text     id=username     ${sbox_web_user}
    Input Text      id=password     ${sbox_pass}
    Click Login Button
    Validate FTP Settings 
    Close Browser
    [Teardown]    Teardown And Download Diag
 
Upgrade Complete Check SSH Settings 
   [Tags]     C4286 
   [Documentation]   Validate SSH settings
   [Setup]  Setup Second Browser
   #Log To Console  ${ip}
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   Validate SSH Settings
   Close Browser
   [Teardown]    Teardown And Download Diag



Upgrade Complete Admin Forwarding Rule and Settings and Function 
   [Tags]     C4283
   [Documentation]    Validate Admin Rule Forwarding Setting
   [Setup]  Setup Second Browser
   #Log To Console  ${ip}
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   Validate Admin Forwarding Rule
   Close Browser
   [Teardown]    Teardown And Download Diag

Upgrade Complete Check Name Settings and Function
   [Tags]     C4284 
   [Documentation]    Validate Name settings
   [Setup]  Setup Second Browser
   #Log To Console  ${ip}
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   Validate master Node name
   Close Browser
   [Teardown]    Teardown And Download Diag

Upgrade Preparation Change Cluster Settings 
   [Tags]     C4290 
   [Documentation]    Validate Cluster settings
   [Setup]  Setup Second Browser
   #Log To Console  ${ip}
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   Cluster Settings 
   Job Settings
   Close Browser
   [Teardown]    Teardown And Download Diag

Upgrade Preparation Change Splunk Settings 
   [Tags]     C4863
   [Documentation]  Validate Splunk Settings
   [Setup]  Setup Second Browser
   Log To Console  ${ip}
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   Splunk Settings
   Close Browser
   [Teardown]    Teardown And Download Diag
*** comments ***
Upgrade Complete Check Admin Web Settings and function
   [Documentation]    Run Upgrade Script
   
     [Setup]  Setup Second Browser
     
     Log To Console  ${ip}
    Go To      https://${ip}:10443
     Sleep   5s
     Capture Page Screenshot
     Input Text     id=username     ${sbox_web_user}
    Input Text      id=password     ${sbox_pass}
    Validate Web Listeninig Port
    Validate Login Banner
     Close Browser
    [Teardown]    Teardown And Download Diag


