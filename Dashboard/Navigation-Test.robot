*** Settings ***
Documentation    Tests the Navigation of the Dashboard Page of iLink.
Library     Selenium2Library    20
Test Setup  open browser    ${Website}   chrome
Test Teardown   close browser

*** Variables ***
${Website}  https://ilink.ilabquality.com/
${Username}  Test.User
${Password}  iLAB7923!

*** Test Cases ***
Members Navigation Link
    wait until login page loads
    login
    wait until dashboard page loads
    click members link
    wait until members page loads

*** Keywords ***
Wait Until Login Page Loads
    wait until page contains element  id=user
    wait until page contains element  id=pass
    page should contain element  id=wp-submit

Wait Until Dashboard Page Loads
    page should contain link  https://ilink.ilabquality.com/
    page should contain link  https://ilink.ilabquality.com/members/
    page should contain  Dashboard
    page should contain image  css=.wp-image-1238.aligncenter

Wait Until Members Page Loads
    wait until page contains  Members
    page should contain element  css=#members_search
    page should contain element  css=#members-map-trigger

Click Members Link
    wait until page contains element  css=.menu-item.menu-item-type-post_type.menu-item-object-page.menu-item-503>a
    mouse down  css=.menu-item.menu-item-type-post_type.menu-item-object-page.menu-item-503>a
    click link  https://ilink.ilabquality.com/members/

Login
    page should contain element  id=user
    page should contain element  id=pass
    input text  id=user    ${Username}
    input text  id=pass    ${Password}
    click element  id=wp-submit