*** settings ***
Library			SeleniumLibrary

*** Variables ***
${URL}        https://www.ebay.com/
${Browser}          Chrome

*** Keywords ***
Open Browser And Maximize
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Sleep  2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed