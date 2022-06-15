*** settings ***
Library			SeleniumLibrary
Resource        ./HeaderPage.robot

*** Variables ***
${search_result}    results for

*** Keywords ***
Verify Search results
    [Arguments]     ${param_search}
    Page Should Contain      ${search_result} ${param_search}

Select Product condition

Select delivery options