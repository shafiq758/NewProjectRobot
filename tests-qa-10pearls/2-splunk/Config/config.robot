*** Settings ***
Library  Selenium2Library
Resource  keywords/config.robot

Test Setup  setup browser
Test Teardown  teardown and download diag

*** Test Cases ***  
Navigation (ISO)
    [Tags]     C3862
    [Setup]   Setup for login UI
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Config Editor
    Click Table Item    anonymizer
    Close Browser
    [Teardown]    Teardown And Download Diag

Navigation (continued) (ISO)
    [Tags]     C3862
    [Setup]   Setup for login UI 
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Config Editor
    Click Table Item    copyright.txt
    Close Browser
    [Teardown]    Teardown And Download Diag

Create new folder with invalid name should fail (ISO)
    [Tags]     C6726
    [Setup]   Setup for login UI 
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
    #  #Should Display Flash Message    Invalid.
    Click Icon By Class          FolderNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     '</n></t>
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Invalid.
    Close Browser
    [Teardown]    Teardown And Download Diag

Create new folder (ISO)
    [Tags]     C1030
    [Setup]   Setup for login UI
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Config Editor
    Click Icon By Class          FolderNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     Testing1
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Entity 'Testing1' has been added.
    Close Browser
    [Teardown]    Teardown And Download Diag

Create new folder with existing name should fail (ISO)
    [Tags]     C6728
    [Setup]   Setup for login UI
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Config Editor
    Click Icon By Class          FolderNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     Testing1
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Entity 'Testing1' already exists.
    Close Browser
    [Teardown]    Teardown And Download Diag

Create new file with invalid name should fail (ISO)
    [Tags]     C6727
    [Setup]   Setup for login UI
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
    #  #Should Display Flash Message    Invalid.
    Click Icon By Class          FileNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     '</n></t>
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Invalid.
    Close Browser
    [Teardown]    Teardown And Download Diag

Create new file (ISO)
    [Tags]     C1031
    [Setup]   Setup for login UI 
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Config Editor
    Click Icon By Class          FileNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     readme.txt
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Entity 'readme.txt' has been added.
    Close Browser
    [Teardown]    Teardown And Download Diag 

Create new file with existing name should fail (ISO)
    [Tags]     C6729
    [Setup]   Setup for login UI
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Config Editor
    Click Icon By Class          FileNew
    Wait Until Element Is Visible         xpath=/html/body/side-panel-object/side-panel/side-panel-container/header    20s
    Input Text                  id=new_entry     readme.txt
    sleep  1s   reason=wait for text
    Click Add Button
    Should Display Flash Message    Entity 'readme.txt' already exists.
    Close Browser
    [Teardown]    Teardown And Download Diag

Copy, Move, and Rename file (ISO)
    [Tags]     C3866
    [Setup]   Setup for login UI
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Config Editor
    Click Element Icon Of         readme.txt   Copy
    Click Copy Button
    Should Display Flash Message    Entity 'readme.txt' has been copied.
    Click Element Icon Of         readme(1).txt   Move
    Click Add New Folder
    Input Text      id=new_folder    gemini
    Click Icon By Class          icon Add
    Click Folder   gemini
    Click Move Button
    Should Display Flash Message    Entity 'readme(1).txt' has been moved.
    Click Rename Icon Of         readme(1).txt   Rename
    Input Text    name=new_name         read.old
    Click Rename Button
    Should Display Flash Message    Entity 'gemini/readme(1).txt' has been renamed.
    Close Browser
    [Teardown]    Teardown And Download Diag

Editing and Versioning (ISO)
    [Tags]     C3867
    [Setup]   Setup for login UI
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Config Editor
    Click Table Item   readme.txt
    Input Text  id=content     These are some changes made to the file.
    Click Element     id=btnSave
    Should Display Flash Message    The file has been updated.
    #TODO (case needs to be completed.)
    Close Browser
    [Teardown]    Teardown And Download Diag

Remove user created file and folder should be successful (ISO)
    [Tags]     C6730
    [Setup]   Setup for login UI
    Navigate to the Home page
    Navigate to Splunk
    Click on Submenu Config Editor
    Click Delete Icon of    readme.txt  Clear
    Click Remove Sidepanel Button    Remove
    Should Display Flash Message    Entity 'readme.txt' has been removed.
    Close All Browsers
    [Teardown]    Teardown And Download Diag

