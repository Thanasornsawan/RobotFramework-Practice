*** settings ***
Library			SeleniumLibrary
Test Setup      Open Browser And Maximize
Test Teardown   Close Browser Window

*** Variables ***
${URL}        https://demoqa.com/radio-button
${Browser}          Chrome

*** Keywords ***
Open Browser And Maximize
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Sleep  2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed

** Test cases ***
tc-001 Verify page not has default value and can select
    [Documentation]     verfiy default radio value
    [Tags]      Functional
    Page Should Contain Radio Button    xpath://*[@id="noRadio"]
    Radio Button Should Not Be Selected       like       
    Element Should Be Disabled          xpath://*[@id="noRadio"]
    Page Should Contain Radio Button   xpath://*[@id="yesRadio"]
    Sleep       2s
    #it can't use Select Radio Button because it need to be ID or value
    Click Element       xpath:/html/body/div[2]/div/div/div[2]/div[2]/div[2]/div[2]/label
    Sleep       2s
    Page Should Contain     You have selected Yes
    