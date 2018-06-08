*** Settings ***
Library          Selenium2Library

Resource  ../../../test_resources/web.robot
Resource   ../../0-qa-test_setup/qa-test_setup.robot
Resource  Variables/Variable.robot
Library    Collections

*** Keywords ***
Setup for login UI
   Setup For Single Node Headless Browser
Click Starter Page
   [Documentation]  For starting page
   ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=/html/body/main/card/banner/footer/button
   Run Keyword If    ${present}   Click Element               xpath=/html/body/main/card/banner/footer/button



Click Login Button
   ${present}=  Run Keyword And Return Status     Element Should Be Visible    xpath=/html/body/main/card/footer/button
   Run Keyword If    ${present}   Click Element               xpath=html/body/main/card/footer/button
   ${present}=  Run Keyword And Return Status     Element Should Be Visible   xpath=/html/body/main/card/footer/next/button
   Run Keyword If    ${present}   Click Element               xpath=/html/body/main/card/footer/next/button
   Wait Until Element Is Visible    xpath=//aside//aside-wide//aside-packages//a[@href="/SOLUTION"]      60s

Login To Web
      
   [Documentation]      For providing login, this is the precondition.
   #Open Browser                https://172.16.3.3    Firefox
   #Click Starter Page
   Input Text                  id=username     admin
   Input Text                  id=password     Demo12345
   Click Login Button
   Location Should Contain     SOLUTION/root/index                         #HOME/solution/index      
    



Navigate To Node 
   [Documentation]    To setup Node for Upgrade Testing
   Click Element    xpath=/html/body/aside/aside-wide/aside-packages/a[2]/aside-package
Add NTP Server 
   [Documentation]   To Add NTP server For Upgrade
   Click Icon By Class    Add
   Input Text    name=ntp_server    ${ServerName}
   Click Button    Add
   Should Display Flash Message    NTP server has been added successfully.    
    
Update Time
   [Documentation]    To Update Time Zone
   Click Element    xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/timezone/index"]
   Wait Until Element Is Visible    id=selRegion    
   Click Element    id=selRegion
   sleep    5s
   Select From List    id=selRegion   ${selegion}
   Click Button    Save
   sleep  2s
   Should Display Flash Message    Timezone has been set successfully.
Add DNS Server
   [Documentation]    To add DNS server for Upgrade Testing
   Click ELement    xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/ethernet/index"]/aside-menuitem
   sleep    5s
   Click Icon By Class    Add
   Wait Until Element Is Visible    id=name_server
   Input text    id=name_server    ${DNSServer}
   Click Button    Add
   Should DIsplay Flash Message    Name Server added successfully.

Enable FTP 
   [Documentation]    Enable FTP for Upgrade testing 
   Click Element    xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/ftp/index"]/aside-menuitem
   sleep   5s
   ${toggle_status}  Get Toggle Status    tb_ftp_status 
    #Log To Console   ${toggle_status}
    run keyword if   '${toggle_status}'=="off"    run keywords  
    ...   Set Toggle  tb_ftp_status  on    
    ...   AND    sleep    5s    
    ...   AND    Should DIsplay Flash Message    FTP service has been enabled.   
        
   

Add FTP User
   [Documentation]   Add FTP User for Upgrade  
   ${toggle_status}  Get Toggle Status    tb_ftp_status
   run keyword if   '${toggle_status}'=="off"    run keywords  
    ...   Set Toggle  tb_ftp_status  on    
    ...   AND    sleep    5s    
    ...   AND    Should DIsplay Flash Message    FTP service has been enabled.
   Click ELement    xpath=//*[@id="ico_add_user"]

   Wait Until Element Is Visible    name=username
   Input Text     name=username    ${FTPUsername}
   Input Text     name=password    ${FTPUserPassword}
   Click Button    Add
   Should Display Flash Message    FTP user has been created successfully.

