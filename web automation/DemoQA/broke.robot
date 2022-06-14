*** settings ***
Library			SeleniumLibrary
Library			RequestsLibrary
Test Setup      Open Browser And Maximize
Test Teardown   Close Browser Window

*** Variables ***
${URL}        https://demoqa.com/broken
${Browser}          Chrome
${VALID_IMAGE}      xpath=//div[p[text()='Valid image']]/img[contains(@src, "/images/Toolsqa.jpg")] 
${VERIFY_VALID_IMAGE}   xpath=//img[contains(@src, "/images/Toolsqa.jpg")]
${INVALID_IMAGE}    xpath=//img[contains(@src, "/images/Toolsqa_1.jpg")] 
${VALID_LINK}       xpath=//a[contains(@href,'http://demoqa.com')]
${INVALID_LINK}     xpath=//a[contains(@href,'http://the-internet.herokuapp.com/status_codes/500')]

*** Keywords ***
Open Browser And Maximize
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Sleep  2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed

*** Test cases ***
tc-001 Verify image is valid for ToolsQA
    [Documentation]     Valid Image
    [Tags]      Functional
    # Step 1: verify the page contains the given element
    Page Should Contain Image   ${VALID_IMAGE}
    # Step 2: verify that when go to image URL, it must have image there.Not empty page
    ${img src1}=     Get element attribute   ${VALID_IMAGE}    attribute=src
    Go To       ${img src1}
    Page Should Contain Image   ${VERIFY_VALID_IMAGE}

tc-002 Verify image is invalid for ToolsQA
    [Documentation]     Invalid Image
    [Tags]      Functional
    # Step 1: verify the page contains the given element
    Page Should Contain Image   ${INVALID_IMAGE}
    # Step 2: verify that the element is visible
    Element Should Be Visible   ${INVALID_IMAGE}
    # Step 3: verify that when go to image URL, it must have image there.Not empty page
    ${img src2}=     Get element attribute   ${INVALID_IMAGE}    attribute=src
    Go To       ${img src2}
    Page Should Not Contain Image   ${INVALID_IMAGE}

tc-003 Verify the link is valid
    [Documentation]     Valid link
    [Tags]      Regression
    ${link}=        Get Element attribute   ${VALID_LINK}   attribute=href
    ${response}=    Get     ${link}     expected_status=200
    Should be equal as integers     ${response.status_code}     200

tc-004 Verify the link is invalid
    [Documentation]     Invalid link
    [Tags]      Regression
    ${link}=        Get Element attribute   ${INVALID_LINK}     attribute=href
    ${response}=    Get     ${link}     expected_status=500
    Log to Console      ${response.status_code}
    Should be equal as integers    ${response.status_code}       500      