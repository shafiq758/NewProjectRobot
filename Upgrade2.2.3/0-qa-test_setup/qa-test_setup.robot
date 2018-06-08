*** Settings ***
Library  SSHLibrary
Library  Collections
Library  Selenium2Library

Resource  login/keywords/login.robot

Resource  ../../test_resources/test_setup.robot
Resource  ../../test_resources/web.robot
Resource  ../../test_resources/remote.robot
Resource  ./keywords/setup_wizard.robot
Resource  ./keywords/setup_host.robot

*** Variables ***
# for selecting the first ip in var.json
${parent_node}                 0

# Variables used in node test suite
${Single_target}               001gemini
${Group_target}                Farooq

*** Keywords ***
Setup Second Browser
    setup headless browser
    set global variable  ${ip}  ${SBOX_IPS[${parent_node}]}
Initial Setup
    [Timeout]  1200
    [Arguments]  ${node}
    log  ${node}

    set global variable  ${node_id}  ${node}

    sleep  120s  reason=Wait for initialization
    enable host ssh access
#   setup wizard   #Skip this step and use provision API instead
    update cluster token

Setup For Single Node Headless Browser
    setup headless browser
    set global variable  ${homepage}  ${SBOX_HOME_PAGES[${parent_node}]}
    set global variable  ${ip}  ${SBOX_IPS[${parent_node}]}
    # For testing purposes
    #Log To Console      ${homepage}
    #Log To Console      ${sbox_web_user}
    #Log To Console      ${sbox_pass}
    Login To Web Home Page   ${sbox_web_user}   ${sbox_pass}

#***************************************************************************************************
# GENERAL
#**************************************************************************************************

Login To Web Home Page
    [Arguments]
    ...  ${username}=${SBOX_WEB_USER}
    ...  ${password}=${SBOX_PASS}
    log  ${username} ${password}

    When link to web page  go_link=${homepage}  to_link=${homepage}/${link_login}

    And enter to text box  ^id@${in_username}  ${username}
    And enter to text box  ^id@${in_password}  ${password}

    When click action button  ^text@${btn_login}
    ${status}=  run keyword and return status
    ...  location should be  ${homepage}/${link_welcome}
    Then run keyword if  "${status}"=="False"
    ...  location should be  ${homepage}/${link_welcome_new}

Login SSH Terminal
    Open Connection    ${SBOX_HOME_PAGES[${parent_node}]}
    ${password}=  get from dictionary  ${SBOX_DEFAULT_PASSES}  sbox
    Log To Console   ${password}
    login  ${SBOX_USER}  ${password}  delay=1 sec
#*** Test Cases ***
#Initial Setup for Machine
    #setup headless browser
    #set global variable  ${homepage}  ${SBOX_HOME_PAGES[${parent_node}]}
    #set global variable  ${ip}  ${SBOX_IPS[${parent_node}]}
    #Initial setup       ${parent_node}
