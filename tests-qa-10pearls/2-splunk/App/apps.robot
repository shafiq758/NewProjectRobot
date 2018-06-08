*** Settings ***
Library    Selenium2Library
Resource   keywords/apps.robot
Variables  variables/splunk.yaml

Library  test.py

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Variables ***
${splunk_version}           ${Splunk["version"]}

*** Test Cases ***
Download Splunk File
    [Documentation]      This is used to install splunk from the internet. 
    [Setup]   Setup for login UI
    import library  test.SboxApi  ${SBOX_HOME_PAGES[${parent_node}]}  ${SBOX_WEB_USER}  ${SBOX_PASS}
    ${diag_file}=  download splunk tgz version     ${splunk_version}    

Verify Splunk Version on Splunk Daemon Service
    [Documentation]      This installs the splunk on the machine.
    [Tags]     C4931
    [Setup]   Setup for login UI
    [Timeout]   900
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div/div[2]/div[2]/mgr-platform-card[2]/div/div[4]/div/button        30s
    Click Element    xpath=/html/body/div[1]/div/div/div[2]/div[2]/mgr-platform-card[2]/div/div[4]/div/button
    Click Icon By Class              Upload
    Wait Until Element Is Visible    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main[1]/section[1]/uploader/ico/label    30s
    sleep  3s  reason=let the form load
    Execute JavaScript    document.getElementById('file').style.display = 'opacity:1';
    Execute JavaScript   ("arguments[0].checked = true;", id=file)
    Execute JavaScript    document.getElementById('file').classList.remove('hidden')
    Execute JavaScript    document.getElementById('file').classList.add('MyClass')
    sleep  3s  reason=let the form load
    Wait Until Element Is Visible     xpath=/html/body/side-panel-object/side-panel/side-panel-container/main[1]/section[1]/uploader/ico   10s
    choose file             id=file      	${CURDIR}/splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz     # Give file path of installation as second arguement
    Wait Until Element Is Visible    id=btnUpload      120s
    Click Button    Upload 
    Wait Until Element Is Visible    id=btnUpdate      300s
    Click Button    Install
    Wait Until Element Is Visible    class=primary     180s
    Click Button   Accept and Install Splunk Enterprise  
    Wait Until Element Is Visible    id=btnClose       300s
    Click Button    Close      
    sleep  5s  reason=wait for page to load 
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify New File validation by entering empty spaces
    [Tags]     C5357
    [Setup]   Setup for login UI
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FileNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry      ${EMPTY}
    sleep  1s   reason=wait for text
    Click Add Button
    Close Browser
    [Teardown]    Teardown And Download Diag
  
Verify that Remove option is not appearing with default folder
    [Tags]     C5372
    [Setup]   Setup for login UI
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/  
    Check If Icon is not Present      default       Remove
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that folder icon is appearing with folder name
    [Tags]     C5358
    [Setup]   Setup for login UI
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Check If Folder Icon is Present     default
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that user is able to create new folder
    [Tags]     C5349
    [Setup]   Setup for login UI
    [Timeout]   300 
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FolderNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     Farooq1
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message     Entity 'Farooq1' has been added.
    Close Browser
    [Teardown]    Teardown And Download Diag


Verify File / Folder rename functionality
    [Tags]     C5375
    [Setup]   Setup for login UI
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Editor Icon    Farooq1     Rename
    Input Text                  name=new_name     Farooq123
    sleep  1s  reason=wait for text to be written
    Click Add Button
    Should Display Flash Message    Entity 'apps/SplunkForwarder/Farooq1' has been renamed.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify File / Folder move functionality 
    [Tags]     C5377
    [Setup]   Setup for login UI
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Editor Icon    Farooq123     Move
    Should Display Popup Form       alert-box-container     Move:Farooq123    2    
    Click Cancel Button
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that user is not able to create multiple folder with same name
    [Tags]     C5365
    [Setup]   Setup for login UI
    [Timeout]   300 
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FolderNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     Farooq123
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Entity 'Farooq123' already exists.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify Remove functionality with user created files and folder
    [Tags]     C5373
    [Setup]   Setup for login UI
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Delete Editor Icon    Farooq123     Remove
    Should Display Popup Form       alert-box-container     Are you sure?   2
    Click Remove Button  
    Should Display Flash Message    Entity 'apps/SplunkForwarder/Farooq123' has been removed.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that after clicking on name link it redirected to Installed Splunk Apps page
    [Tags]     C5348
    [Setup]   Setup for login UI
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps 
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/ 
    Close Browser    
    [Teardown]    Teardown And Download Diag

Verify New Folder validation by entering large string
    [Tags]     C5352
    [Setup]   Setup for login UI
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FolderNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     fdfhfdhdfhfdhdfhdfhfdhdfhfdbbvcbcvbvvbbcbc
    sleep  1s   reason=wait for text
    Click Add Button
    # This test case needs to be revised more than 256 characters in order for an error message.
    Should Display Flash Message   Entity 'fdfhfdhdfhfdhdfhdfhfdhdfhfdbbvcbcvbvvbbcbc' has been added.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify New Folder validation by entering empty spaces 
    [Tags]     C5353
    [Setup]   Setup for login UI
    [Timeout]   300 
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FolderNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     ${EMPTY}
    sleep  1s   reason=wait for text
    Click Add Button
    # #Should Display Flash Message   Invalid.
    Close Browser
    [Teardown]    Teardown And Download Diag   

Verify user is not able to enter html tags in new file name field
    [Tags]     C5355
    [Setup]   Setup for login UI
    [Timeout]   300 
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FileNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry      '</n></t> 
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Invalid.
    Close Browser
    [Teardown]    Teardown And Download Diag 

Verify that user is able to create new file
    [Tags]     C5349
    [Setup]   Setup for login UI
    [Timeout]   300 
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FileNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry      Farooq12 
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Entity 'Farooq12' has been added.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that file icon is appearing with file name
    [Tags]     C5362
    [Setup]   Setup for login UI
    [Timeout]   300 
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Check If File Icon is Present     Farooq12
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify that user is not able to create multiple files with same name
    [Tags]     C5366
    [Setup]   Setup for login UI
    [Timeout]   300 
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FileNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry      Farooq12 
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Entity 'Farooq12' already exists.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify user is not able to enter html tags in new folder name field
    [Tags]     C5350
    [Setup]   Setup for login UI
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FolderNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     '</n></t>
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Invalid.
    Close Browser
    [Teardown]    Teardown And Download Diag

Verify New File validation by entering large string
    [Tags]     C5356
    [Setup]   Setup for login UI 
    [Timeout]   300
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Apps
    Click Desired Name   SplunkForwarder
    Location Should Contain      conf/index/apps/
    Click Icon By Class          FileNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry      fdfhfdhdfhfdhdfhdfhfdhdfhfdbbvcbcvbvvbbcbceed 
    sleep  1s   reason=wait for text
    Click Add Button
    # This test case needs to be revised more than 256 characters in order for an error message.
    # #Should Display Flash Message     Entity 'fdfhfdhdfhfdhdfhdfhfdhdfhfdbbvcbcvbvvbbcbceed' has been added.
    Close All Browsers
    [Teardown]    Teardown And Download Diag

*** comments ***
#Add test cases that you do not want to run.    
