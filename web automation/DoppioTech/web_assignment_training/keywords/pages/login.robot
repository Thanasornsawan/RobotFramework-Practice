*** settings ***
Library			SeleniumLibrary

*** Variables ***
${username_locator}             id=username
${password_locator}             id=password
${login_btn_locator}               id=loginbtn
${name}                         K'Preeda
${user_locator}                  xpath=//span[contains(text(),"${name}")]
${alert_text}               login failed

*** Keywords ***
Input username
    [Arguments]             ${username}
    SeleniumLibrary.Wait until element is enabled               ${username_locator}
    SeleniumLibrary.Input text              ${username_locator}             ${username}

Input password
    [Arguments]             ${password}
    SeleniumLibrary.Wait until element is enabled               ${password_locator}
    SeleniumLibrary.Input text              ${password_locator}             ${password}

Click login button
    SeleniumLibrary.Click element               ${login_btn_locator}

Verify login failed
    ${message}=             Handle alert                action=ACCEPT
    Should be equal             ${message}             ${alert_text}

Verify login successful
    SeleniumLibrary.Wait until element is visible           ${user_locator}
    SeleniumLibrary.Page should contain element             ${user_locator}