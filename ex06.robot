*** settings ***
Library			SeleniumLibrary

*** Variables ***

*** Keywords ***

*** Test cases ***
tc-001 Verify that when input correct username and password then user can login
	Open Browser	file:///D:/tester/ep01_material/ep01/ex06.html	browser=chrome
	Input Text      xpath=//div[@k='abc' and @p='xyz']/input         Admin
    Input Text      xpath=//div[@k='abc'][2]/input                   password
    Input Text      xpath=//div[@p='xyz'][2]/input                   admin