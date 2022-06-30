*** settings ***
Library			SeleniumLibrary
Test Setup      Open browser and maximize
Test Teardown   Close browser window

*** Variables ***
${url}              file:///D:/tester/ep01_material/ep01/ep01_small_excercise.html
${browser}              Chrome
${label}                Doppio
${username}             Admin
${password}             password
${nickname}             admin

*** Keywords ***
Open browser and maximize
    SeleniumLibrary.Open Browser                ${url}              ${browser}
    SeleniumLibrary.Maximize Browser Window
    Sleep               2s

Close browser window
    SeleniumLibrary.Close Browser
    Log To Console              Test Completed

*** Test cases ***
TC-001 Verify that when input correct username and password then user can login
	SeleniumLibrary.Input Text              id=username-box             ${username}
    SeleniumLibrary.Input Text              xpath=//div[@v='password']/input                ${password}
    SeleniumLibrary.Input Text              xpath=//input[@doppio='nickname']               ${nickname}
    SeleniumLibrary.Click Element               xpath=//select[@id='company']
    SeleniumLibrary.Wait Until Element Is Visible               xpath=//option[contains(text(),'${label}')]
    SeleniumLibrary.Click Element               xpath=//option[text()='${label}']
    SeleniumLibrary.Select Checkbox             id=op1
    SeleniumLibrary.Click Button                id=use-me