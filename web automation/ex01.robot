*** settings ***
Library			SeleniumLibrary

*** Variables ***

*** Keywords ***

*** Test cases ***
tc-001 Verify that when input correct username and password then user can login
	Open Browser	file:///D:/tester/ep01_material/ep01/ex01.html	browser=chrome
	Input Text      xpath=//input[@v='user']             	   Admin
    Input Text      xpath=//input[@v='password']               password