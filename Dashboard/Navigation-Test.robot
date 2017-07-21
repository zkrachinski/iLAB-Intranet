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
Members Bottom Page Navigation Link
    wait until login page loads
    login
    wait until dashboard page loads
    click bottom page members link
    wait until members page loads

News Bottom Page Navigation Link
    wait until login page loads
    login
    wait until dashboard page loads
    click bottom page news link
    wait until news page loads

Dashboard Bottom Page Navigation Link
    wait until login page loads
    login
    wait until dashboard page loads
    click bottom page dashboard link
    wait until dashboard page loads

Dashboard Top Page Navigation Link
    maximize browser window
    wait until login page loads
    login
    wait until dashboard page loads
    click top page dashboard link
    wait until dashboard page loads

Members Top Page Navigation Link
    maximize browser window
    wait until login page loads
    login
    wait until dashboard page loads
    click top page members link
    wait until members page loads

News Top Page Navigation Link
    maximize browser window
    wait until login page loads
    login
    wait until dashboard page loads
    click top page news members link
    wait until news page loads

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

Wait Until News Page Loads
    wait until page contains  News
    page should contain link  https://ilink.ilabquality.com/2017/07/19/please-meet-paxen-thantsha/
    page should contain link  https://ilink.ilabquality.com/2017/07/13/please-meet-thandiwe-mmadi/

Click Bottom Page Members Link
    wait until page contains element  xpath=.//*[@id='menu-menu-header']/li[2]/a
    mouse down  xpath=.//*[@id='menu-menu-header']/li[2]/a
    click element  xpath=.//*[@id='menu-menu-header']/li[2]/a

Click Bottom Page News Link
    wait until page contains element  xpath=.//*[@id='menu-menu-header']/li[3]/a
    mouse down  xpath=.//*[@id='menu-menu-header']/li[3]/a
    click element  xpath=.//*[@id='menu-menu-header']/li[3]/a

Click Bottom Page Dashboard Link
    wait until page contains element   xpath=.//*[@id='menu-menu-header']/li[1]/a
    mouse down  xpath=.//*[@id='menu-menu-header']/li[1]/a
    click element  xpath=.//*[@id='menu-menu-header']/li[1]/a

Click Top Page Dashboard Link
    wait until page contains element  xpath=.//*[@id='menu-item-1670']/a
    mouse down  xpath=.//*[@id='menu-item-1670']/a
    click element  xpath=.//*[@id='menu-item-1670']/a

Click Top Page Members Link
    wait until page contains element  xpath=.//*[@id='menu-item-503']/a
    mouse down  xpath=.//*[@id='menu-item-503']/a
    click element  xpath=.//*[@id='menu-item-503']/a

Click Top Page News Members Link
    wait until page contains element  xpath=.//*[@id='menu-item-1201']/a
    mouse down  xpath=.//*[@id='menu-item-1201']/a
    click element  xpath=.//*[@id='menu-item-1201']/a

Login
    page should contain element  id=user
    page should contain element  id=pass
    input text  id=user    ${Username}
    input text  id=pass    ${Password}
    click element  id=wp-submit