*** settings ***
Library			SeleniumLibrary

*** Variables ***
${url}        https://uat-eordering.central.tech/login
${browser}          Chrome

*** Keywords ***
Open browser and maximize
    SeleniumLibrary.Open Browser                ${url}              ${browser}
    SeleniumLibrary.Maximize Browser Window
    Sleep               2s

Close browser window
    SeleniumLibrary.Close Browser
    Log To Console              Test Completed