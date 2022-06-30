*** settings ***
Resource                ../utils/import.robot

*** Keywords ***
Input username ,password and click login button
    [Arguments]             ${username}             ${password}
    login.Input username                ${username}
    login.Input password                ${password}
    login.Click login button