Change Hostname
   [Documentation]    Change Hostname for Upgrade testing 
   Click Element     xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/hostname/index"]/aside-menuitem
   Input Text    id=hostname    ${Hostname}
   Click Button   Save
   Should Display Flash Message    Hostname has been changed successfully. 	     


Change SSH Port 
   [Documentation]  Change SSH Port for Upgrade testing
   Click Element     xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/ssh/index"]/aside-menuitem    
   Input Text    name=port    ${SSHPort}
   Click Button  Update
   Should Display Flash Message    SSH service configuration has been updated.   


Enable SNMP Agent
   [Documentation]  Enable SNMP Agent
   Click Element     xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/snmp/index"]/aside-menuitem
   ${toggle_status}  Get Toggle Status    tb_snmp
   run keyword if   '${toggle_status}'=="off"    run keywords  
    ...   Set Toggle  tb_snmp  on    
    ...   AND    sleep    2s    
    ...   AND    Should DIsplay Flash Message    SNMP has been enabled.

Add SNMP agent
   [Documentation]   Add SNMP Agent
   #Enable SNMP Agent
   sleep   5s
   Click Element    xpath=//*[@id="ico_new_agent"]
   Wait Until Element Is Visible   name=name    5s
   Input Text     name=name    ${SNMPAgentName}
   Click Element    id=radio-v2c
   Input Text    name=network   ${SNMPNetwork}
   Input Text    name=mask      ${SNMPMask}
   Click Button  Add 
   Should Display Flash Message    SNMP agent has been created successfully.
       


Add SNMP Trashold 
   [Documentation]   Add SNMP trashold for Upgrade testing 
   #Enable SNMP Agent
   sleep    5s
   Click Element    xpath=/html/body/tabs/tabs-wrapper/a[@href="/SYSTEM/trap_monitor/index"]/tab
   ${toggle_status}  Get Toggle Status    tb_process
        run keyword if   '${toggle_status}'=="off"  Set Toggle  tb_process  on
   Input Text    id=process_frequency    ${process_frequency}
   Click Element      processes-ftp     
   Click Element      id=tb_disk
   Input Text    id=disk_frequency  ${disk_frequency}
   Input Text    id=disk_threshold  ${disk_threshold}
   Click Element   id=tb_link
   Click Element   id=tb_cpu
   Input Text    id=cpu_frequency   ${cpu_frequency}
   Input Text    id=cpu_threshold   90
   Click Element   id=tb_memory
   Input Text    id=memory_frequency    ${memory_frequency}
   Input Text    id=memory_threshold   ${memory_threshold}
   Click Button    Save
   sleep  5s
   Reload Page
   # Wait Until Element is Visible    xpath=/html/body/flash     5s
   # Should Display Flash Message   Monitor item has been updated successfully.



Add SNMP Trap Destination
   [Documentation]   Add SNMP trap Destination for Upgrade testing
   #Enable SNMP Agent
   Sleep   5s
   Click Element    xpath=/html/body/tabs/tabs-wrapper/a[@href="/SYSTEM/trap_notification/index"]/tab
   Click Element   xpath=//*[@id="ico_new_notification"]
   Wait Until Element Is Visible   name=host   5s
   Input Text    name=host    ${TrapIp}
   Input Text   name=community     ${TrapCommunity}
   Input Text   name=port   ${TrapPort}
   Click Button   Add
   Should Display Flash Message    Notification has been created successfully.

     
Create Failover Group
   [Documentation]   Create a Failover group for Upgrade testing
   Click Element     xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/failover/index"]/aside-menuitem
   Click Element    xpath=/html/body/main/section[2]/info/a[1]/ico
   Wait Until Element Is Visible    name=group_ip     5s
   Input Text    name=group_ip    172.16.0.55
   Click Button    Add
        


