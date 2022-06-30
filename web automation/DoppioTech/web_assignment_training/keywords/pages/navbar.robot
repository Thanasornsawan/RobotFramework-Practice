*** settings ***
Library			SeleniumLibrary
Library         String

*** Variables ***
${result_locator}               xpath=//div[@class='card']/div/p[contains(text(),'keywords')]
${cart_amount_locator}              xpath=//span[@id='lblCartCount']/b
${clear_cart_btn}               xpath=//button[@class='button is-danger' and contains(text(),'Clear All Cart')]
${cart_locator}             xpath=//div[contains(@class,'is-hoverable')]/div/a/i[contains(@class,'fa-shopping-cart')]
${search_locator}               id=keyword
${search_btn}                   id=searchbtn
${no_result}             No results found
${no_result_locator}                xpath=//div[@id='notFound']

*** Keywords ***
Search with keyword
    [Arguments]             ${keywords}
    SeleniumLibrary.Input text              ${search_locator}              ${keywords}
    SeleniumLibrary.Press keys               ${search_btn}              RETURN

Verify search not found
    SeleniumLibrary.Wait until element is visible            ${no_result_locator}
    SeleniumLibrary.Page should contain             ${no_result}

Verify search result found
    [Arguments]             ${keywords}
    SeleniumLibrary.Page should not contain             ${no_result}
    ${result}=              String.Replace string               ${result_locator}               keywords                ${keywords}
    SeleniumLibrary.Wait until element is visible               ${result}
    SeleniumLibrary.Page should contain element             ${result}

Verify cart amount is correct
    [Arguments]             ${amount}
    SeleniumLibrary.Wait until page contains element               ${cart_locator}
    ${cart_amount}=             SeleniumLibrary.Get text           ${cart_amount_locator}
    Should be equal as integers              ${cart_amount}              ${amount}

Clear cart
    SeleniumLibrary.Wait until page contains element               ${cart_locator}
    SeleniumLibrary.Mouse over                  ${cart_locator}
    SeleniumLibrary.Wait until page contains element               ${clear_cart_btn}
    SeleniumLibrary.Mouse down              ${clear_cart_btn}
    SeleniumLibrary.Click element               ${clear_cart_btn}