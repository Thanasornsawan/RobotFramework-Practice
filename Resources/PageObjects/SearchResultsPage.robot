*** settings ***
Library			SeleniumLibrary
Resource        ./HeaderPage.robot

*** Variables ***
${search_result}    results for

*** Keywords ***
Verify Search results
    Page Should Contain      ${search_result} ${list_search_texts}[2]

Select Product condition

Select delivery options