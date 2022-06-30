*** settings ***
Library			SeleniumLibrary

*** Variables ***
${username_locator}             xpath=//input[@name='username']
${password_locator}             xpath=//input[@name='password']
${signin_btn_locator}               xpath=//button[contains(@class,'button-root_highPriority-2GO')]
${error_locator}                xpath=//p[contains(@class,'message-root_error-2PS')]

*** Keywords ***
Input username
    [Arguments]             ${username}
    SeleniumLibrary.Wait until element is enabled               ${username_locator}
    SeleniumLibrary.Input text              ${username_locator}             ${username}

Input password
    [Arguments]             ${password}
    SeleniumLibrary.Wait until element is enabled               ${password_locator}
    SeleniumLibrary.Input text              ${password_locator}             ${password}

Click sign in button
    SeleniumLibrary.Click element               ${signin_btn_locator}
    Sleep   2s

Page should show error at the required field
    SeleniumLibrary.Page should contain element             ${error_locator}