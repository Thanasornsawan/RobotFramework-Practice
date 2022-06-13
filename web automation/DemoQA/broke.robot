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
    # Step 1: verify the page contains the given element
    Page Should Contain Image   ${VALID_IMAGE}
    # Step 2: verify that the element is visible
    Element Should Be Visible   ${VALID_IMAGE}
    # Step 4: verify that when go to image URL, it must have image there.Not empty page
    ${img src1}=     Get element attribute   ${VALID_IMAGE}    attribute=src
    Go To       ${img src1}
    Page Should Contain Image   ${VERIFY_VALID_IMAGE}

tc-002 Verify image is invalid for ToolsQA
    # Step 1: verify the page contains the given element
    Page Should Contain Image   ${INVALID_IMAGE}
    # Step 2: verify that the element is visible
    Element Should Be Visible   ${INVALID_IMAGE}
    ${img src2}=     Get element attribute   ${INVALID_IMAGE}    attribute=src
    ${response}=     Get        ${img src2}
    Should be equal as integers     ${response.status_code}     200
    # Step 4: verify that when go to image URL, it must have image there.Not empty page
    Go To       ${img src2}
    Page Should Contain Image   ${INVALID_IMAGE}