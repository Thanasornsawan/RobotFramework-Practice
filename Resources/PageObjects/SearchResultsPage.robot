*** settings ***
Library			SeleniumLibrary
Resource        ./HeaderPage.robot

*** Variables ***
${search_result}    results for

*** Keywords ***
Verify Search results
    Page Should Contain      ${search_result} ${Dict_search_texts.one}

Select Product condition

Select delivery options