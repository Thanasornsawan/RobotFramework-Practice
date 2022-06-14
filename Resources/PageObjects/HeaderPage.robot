*** settings ***
Library			SeleniumLibrary

*** Variables ***
${search_text}  mobile
@{list_search_texts}    books  travel  robot  gifts
&{Dict_search_texts}     one=books  two=robot  

*** Keywords ***
Input Search Text and Click Search with list
    Input text     //*[@id="gh-ac"]     ${list_search_texts}[2]
    Press Keys     //*[@id="gh-btn"]    RETURN

Click on Advance Search Link
    Click Element   //*[@id="gh-as-a"]

Input Search Text and Click Search with dict
    Input text     //*[@id="gh-ac"]     ${Dict_search_texts.one}
    Press Keys     //*[@id="gh-btn"]    RETURN