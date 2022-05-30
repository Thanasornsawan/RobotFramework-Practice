*** settings ***
Library 			SeleniumLibrary

*** Variables ***
${message}			My Message

*** Keywords ***
Say Hello
	Log To Console 			ThisIsSayHello

*** Test cases ***
TC-001 Verify that when input correct username and password then user can login
	Open Browser 	file:///C:/Users/User/Desktop/ep01/ex06.html 		browser=chrome
	Input Text 		xpath=//div[@p='xyz' and @k='abc']/input 		example066666
	# Input Text 		xpath=//input[@v='password'] 		TestPassword
	
	



