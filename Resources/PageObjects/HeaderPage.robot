*** settings ***
Library			SeleniumLibrary
Variables       ../WebElements.py

*** Variables ***
${search_text}  mobile
@{list_search_texts}    books  travel  robot  gifts
&{Dict_search_texts}     one=books  two=robot  
${SearchTextBox}        //*[@id="gh-ac"]
${SearchButton}         //*[@id="gh-btn"]
${AdvancedSearchLink}   //*[@id="gh-as-a"]

*** Keywords ***
Input Search Text and Click Search with Args
    [Arguments]     ${param_search}
    Input text     ${HomePageSearchTextBox}     ${param_search}
    Press Keys     ${HomePageSearchButton}    RETURN

Input Search Text and Click Search with list
    Input text     ${SearchTextBox}     ${list_search_texts}[2]
    Press Keys     ${SearchButton}    RETURN

Click on Advance Search Link
    Click Element   ${HomePageAdvanceSearchLink}

Input Search Text and Click Search with dict
    Input text     ${SearchTextBox}     ${Dict_search_texts.one}
    Press Keys     ${SearchButton}    RETURN