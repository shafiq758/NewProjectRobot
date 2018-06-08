*** Settings ***
Resource   qa-test_setup.robot

*** Test Cases ***
Initial Setup for Machine
    setup headless browser
    set global variable  ${homepage}  ${SBOX_HOME_PAGES[${parent_node}]}
    set global variable  ${ip}  ${SBOX_IPS[${parent_node}]}
    Initial setup       ${parent_node}
