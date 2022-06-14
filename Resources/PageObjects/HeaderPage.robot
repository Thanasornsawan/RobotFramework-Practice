*** settings ***
Library			SeleniumLibrary

*** Variables ***
${search_text}  mobile
@{list_search_texts}    books  travel  robot  gifts

*** Keywords ***
Input Search Text and Click Search
    Input text     //*[@id="gh-ac"]     ${list_search_texts}[2]
    Press Keys     //*[@id="gh-btn"]    RETURN

Click on Advance Search Link
    Click Element   //*[@id="gh-as-a"]