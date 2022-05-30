*** settings ***
Library			SeleniumLibrary

*** Variables ***
${message}		My Message

*** Keywords ***
Say Hello
	Log To Console	HelloPlease

*** Test cases ***
tc-001 Verify that when input correct username and password then user can login
	Say Hello
	Log To Console	${message}
	Open Browser	http://www.ebay.com		browser=chrome
	Input Text      id=gh-ac                Automete test with Doppio 