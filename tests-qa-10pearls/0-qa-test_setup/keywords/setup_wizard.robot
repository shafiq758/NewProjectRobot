*** Settings ***
Library  SSHLibrary
Library  Collections

Resource  ../../../test_resources/web.robot
Resource  ../../../test_resources/remote.robot
Resource  ../login/keywords/login.robot

Variables  ../variables/html.yaml
Variables  ../variables/flash.yaml

*** Variables ***
${link_eula}             ${eula_html["uri"]}
${link_localize}         ${wizard_html["localize"]["uri"]}
${link_license}          ${wizard_html["license"]["uri"]}
${link_provisioning}     ${wizard_html["provisioning"]["uri"]}
${link_uno}              ${wizard_html["uno"]["uri"]}
${link_password}         ${wizard_html["password"]["uri"]}
${link_complete}         ${wizard_html["complete"]["uri"]}
${link_set_member}       ${set_member_html["uri"]}

${btn_eula_accept}       ${eula_html["button"]["accept"]["text"]}
${btn_localize_next}     ${wizard_html["localize"]["button"]["next"]["text"]}
${btn_license_next}      ${wizard_html["license"]["button"]["next"]["id"]}
${btn_provision_next}    ${wizard_html["provisioning"]["button"]["next"]["id"]}
${btn_uno_next}          ${wizard_html["uno"]["button"]["next"]["id"]}
${btn_pass_next}         ${wizard_html["password"]["button"]["next"]["text"]}
${btn_complete_start}    ${wizard_html["complete"]["button"]["start"]["text"]}
${btn_member_save}       ${set_member_html["button"]["save"]["text"]}

${in_pass_new}           ${wizard_html["password"]["input"]["password"]["new"]["id"]}
${in_pass_confirm}       ${wizard_html["password"]["input"]["password"]["confirm"]["id"]}
${in_uno_token}          ${set_member_html["input"]["token"]["name"]}

${msg_member_success}    ${membership_flash["msg"]["success"]}

*** Keywords ***
Setup Wizard
    set global variable  ${homepage}  ${SBOX_HOME_PAGES[${node_id}]}
    sleep  120s  reason=wait for initialize

    When link to web page  go_link=${homepage}  to_link=${homepage}/${link_eula}
    And accept eula
    And configure i18n and hostname
    And configure license
    And configure provisioning
    And configure uno
    And change admin password
    And complete setup wizard
    Then login to home page

Update Cluster Token
    set global variable  ${homepage}  ${SBOX_HOME_PAGES[${node_id}]}

    Given login to home page
    When go to  ${homepage}/${link_set_member}
    When enter to text box  ^name@${in_uno_token}  ${SBOX_TOKEN}
    And click action button  ^text@${btn_member_save}
    Then should display flash message  ${msg_member_success}

#*****************************************************************
# GENERAL
#*****************************************************************
Accept EULA
    Given link to web page  go_link=${homepage}/${link_eula}
    When click action button  ^text@${btn_eula_accept}
    Then location should be  ${homepage}/${link_localize}

Configure i18n and Hostname
    Given link to web page  go_link=${homepage}/${link_localize}
    When click action button  ^text@${btn_localize_next}
    Then location should be  ${homepage}/${link_license}

Configure License
    Given link to web page  go_link=${homepage}/${link_license}
    When click element  xpath=//radio-block[@for='trial']
    And click action button  ^id@${btn_license_next}
    Then location should be  ${homepage}/${link_provisioning}

Configure Provisioning
    Given link to web page  go_link=${homepage}/${link_provisioning}
    When click element  xpath=//radio-block[@for='stand_alone']
    When click action button  ^id@${btn_provision_next}
    Then location should be  ${homepage}/${link_uno}

Configure UNO
    Given link to web page  go_link=${homepage}/${link_uno}
    When click element  xpath=//radio-block[@for='standalone']
    When click action button  ^id@${btn_uno_next}
    Then location should be  ${homepage}/${link_password}

Change Admin Password
    Given link to web page  go_link=${homepage}/${link_password}
    And enter to text box  ^id@${in_pass_new}  ${SBOX_PASS}
    And enter to text box  ^id@${in_pass_confirm}  ${SBOX_PASS}
    When click action button  ^text@${btn_pass_next}
    Then location should be  ${homepage}/${link_complete}

Complete Setup Wizard
    Given link to web page  go_link=${homepage}/${link_complete}
    And click action button  ^text@${btn_complete_start}
    Then location should be  ${homepage}/${link_login}