Create Log Receiver Rule
   [Documentation]   Create a LOg Receiver rule for Upgrade testing
   Click Element     xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/logreceiver2/index"]/aside-menuitem
   Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div[3]/div[1]/span/ico     30s
   Click Element   xpath=/html/body/div[1]/div/div[3]/div[1]/span/ico
   Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div[1]/form/div[2]/div[1]/input      5s
   Input Text    xpath=/html/body/div[1]/div/div[1]/div[1]/form/div[2]/div[1]/input    ${LogRuleName}
   Click Button   OK 
   Click Element   xpath=/html/body/div[1]/div/div[1]/div[1]/form/div[2]/div[2]/md-radio-group/md-radio-button[2]/div[1]/div[1]
   Click Button  OK
   Wait Until Element Is Visible    xpath=//*[@id="dLabel"]   5s 
   Click Element    xpath=//*[@id="dLabel"]
   Click ELement    xpath=/html/body/div[1]/div/div[3]/div[2]/div/div/ul[1]/li/div/ul/li[2]/a
   sleep   5s 
   Input Text    xpath=/html/body/div[1]/div/div[1]/div[1]/form/div[2]/div[3]/input   ${filter} 
   Click Button   OK 
   Sleep   5s 
   Click ELement      xpath=/html/body/div[1]/div/div[3]/div[2]/div/div/ul[2]/li/div/div/span[1]
   Click Element      xpath=/html/body/div[1]/div/div[3]/div[2]/div/div/ul[2]/li/div/ul/li[3]/a
   Click Button    OK 
   Sleep    5s
   #Input Text   name=port   514
   #Input Text   id=path     shafiq
   Click Button   Save Rule
   #Should Display Flash Message   Log receiver rule has been updated.

Create Admin Log Rule 
   [Documentation]    Create Admin Log RUle for Upgrade testing 
   Sleep   5s 
   Click ELement   xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/adminlog/index"]/aside-menuitem
   Wait Until ELement Is Visible    xpath=/html/body/page/main/section/info/a/ico     5s
   Click ELement     xpath=/html/body/page/main/section/info/a/ico
   Wait Until Element Is Visible    name=name    5s
   Input Text    name=name    ${AdminRuleName}
   Input Text    name=path    ${AdminRulePath}
   Click Button    Add 
   Sleep     5s 
   Should Display Flash Message    Admin log forwarding rule has been created successfully.
   Capture Page Screenshot



Navigate to Cluster 
   [Documentation]   Going to the Cluster Screen 
   click Element    xpath=/html/body/aside/aside-wide/aside-packages/a[@href="/UNO"]/aside-package/img

Register to Parent with IP in topology page
   [Documentation]  Register Child node to Parent node
   click Element    xpath=/html/body/main/actions/a[1]/ico
   Wait Until Element Is Visible    name=host   5s
   Input Text   name=host    172.16.3.3
   Input Text   name=passphrase    5d56a24b
   Click Button   Register
   Should Display Flash Message    Register to parent node successfully.


Create Node Group
   [Documentation]  Create Node Group 
   click Element   xpath=/html/body/aside/aside-wide/aside-menu[2]/aside-menuitems/a[@href="/UNO/group/index"]/aside-menuitem
   click Element   xpath=/html/body/main/section/info/a/ico
   Wait Until Element Is Visible    name=name    5s 
   Input Text    name=name    ${NodeGroupName}
   sleep    5s
    
   Click Element   xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[3]/div 
   sleep   2s   
   Click Element   xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[3]/div/dropdown/a[1]/item
   sleep   2s
   Click Element   xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[3]/div
   sleep  2s
   Click Element    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[3]/div/dropdown/a[1]/item
   Click Button   Add
   Sleep    5s
   Capture Page Screenshot
 
