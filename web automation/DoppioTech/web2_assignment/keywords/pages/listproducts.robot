*** settings ***
Library			SeleniumLibrary
Library         String

*** Variables ***
${products_class_locator}             xpath=//div[@class='story']
${products_name_locator}             xpath=//div[@class='story'][index]/a/h3[text()]
${keyword}              Trees
${artist}               Blad3
${artist_locator}               xpath=//div[index]/p[2]/a[text()]
${trees_locator}                xpath=//div[@class='story'][index]/a[@href]

*** Keywords ***
List products should have 'Trees' and draw by Blad3
    SeleniumLibrary.Page should contain             ${keyword}
    ${amount}=              SeleniumLibrary.Get element count               ${products_class_locator}
    FOR    ${item}              IN RANGE              1             ${amount}+1
           ${index}=                Convert To String               ${item}
           ${products_name_with_index}=             String.Replace string               ${products_name_locator}                index               ${index}
           ${title}=                SeleniumLibrary.Get text                ${products_name_with_index}
           Set Global Variable              ${index}
           Run Keyword If               '${title}' == '${keyword}'                Verify the artist name of poster 'Trees' correct and click on topic 'Trees'
           ...      ELSE                Verify the artist name of poster 'Trees' incorrect
    END

Verify the artist name of poster 'Trees' correct and click on topic 'Trees'
    ${artist_with_index}=               String.Replace string               ${artist_locator}               index               ${index}
    SeleniumLibrary.Element Text Should Be              ${artist_with_index}             ${artist}
    ${name}=     SeleniumLibrary.Get text               ${artist_with_index}
    Log             ${name}
    ${trees_with_index}=             String.Replace string               ${trees_locator}                index               ${index}
    SeleniumLibrary.Click element               ${trees_with_index}
    Sleep               2s

Verify the artist name of poster 'Trees' incorrect
    Log     Not found