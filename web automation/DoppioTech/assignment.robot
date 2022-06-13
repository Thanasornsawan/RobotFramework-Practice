*** settings ***
Library			SeleniumLibrary

*** Variables ***
${label}		Doppio

*** Keywords ***

*** Test cases ***
tc-001 Verify that when input correct username and password then user can login
	Open Browser	file:///D:/tester/ep01_material/ep01/ep01_small_excercise.html	browser=chrome
	Input Text      id=username-box                          Admin
    Input Text      xpath=//div[@v='password']/input         password
    Input Text      xpath=//input[@doppio='nickname']        admin
    click element   xpath=//select[@id='company']
    wait until element is visible   xpath=//option[contains(text(),'${label}')]
    click element   xpath=//option[text()='${label}']
    Select Checkbox   id=op1
    Click Button    id=use-me