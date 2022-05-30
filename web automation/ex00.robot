*** settings ***
Library			SeleniumLibrary

*** Variables ***

*** Keywords ***

*** Test cases ***
tc-001 Verify that when input correct username and password then user can login
	Open Browser	file:///D:/tester/ep01_material/ep01/ex00.html	browser=chrome
	Input Text      id=username-box               Admin
    Input Text      id=password-box               password