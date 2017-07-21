*** Settings ***
Documentation
Library     Selenium2Library        20
Test Setup  open browser    ${Website}   chrome
Test Teardown   close browser

*** Variables ***
${Website}  https://ilink.ilabquality.com/
${Username}  Test.User
${Password}  iLAB7923!

*** Test Cases ***
User Profile Activity Tab
    maximize browser window
    wait until login page loads
    login
    wait for dashboard page to load
    click user tab
    assert user tab is open
    click activity tab
    click activity page link
    wait for user page to load
    assert activity selection

User Profile Mentions Tab
    maximize browser window
    wait until login page loads
    login
    wait for dashboard page to load
    click user tab
    assert user tab is open
    click activity tab
    click mentions page link
    wait for user page to load
    assert mentions selection

User Profile Favorites Tab
    maximize browser window
    wait until login page loads
    login
    click user tab
    assert user tab is open
    click activity tab
    click favorites page link
    wait for user page to load
    assert favorites selection

User Profile View Tab
    maximize browser window
    wait until login page loads
    login
    click user tab
    assert user tab is open
    click profile tab
    click view page link
    wait for user page to load
    assert view selection

User Profile Edit Tab
    maximize browser window
    wait until login page loads
    login
    click user tab
    assert user tab is open
    click profile tab
    click edit page link
    wait for user page to load
    assert edit selection

User Profile Change Profile Photo Tab
    maximize browser window
    wait until login page loads
    login
    click user tab
    assert user tab is open
    click profile tab
    click change profile photo link
    assert change profile selection

*** Keywords ***
Wait Until Login Page Loads
    wait until page contains element  id=user
    wait until page contains element  id=pass
    page should contain element  id=wp-submit

Wait for Dashboard Page to Load
    page should contain link  https://ilink.ilabquality.com/
    page should contain link  https://ilink.ilabquality.com/members/
    page should contain  Dashboard
    page should contain image  css=.wp-image-1238.aligncenter

Wait for User Page to Load
    wait until page contains  Test User

Assert Activity Selection
    page should contain  What's new, Test?

Assert Mentions Selection
    page should contain  Sorry, there was no activity found. Please try a different filter.

Assert Favorites Selection
    page should contain  Sorry, there was no activity found. Please try a different filter.

Assert View Selection
    page should contain  Name
    page should contain  Test User
    page should contain  View

Assert Edit Selection
    page should contain  Editing 'Base' Profile Group
    page should contain  Who can see this field?
    page should contain   Office number

Assert Change Profile Selection
    page should contain  Change Profile Photo
    page should contain  Click below to select a JPG, GIF or PNG format photo from your computer and then click 'Upload Image' to proceed.

Click User Tab
    wait until element is visible  xpath=.//*[@id='user-thumb']
    click element  xpath=.//*[@id='user-thumb']

Click Activity Tab
    wait until element is visible  xpath=.//*[@id='activity-personal-li']/a
    click element  xpath=.//*[@id='activity-personal-li']/a

Click Profile Tab
    wait until element is visible  xpath=.//*[@id='xprofile-personal-li']/a
    click element  xpath=.//*[@id='xprofile-personal-li']/a

Click Activity Page Link
    wait until element is visible  xpath=.//*[@id='just-me-personal-li']/a
    click element  xpath=.//*[@id='just-me-personal-li']/a

Click Mentions Page Link
    wait until element is visible  xpath=.//*[@id='activity-mentions-personal-li']/a
    click element  xpath=.//*[@id='activity-mentions-personal-li']/a

Click Favorites Page Link
    wait until element is visible  xpath=.//*[@id='activity-favs-personal-li']/a
    click element  xpath=.//*[@id='activity-favs-personal-li']/a

Click View Page Link
    wait until element is visible  xpath=.//*[@id='public-personal-li']/a
    click element  xpath=.//*[@id='public-personal-li']/a

Click Edit Page Link
    wait until element is visible  xpath=.//*[@id='edit-personal-li']/a
    click element  xpath=.//*[@id='edit-personal-li']/a

Click Change Profile Photo Link
    wait until element is visible  xpath=.//*[@id='change-avatar-personal-li']/a
    click element  xpath=.//*[@id='change-avatar-personal-li']/a

Assert User Tab is Open
    wait until element is visible  xpath=.//*[@id='activity-personal-li']/a
    element should be visible  xpath=.//*[@id='xprofile-personal-li']/a
    element should be visible  xpath=.//*[@id='notifications-personal-li']/a
    element should be visible  xpath=.//*[@id='logout-li']/a

Login
    page should contain element  id=user
    page should contain element  id=pass
    input text  id=user    ${Username}
    input text  id=pass    ${Password}
    click element  id=wp-submit

