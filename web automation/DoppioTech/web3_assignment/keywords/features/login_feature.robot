*** settings ***
Resource                ../pages/login.robot

*** Keywords ***
Input username ,password and click sign in button
    [Arguments]             ${username}             ${password}
    login.Input username                ${username}
    login.Input password                ${password}
    login.Click sign in button