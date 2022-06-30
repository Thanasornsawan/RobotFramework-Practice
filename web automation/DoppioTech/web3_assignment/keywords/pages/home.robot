*** settings ***
Library			SeleniumLibrary
Library         String

*** Variables ***
${user_nav_locator}             xpath=//div[@class='header-secondaryActions-w39']/div/button/span/span/span[contains(text(),username)]

*** Keywords ***
Page should contain username in the formation bar
    [Arguments]             ${username}
    ${user_locate}=             String.Replace string               ${user_nav_locator}                username               '${username}'
    SeleniumLibrary.Page should contain element             ${user_locate}

Page should not contain username in the formation bar
    [Arguments]             ${username}
    ${user_locate}=             String.Replace string               ${user_nav_locator}                username               '${username}'
    SeleniumLibrary.Page should not contain element             ${user_locate}