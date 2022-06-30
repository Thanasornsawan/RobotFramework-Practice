*** settings ***
Library			SeleniumLibrary

*** Variables ***
${url}        http://125.26.15.143:13132/
${browser}          Chrome

*** Keywords ***
Open browser and maximize
    SeleniumLibrary.Open Browser                ${url}              ${browser}
    SeleniumLibrary.Maximize Browser Window

Close browser window
    SeleniumLibrary.Close Browser
    Log to console              Test Completed