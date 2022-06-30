*** settings ***
Library			SeleniumLibrary
Resource                ../utils/splitword.robot
Resource                trees.robot

*** Variables ***
${total_price_locator}             xpath=//div[@class='story'][2]/h3[text()]
${button_locator}               xpath=//input[@value='place a command for these items']
${back_home_locator}                xpath=//a[@href='index.php']

*** Keywords ***
Verify total price in cart is $1500
    [Arguments]             ${expected_value}
    ${price_from_web}=               SeleniumLibrary.Get text                ${total_price_locator}
    ${total_price}=             splitword.Get the price from context                ${price_from_web}
    Sleep               2s
    Should Be Equal As Strings              ${total_price}                ${expected_value}
    SeleniumLibrary.Click Element               ${button_locator}
    Sleep               2s

Verify cart is empty
    ${price_from_web}=               SeleniumLibrary.Get text                ${total_price_locator}
    ${total_price}=             splitword.Get the price from context                ${price_from_web}
    Sleep               2s
    Should Be Equal As Strings              ${total_price}                0