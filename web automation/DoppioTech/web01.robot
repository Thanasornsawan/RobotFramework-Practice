*** settings ***
Library			SeleniumLibrary
Test Setup      Open browser and maximize
Test Teardown   Close browser window

*** Variables ***
${url}              http://testphp.vulnweb.com/login.php
${browser}              Chrome
@{list_search_texts}                Posters  Paintings  Stickers  Graffity
${username}             test
${password}             test

*** Keywords ***
Open browser and maximize
    SeleniumLibrary.Open Browser                ${url}              ${browser}
    SeleniumLibrary.Maximize Browser Window
    Sleep               2s

Close browser window
    SeleniumLibrary.Close Browser
    Log To Console              Test Completed

Login with username and password
    SeleniumLibrary.Input Text              xpath=//input[@name='uname']                ${username}
    SeleniumLibrary.Input Text              xpath=//input[@name='pass']             ${password}
    SeleniumLibrary.Click Element               xpath=//input[@value='login']

Browse categories
    SeleniumLibrary.Click Element               xpath=//div[@id='sectionLinks']/ul/li[1]/a[@href='categories.php']
    Sleep               2s

Verify the category page contains keywords " Posters, Painings, Stickers, Grafity "
    FOR    ${item}              IN                @{list_search_texts}
            SeleniumLibrary.Page Should Contain             ${item}
            Log To Console              ${item}
    END

*** Test cases ***
TC-001 Login and browse categories
    [Documentation]             Verify category page contains keywords " Posters, Painings, Stickers, Grafity "
    [Tags]              Functional
    #Step1: Login with username test & password test
    Login with username and password
    #Step2: Browse categories
    Browse categories
    #Step3 Verify the categories page has Posters,Painings,Stickers,Grafity
    Verify the category page contains keywords " Posters, Painings, Stickers, Grafity "