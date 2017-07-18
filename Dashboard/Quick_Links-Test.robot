*** Settings ***
Documentation    Tests the Quick Links on the Dashboard of iLink.
Library     Selenium2Library        20
Test Setup  open browser    ${Website}   chrome
Test Teardown   close browser

*** Variables ***
${Website}  https://ilink.ilabquality.com/
${Username}  Test.User
${Password}  iLAB7923!

*** Test Cases ***
Login Test
    [Tags]  Debug   Quick Links  Dashboard  iLAB-Intranet  Login Test
    wait until login page loads
    login

iTest External Links Test
    [Tags]  Debug   Quick Links  Dashboard  iLAB-Intranet  iTest External Links Test
    wait until login page loads
    login
    wait until dashboard page loads
    click itest quick link
    select window  title=iTEST
    wait until itest page loads

HelpDesk External Links Test
    [Tags]  Debug   Quick Links  Dashboard  iLAB-Intranet  HelpDesk External Links Test
    wait until login page loads
    login
    wait until dashboard page loads
    click helpdesk quick link
    select window  title=Login
    wait until helpdesk page loads

Owncloud External Links Test
    [Tags]  Debug   Quick Links  Dashboard  iLAB-Intranet  Owncloud External Links Test
    wait until login page loads
    login
    wait until dashboard page loads
    click owncloud quick link
    select window  url=https://owncloud.ilabsqa.com/owncloud/
    wait until owncloud page loads

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

Wait Until iTest Page Loads
    wait until page contains element  xpath=html/body/form[2]/table/tbody/tr[2]/td[2]/input
    page should contain element  xpath=html/body/form[2]/table/tbody/tr[3]/td[2]/input
    page should contain element  xpath=html/body/form[2]/table/tbody/tr[6]/td/input

Wait Until HelpDesk Page Loads
    wait until page contains element  xpath=.//*[@id='user']
    page should contain  Password:
    page should contain  Login

Wait Until Owncloud Page Loads
    wait until page contains element  css=.logo.svg
    page should contain  owncloud.ilabquality.com
    page should contain link  https://owncloud.org

Login
    page should contain element  id=user
    page should contain element  id=pass
    input text  id=user    ${Username}
    input text  id=pass    ${Password}
    click element  id=wp-submit

Click iTest Quick Link
    page should contain element  css=.wp-image-1238.aligncenter
    click element  css=.wp-image-1238.aligncenter

Click HelpDesk Quick Link
    page should contain element  css=.wp-image-1219.aligncenter
    click element  css=.wp-image-1219.aligncenter

Click Owncloud Quick Link
    page should contain element  css=.wp-image-1218.aligncenter
    click element  css=.wp-image-1218.aligncenter