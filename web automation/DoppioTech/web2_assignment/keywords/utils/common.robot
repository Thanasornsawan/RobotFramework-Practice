*** settings ***
Library			SeleniumLibrary

*** Variables ***
${url}        http://testphp.vulnweb.com/login.php
${browser}          Chrome

*** Keywords ***
Open browser and maximize
    SeleniumLibrary.Open browser                ${url}              ${browser}
    SeleniumLibrary.Maximize browser window
    Sleep               2s

Close browser window
    SeleniumLibrary.Close browser
    Log To Console              Test completed