Create Job 
   [Documentation]   Create Job for Upgrade testing
   Click ELement    xpath=/html/body/aside/aside-wide/aside-menu[2]/aside-menuitems/a[@href="/UNO/job/index"]/aside-menuitem
   Wait Until Element Is Visible    xpath=/html/body/main/section[2]/info/a/ico    15s
   Click Element    xpath=/html/body/main/section[2]/info/a/ico
   Wait Until Element Is Visible    name=subject    15s
   Input Text    name=subject    ${JobName}
   Press Key    name=subject     \\09
   sleep    2s
   Input Text    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[2]/textarea    ${JobText}
    #Press Key    xpath=/html/body/side-panel-object/side-panel/side-panel-container/main/section/form/form-row[2]/textarea     \\09
   # sleep    2s
   #Click Element    id=task_category
   Select From List    xpath=//*[@id="task_category"]   ${JobOption}
   sleep  2s
   Click Button    Create & Start  
   sleep  4s
   #Should Display Flash Message    Job has been created and will start immediately.

    
     

Navigate to Setting 
   #Log To Console  ${ip}
   [Documentation]  Going to setting screen 
   Wait Until Element Is Visible    xpath=/html/body/aside/aside-wide/aside-packages/a[@href="/PLATFORM"]/aside-package/img    10s
   Sleep    5s
   Click Element    xpath=/html/body/aside/aside-wide/aside-packages/a[@href="/PLATFORM"]/aside-package/img


Change Admin Web Listening Port

   #${url}=  set variable  https://${host_ip}:10443
   [Documentation]  Change Port for Admin Web
   Click Element    xpath=/html/body/tabs/tabs-wrapper/a[@href="/PLATFORM/admin/index"]/tab
   Input Text      id=socket_port      ${socket_port}
   Click Button    Save
   #Should Display Flash Message    Change has been saved. Please access url 'https://172.16.3.3:10443' to continue to the admin web service.
   Sleep   5s
   Capture Page Screenshot
   Reload Page
   Go To      https://${ip}:10443
   Sleep   5s
   Capture Page Screenshot
   Input Text     id=username     ${sbox_web_user}
   Input Text      id=password     ${sbox_pass}
   Click Login Button
   sleep    5s
   Capture Page Screenshot

Enable And Input In Login Banner 
   [Documentation]   Enable Login Banner for Upgrade Process
   Navigate to Setting
   Click Element    xpath=/html/body/aside/aside-wide/aside-menu[5]/aside-menuitems/a[@href="/PLATFORM/banner/index"]/aside-menuitem
    sleep    5s
    ${xpath_combined}=    Set Variable     //*[@class="off"]
    ${count}=    Get Matching Xpath Count    ${xpath_combined} 
    Log    Num value is ${count}
    run keyword if   ${count} == 1    run keywords  
    ...   Click Element    xpath=/html/body/main/section[1]/h2/a/toggle-button    
    ...   AND    sleep    5s    
    ...   AND    Should DIsplay Flash Message    The login banner has been enabled. 
    Sleep    5s  
    Input Text   name=content    ${content}
    Click Button    Save
    Should Display Flash Message    The login banner content has been updated.    

Navigate to Splunk 
   [Documentation]   Navigate to Splunk for Upgrade
   Wait Until Element Is Visible     xpath=/html/body/main/section[2]/card[2]/actions/a/button   5s
   Click Element    xpath=/html/body/main/section[2]/card[2]/actions/a/button


Install Splunk 
   [Documentation]   Install Splunk for Upgrade 
   #Click Element    xpath=/html/body/main/section[2]/card[2]/actions/a/button
   Wait Until ELement Is Visible    xpath=/html/body/main/segment[2]/info/a/ico    5s
   Click Element     xpath=/html/body/main/segment[2]/info/a/ico
   sleep     5s
   Execute JavaScript  document.getElementById('file').style.display = 'opacity:1';
   Execute JavaScript  ("arguments[0].checked = true;", id=file)
   Execute JavaScript  document.getElementById('file').classList.remove('hidden')
   Execute JavaScript  document.getElementById('file').classList.add('MyClass')
   Choose file     id=file      ${CURDIR}/${SplunkName}
   Click Button   Upload
   sleep   10s 
   Capture Page Screenshot
   Wait Until Element Is Visible    id= btnUpdate           1200s
   Click Element   id=btnUpdate
   Wait Until Element Is Visible    xpath=/html/body/popup-window-object/popup-window/popup-window-container/footer/button[1]  300s 
   Click Element     xpath=/html/body/popup-window-object/popup-window/popup-window-container/footer/button[1]
   Wait Until Element Is Visible    id=btnClose                  300s 
   Click Element    id=btnClose

Validate Splunk Web Enabled
   [Documentation]   Validate Splunk Web Is Enabled
   Wait Until Element Is Visible     xpath=/html/body/aside/aside-wide/aside-menu[4]/aside-menuitems/a[@href="/SPLUNK/web/index"]/aside-menuitem   20s
   Click Element    xpath=/html/body/aside/aside-wide/aside-menu[4]/aside-menuitems/a[@href="/SPLUNK/web/index"]/aside-menuitem
   Sleep   10s
   ${toggle_status}  Get Toggle Status    toggleSplunkWeb 
   #Log To Console   ${toggle_status}
   run keyword if   '${toggle_status}'=="off"    run keywords  
   ...   Set Toggle  toggleSplunkWeb  on    
   ...   AND    Wait Until ELement Is Visible    id=btnClose    150s     
   ...   AND    Click Element    id=btnClose
          



Change Splunk HTTP port 
   [Documentation]    Change Splunk HTTP port for Upgrade
   Validate Splunk Web Enabled
   sleep    20s  
   Input Text     name=httpport     ${httpport}
   Click Button    Restart Splunk to Apply
   Wait Until ELement Is Visible    id=btnClose    150s
   Click Element    id=btnClose




UpgradePack
   [Documentation]  To Upload Upgrade Pack
   Wait Until Element Is Visible    xpath=/html/body/page/main/segment[1]/actions/a/ico   5s
   Element Text Should Be     xpath=/html/body/page/main/segment[1]/article/p/bold          ${currentBuild}
   Capture Page Screenshot 
   Click Element    xpath=/html/body/page/main/segment[1]/actions/a/ico
   #Wait Until Element Is Visible    xpath=/html/body/div[2]/div[1]/form/div[5]/button[1]       5s
   #Click Element    xpath=/html/body/div[2]/div[1]/form/div[5]/button[1]
   sleep    5s
   Click Button    Continue       #(Use If Splunk is installed)  
   sleep    5s     
   Capture Page Screenshot



Upload Upgrade Pack
   [Documentation]     Finally Upload Upgrade Pack
   Navigate to Setting
   Capture Page Screenshot
   UpgradePack
   Capture Page Screenshot
   Execute JavaScript    document.getElementById('upgrade_pack').style.display = 'block'
   choose file    id=upgrade_pack       ${CURDIR}/2.2.3to2.3/${UpgradePack}
   Capture Page Screenshot
   Wait Until Element Is Visible       id=btn_upload    5s
   Click Button    Upload 
   Capture Page Screenshot
   Wait Until Element Is Visible       id=btn_upgrade    50m
    
   Capture Page Screenshot
     
   Click Button    Upgrade
   Sleep    10m
   Capture Page Screenshot
   Reload Page
   Sleep    10m 
   Capture Page Screenshot
   Reload Page
   Sleep    10m
   Reload Page
   Click Button   OK 
   Login To Web
   Navigate to Setting
   Sleep    5s
   Element Text Should Be     xpath=/html/body/div[1]/div/div/div/div[1]/article/p/bold          ${afterUpgrade}


Validate Netowrk Settings
  [Documentation]    Validate Network After Upgrade
  Navigate To Node
  Click ELement    xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/ethernet/index"]/aside-menuitem
  sleep    5s
  ${text}     Get Text     xpath=//*[@id="view-wrap"]
  #Log To Console     ${text}
  Element Should Contain  xpath=//*[@id="view-wrap"]   ${DNSServer}




Validate NTP Server 
   [Documentation]    Validate NTP Added Server after Upgrade
   Navigate To Node
   Sleep   7s
   ${text}     Get Text       xpath=/html/body/div/main
   #Log To Console     ${text}
   Element Should Contain  xpath=/html/body/div/main   ${ServerName}


Validate Time Stamp 
   [Documentation]    To Update Time Zone
   Navigate To Node
   Sleep  5s
   Click Element    xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/timezone/index"]
   Wait Until Element Is Visible    id=selRegion   50s    
   ${text}     Get Value       id=selRegion
   Log To Console     ${text}
   ${text1}   Get Value    xpath=/html/body/div/main/section/form/form-row[8]/selectwrapper/select
   #Log To Console     ${text1}
   #Element Should Contain  xpath=/html/body/main   Antarctica
   #Element Should Contain  xpath=/html/body/main   Casey (+11, UTC +11:00)
   #Should be equal as strings   ${text1}    Antarctica/Casey  
   Should be equal as strings   ${text}    ${selegion}

Validate SNMP Setting 
   [Documentation]    To Validate SNMP
   Navigate To Node
   Sleep  5s
   Click Element     xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/snmp/index"]/aside-menuitem 
   Sleep   5s
   ${text}   Get Text    xpath=//*[@id="view-wrap"]
  # Log To Console     ${text}
   Element Should Contain  xpath=//*[@id="view-wrap"]   ${SNMPAgentName}
   Element Should Contain  xpath=//*[@id="view-wrap"]   2c



Validate FTP Settings 
   [Documentation]   To validate FTP Settings
   Navigate To Node
   Sleep  5s
   Click Element    xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/ftp/index"]/aside-menuitem
   ${text}   Get Text    xpath=/html/body/div/main
   #Log To Console     ${text}
   Element Should Contain  xpath=/html/body/div/main   ${FTPUsername}
   #Element Should Contain  xpath=/html/body/div/main   /opt/sbox
     

Validate SSH Settings
   [Documentation]   To validate SSH Settings
   Navigate To Node
   Sleep  5s
   Click Element     xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/ssh/index"]/aside-menuitem  
   ${text}    Get Value    name=port
   #Log To Console     ${text}
   Should be equal as strings   ${text}   ${SSHPort}


Validate SNMP Trap Destination
   [Documentation]  To validate SNMP Trap destination
   Click Element    xpath=/html/body/div/tabs/tabs-wrapper/a[@href="/SYSTEM/trap_notification/index"]/tab
   ${text}    Get Text    xpath=//*[@id="view-wrap"]
   #Log To Console     ${text}
   Element Should Contain  xpath=//*[@id="view-wrap"]   ${TrapIp}
   Element Should Contain  xpath=//*[@id="view-wrap"]   ${TrapCommunity}
   Element Should Contain  xpath=//*[@id="view-wrap"]   ${TrapPort}

Validate Log Receiver Rule
   [Documentation]    To validate Log Receiver Rule Persist after Upgrade
   Navigate To Node
   Sleep  5s
   Click Element     xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/logreceiver2/index"]/aside-menuitem
   Wait Until Element Is Visible    xpath=//*[@id="rule-wrap-f757b2"]     50s
   ${text}    Get Text    xpath=//*[@id="rule-wrap-f757b2"]
   #Log To Console     ${text}
   Element Should Contain  xpath=//*[@id="rule-wrap-f757b2"]   shafiq1
   
Validate master Node name
   [Documentation]     To validate master node name 
   Navigate To Node
   Sleep  5s
   Click Element     xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/hostname/index"]/aside-menuitem
   Sleep    2s
   ${text}    Get Value    id=hostname
   #Log To Console     ${text}
   Should be equal as strings   ${text}   ${Hostname}


