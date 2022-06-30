*** settings ***
Library			SeleniumLibrary

*** Variables ***
${username_locator}             xpath=//input[@name='uname']
${password_locator}             xpath=//input[@name='pass']
${signin_btn_locator}               xpath=//input[@value='login']

*** Keywords ***
Input username ,password and click sign in button
    [Arguments]             ${username}             ${password}
    SeleniumLibrary.Input text              ${username_locator}             ${username}
    SeleniumLibrary.Input text              ${password_locator}             ${password}
    SeleniumLibrary.Click element               ${signin_btn_locator}
    Sleep               2s