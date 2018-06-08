*** Settings ***
Library  SSHLibrary
Library  OperatingSystem

Variables  ../variables/default.yaml

*** Variables ***
${ssh_public_keyfile}			${setup_ssh_access_default["ssh_key"]["public_key_file"]}
${ssh_private_keyfile}			${setup_ssh_access_default["ssh_key"]["private_key_file"]}
${ssh_key_path}					${setup_ssh_access_default["ssh_key"]["key_folder"]}
${ssh_keygen_cmd}               ${setup_ssh_access_default["ssh_cmd"]["keygen"]}
${api_port}                     ${setup_ssh_access_default["api"]["port"]}
${api_path}                     ${setup_ssh_access_default["api"]["path"]}
${curl_prefix}                  ${setup_ssh_access_default["ssh_cmd"]["curl_cmd_prefix"]}
${SBOX_USER}                    sbox

*** Keywords ***
Enable Host SSH Access
    ${host_ip}=  set variable  ${SBOX_IPS[${node_id}]}

    Remove Directory  ${ssh_key_path}  True
    Create Directory  ${ssh_key_path}
    run  ${ssh_keygen_cmd}
    OperatingSystem.file should exist  ${ssh_public_keyfile}
	wait until keyword succeeds  5 min  30 sec  provision ssh key to host  ${host_ip}

#************************************************************************************
# GENERAL
#************************************************************************************
Login Host with Default Password
    [Arguments]  ${host_ip}=${EMPTY}
    log  ${host_ip}

    open connection  ${host_ip}
    ${password}=  get from dictionary  ${SBOX_DEFAULT_PASSES}  ${SBOX_USER}

    login  ${SBOX_USER}  ${password}  delay=1 sec

    write  ${password}

    ${output}=  read  delay=1 sec
    should contain  ${output}  New password

Provision SSH Key To Host
    [Arguments]  ${host_ip}=${EMPTY}
    log  ${host_ip}

    ${ssh_key}=  run  cat ${ssh_public_keyfile}
    Should Not Be Empty  ${ssh_key}
    ${data}=  catenate
    ...  {
    ...    \\"ssh_key\\":\\"${ssh_key}\\",
    ...    \\"accept_eula\\":true,
    ...    \\"timezone\\":\\"America/Los_Angeles\\",
    ...    \\"admin_pwd\\":\\"${SBOX_PASS}\\",
    ...    \\"license\\":{\\"trial\\":true}
    ...  }

    ${cmd_res}=  run  ${curl_prefix} -d "${data}" https://${host_ip}:${api_port}/${api_path}

    Should Be Empty  ${cmd_res}  msg=Failed to push ssh public key:${cmd_res}
    login host with public key  host_ip=${host_ip}

Login Host with Public Key
    [Arguments]  ${host_ip}=${EMPTY}  ${ssh_keyfile}=${ssh_private_keyfile}
    log  ${host_ip}

    open connection  ${host_ip}
    ${output}=  login with public key  ${SBOX_USER}  ${ssh_keyfile}  delay=1 sec
    should contain  ${output}  ${SBOX_USER}
    #close connection
