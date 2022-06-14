*** settings ***
Library			SeleniumLibrary

*** Variables ***
${URL}        https://www.ebay.com/
${env}          dev
&{LIST_URL}     qa=http://qa.demo.com  uat=http://uat.demo.com  dev=http://uat.demo.com
${Browser}          Chrome

*** Keywords ***
Open Browser And Maximize
    Open Browser  ${URL}  ${Browser}
    #Open Browser   ${LIST_URL.${env}}     ${Browser}
    Maximize Browser Window
    Sleep  2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed