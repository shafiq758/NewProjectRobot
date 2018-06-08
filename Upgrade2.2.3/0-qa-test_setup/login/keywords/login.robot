*** Settings ***
Resource  ../../../../test_resources/web.robot
Resource  ../../../../test_resources/remote.robot

Variables  ../variables/html.yaml

*** Variables ***
${link_login}            ${login_html["uri"]}
${link_welcome}          ${welcome_html["uri"]}
${link_welcome_new}      ${welcome_html["uri_new"]}

${btn_login}             ${login_html["button"]["login"]["text"]}

${in_username}           ${login_html["input"]["username"]["id"]}
${in_password}           ${login_html["input"]["password"]["id"]}
${homepage}              https://172.16.3.31

*** Keywords ***
Login To Home Page 1
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
