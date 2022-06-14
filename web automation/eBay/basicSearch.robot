*** settings ***
Library			SeleniumLibrary
Documentation   Basic Search Functionality
Test Setup      Open Browser And Maximize
Test Teardown   Close Browser Window

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

*** Test cases ***
tc-001 Verify Basic Search Functionality for ebay
    [Documentation]     This test case verifies the basic search
    [Tags]      Functional
    Input text     //*[@id="gh-ac"]     mobile
    Press Keys     //*[@id="gh-btn"]    [Return]
    Page Should Contain     results for mobile