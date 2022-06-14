*** settings ***
Library			SeleniumLibrary
Library			RequestsLibrary
Test Setup      Open Browser And Maximize
Test Teardown   Close Browser Window

*** Variables ***
${URL}        https://demoqa.com/webtables
${Browser}          Chrome
${FirstName}    xpath=//div[contains(@class, 'rt-resizable-header-content') and contains(text(),'First Name')]
${LastName}     xpath=//div[contains(@class, 'rt-resizable-header-content') and contains(text(),'Last Name')]
${Age}          xpath=//div[contains(@class, 'rt-resizable-header-content') and contains(text(),'Age')]
${Email}        xpath=//div[contains(@class, 'rt-resizable-header-content') and contains(text(),'Email')]
${Salary}       xpath=//div[contains(@class, 'rt-resizable-header-content') and contains(text(),'Salary')]
${Depatment}    xpath=//div[contains(@class, 'rt-resizable-header-content') and contains(text(),'Department')]
${Action}       xpath=//div[contains(@class, 'rt-resizable-header-content') and contains(text(),'Action')]

*** Keywords ***
Open Browser And Maximize
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Sleep  2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed

*** Test cases ***