Validate Admin Forwarding Rule
   [Documentation]    To validate Admin Forwarding Rule
   Navigate To Node
   Sleep  5s
   Click ELement   xpath=/html/body/aside/aside-wide/aside-menu[1]/aside-menuitems/a[@href="/SYSTEM/adminlog/index"]/aside-menuitem
   Sleep   5s 
   ${text}    Get Text    xpath=//*[@id="view-wrap"]
   #Log To Console     ${text}
   Element Should Contain  xpath=//*[@id="view-wrap"]  ${AdminRuleName}
   Element Should Contain  xpath=//*[@id="view-wrap"]  file
   Element Should Contain  xpath=//*[@id="view-wrap"]  /opt/sbox/data/${AdminRulePath}


Cluster Settings 
   [Documentation]     To validate Cluster Settings after Upgrade
   Navigate to Cluster
   click Element   xpath=/html/body/aside/aside-wide/aside-menu[2]/aside-menuitems/a[@href="/UNO/group/index"]/aside-menuitem
   Sleep   5s
   ${text}    Get Text    xpath=//*[@id="view-wrap"]
   #Log To Console     ${text}
   Element Should Contain  xpath=//*[@id="view-wrap"]  ${NodeGroupName}       
   Element Should Contain  xpath=//*[@id="view-wrap"]  2

Job Settings 
   [Documentation]  To validate created Job after UPgrade settings
   Navigate to Cluster
   Click Element    xpath=/html/body/aside/aside-wide/aside-menu[2]/aside-menuitems/a[@href="/UNO/job/index"]/aside-menuitem
   Sleep  5s 
   ${text}    Get Text    xpath=//*[@id="view-wrap"]
   #Log To Console     ${text}
   Element Should Contain  xpath=//*[@id="view-wrap"]  ${JobName}
   #Element Should Contain  xpath=//*[@id="view-wrap"]  ALL NODES
   #Element Should Contain  xpath=//*[@id="view-wrap"]  Get current timezone

Splunk Settings
   [Documentation]   To validate Splunk Port changed still persist after Uprade
   Click Element   xpath=/html/body/aside/aside-wide/aside-packages/a[@href="/SPLUNK"]/aside-package/img
   #Validate Splunk Web Enabled 
   #(Use In Headless)
   Wait Until Element Is Visible   xpath=/html/body/aside/aside-wide/aside-menu[4]/aside-menuitems/a[@href="/SPLUNK/web/index"]/aside-menuitem     50s
   Click ELement    xpath=/html/body/aside/aside-wide/aside-menu[4]/aside-menuitems/a[@href="/SPLUNK/web/index"]/aside-menuitem
   Sleep  10s 
   ${text}    Get Value    name=httpport
   Log To Console     ${text}
   Should be equal as strings   ${text}   ${httpport}


Validate Web Listeninig Port 
   [Documentation]   To validate Setting Port
   Navigate to Setting   
   sleep   5s 
   Click Element    xpath=/html/body/div[1]/tabs/tabs-wrapper/a[@href="/PLATFORM/admin/index"]/tab
   ${text}    Get Value    id=socket_port
   #Log To Console     ${text}
   Should be equal as strings   ${text}   ${socket_port}



Validate Login Banner
   [Documentation]   To validate Login Banner after Upgrade
   Navigate to Setting   
   sleep   5s 
   Click Element    xpath=/html/body/aside/aside-wide/aside-menu[5]/aside-menuitems/a[@href="/PLATFORM/banner/index"]/aside-menuitem
   sleep    5s
   ${xpath_combined}=    Set Variable     //*[@class="off"]
   ${count}=    Get Matching Xpath Count    ${xpath_combined} 
   Log    Num value is ${count}
   run keyword if   ${count} == 1    run keywords  
    ...   Click Element    xpath=/html/body/main/section[1]/h2/a/toggle-button    
    ...   AND    sleep    5s    
    ...   AND    Should DIsplay Flash Message    The login banner has been enabled. 
   Sleep    5s  
   ${text}    Get Text   xpath=/html/body/div/main
   Log To Console     ${text}
   #${text}   Convert to string  ${text}
   #${text1}   Convert to string  ${text1}
   Element Should Contain  xpath=/html/body/div/main  ${content} 
     
   
 
