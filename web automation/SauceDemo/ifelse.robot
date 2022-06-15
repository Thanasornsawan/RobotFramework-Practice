*** settings ***
Library			SeleniumLibrary
Test Setup      Open Browser And Maximize
Test Teardown   Close Browser Window

*** Variables ***
${URL}        https://www.saucedemo.com/
${Browser}          Chrome

*** Keywords ***
Open Browser And Maximize
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Sleep  2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed

Test Keyword 1
    Log To Console  Executed Keyword1 - Found Items as expected

Test Keyword 2
    Log To Console  Executed Keyword2 - Found less than expected Items 

Test Keyword 3
    Log To Console  Executed Keyword3 - Exception

** Test cases ***
tc-001 Demonstate IF/ELSE in robot framework
    [Documentation]     Test Case to demonstate IF/ELSE in robot framework
    Input Text      id:user-name    standard_user
    Input Text      id:password     secret_sauce
    Click Button    id:login-button

    ${items_on_page}=   Get Element Count   xpath://*[@class="inventory_list"]/div
    Log to Console  ${items_on_page}

    Run Keyword If  ${items_on_page} == 10   Test Keyword 1
    ...     ELSE IF ${items_on_page} < 10 and ${items_on_page} > 6  Test Keyword 2
    ...     ELSE    Test Keyword 3