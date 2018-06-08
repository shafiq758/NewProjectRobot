*** Settings ***
Library          Selenium2Library

*** Variables ***
${username}    admin
${password}    Demo12345
${ServerName}    time.nist.gov
${selegion}    Antarctica     
${DNSServer}    8.8.8.9 
${FTPUsername}    sbox
${FTPUserPassword}    10pearls1+
${Hostname}    gemini-00
${SSHPort}    2200
${SNMPAgentName}   shafiq1
${SNMPNetwork}    172.16.0.5
${SNMPMask}    23
${process_frequency}   300
${disk_frequency}    900
${disk_threshold}    10
${cpu_frequency}    300
${cpu_threshold}   90
${memory_frequency}   900
${memory_threshold}   5
${TrapIp}    172.16.0.5
${TrapCommunity}    123_gemini
${TrapPort}    514
${LogRuleName}    shafiq1
${LogRulePort}    514
${LogRulePath}    shafiq
${AdminRuleName}  Admin1
${AdminRulePath}    shafiq
${NodeGroupName}  Group1
${JobName}    Job1
${JobText}    this is a Job    
${JobOption}    Timezone »
${socket_port}   10443
${SplunkName}    splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
${httpport}    8800
${currentBuild}    2.2.3-253
${appliancePatch}    gemini-appliance-889.patch
${UpgradePack}    gemini-appliance-2.2-to-2.3.pack.v7
${afterUpgrade}    2.3-211
${content}    We are here
