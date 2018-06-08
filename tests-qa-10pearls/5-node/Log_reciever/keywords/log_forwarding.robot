*** Settings ***
Library          Selenium2Library
Resource  ../../../../test_resources/web.robot
Resource   ../../../0-qa-test_setup/qa-test_setup.robot

*** Keywords ***
Setup for login UI
    Setup For Single Node Headless Browser

Navigate to Node
    [Documentation]  Navigate to the Node page. (/SPLUNK/web/index)
    Click Element                   xpath=//aside//aside-wide//aside-packages//a[@href="/SYSTEM"]
    Wait Until Element Is Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/ethernet/index"]   120s

Click on Submenu Logreciever
    sleep  1s      reason=wait for page to load
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/logreceiver2/index"] 
    Run Keyword If    ${present}    Click Element                   xpath=//aside//aside-wide//aside-menu//aside-menuitems//a[@href="/SYSTEM/logreceiver2/index"]
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div[1]/ul/li[2]/a   60s

Click Radio3 Button
    sleep  2s      reason=wait for page to load
    Wait Until Element Is Visible      id=radio_3       60s
    Click Element   id=radio_3

Click Rule Resource
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[1]/li/div/div/span[1]     60s
    Click Element   xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[1]/li/div/div/span[1]

Click Add Filter
    Click Element          xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[1]/li/div/ul/li[2]/a
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[3]/input          30s

Click Add Destination
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[2]/li/div/div/span[1]      30s
    Click Element      xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[2]/li/div/div/span[1]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[2]/li/div/ul/li[3]/a   30s
    Click Element    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[2]/li/div/ul/li[3]/a
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[3]/input   60s

Click Save Rule
    Wait Until Element Is Visible  xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/button    60s
    Click Element       xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/button

Click On Source Edit
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div[1]/div[2]/div[1]/div/ul[1]/li/div/div/span[1]   60s
    Click Element     xpath=/html/body/div[1]/div/div[1]/div[2]/div[1]/div/ul[1]/li/div/div/span[1]
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div[1]/div[2]/div[1]/div/ul[1]/li/div/ul/li[1]/a          60s
    Click Element   xpath=/html/body/div[1]/div/div[1]/div[2]/div[1]/div/ul[1]/li/div/ul/li[1]/a            
    Wait Until Element Is Visible        xpath=/html/body/div[2]/div[1]/form/div[3]/form/form-row[1]/input  60s

Click On Filter Edit
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[2]/li/div/div/span[1]      60s
    Click Element      xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[2]/li/div/div/span[1]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[2]/li/div/ul/li[1]/a     60s
    Click Element      xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[2]/li/div/ul/li[1]/a      
    Wait Until Element Is Visible         xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[1]/input     60s      

Click On Destination Edit
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[4]/li/span/div/div/span[1]  60s
    Click Element   xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[4]/li/span/div/div/span[1]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[4]/li/span/div/ul/li[1]/a  60s    
    Click Element   xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[4]/li/span/div/ul/li[1]/a
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[1]/input    60s    

Delete Rule
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div[1]/div[2]/div/h3/ico[3]    30s
    Click Icon By Class   Clear
    Wait Until Element Is Visible      xpath=/html/body/div[2]/div[1]/form/div[3]/p        60s  
    Click Button   Yes
    Wait Until Element Is Visible    xpath=/html/body/flash/p      60s

Click Add Destination From Source
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[1]/li/div/div/span[1]      30s
    Click Element      xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[1]/li/div/div/span[1]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[1]/li/div/ul/li[3]/a   30s
    Click Element    xpath=/html/body/div[1]/div/div[1]/div[2]/div/div/ul[1]/li/div/ul/li[3]/a
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div[1]/form/div[3]/form-row[3]/input   60s



