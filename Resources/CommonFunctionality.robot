*** settings ***
Library			SeleniumLibrary

*** Variables ***
${url}        https://www.ebay.com/
${env}          dev
&{list_url}     qa=http://qa.demo.com  uat=http://uat.demo.com  dev=http://uat.demo.com
${browser}          Chrome

*** Keywords ***
Open Browser And Maximize
    Open Browser  ${url}  ${browser}
    #Open Browser   ${list_url.${env}}     ${Browser}
    Maximize Browser Window
    Sleep  2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed