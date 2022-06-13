*** settings ***
Library			SeleniumLibrary
Library			RequestsLibrary

*** Variables ***
${TEST_PAGE}        https://demoqa.com/automation-practice-form

*** Keywords ***

*** Test cases ***
tc-001 Verify that when access this website,the image should broken
    Open Browser	${TEST_PAGE}		browser=chrome
    # Step 1: verify the page contains the given element
    Page Should Contain Image   xpath=//img[contains(@alt, "Katalon Acedemy")]
    # Step 2: verify that the element is visible
    Element Should Be Visible   xpath=//img[contains(@alt, "Katalon Acedemy")]
    ${img src}=     Get element attribute   xpath=//img[contains(@src, "../assets/DemoQA_banner_Katalon_Free_Automation_Tools.png")]    attribute=src
    ${response}=     Get        ${img src}
    # Step 3: verify that image can access by get response 200
    Should be equal as integers     ${response.status_code}     200
    # Step 4: verify that when go to image URL, it must have image there.Not empty page
    Go To       ${img src}
    Page Should Contain Image   xpath=//img[contains(@src, "../assets/DemoQA_banner_Katalon_Free_Automation_Tools.png")]