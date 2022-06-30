*** settings ***
Library			SeleniumLibrary
Resource                ../utils/splitword.robot

*** Variables ***
${price_locator}             xpath=//div[@class='story']/p[5][text()]
${cart_btn_locator}             xpath=//div[@class='story']/form/input[@value='add this picture to cart']

*** Keywords ***
Add trees to cart
    ${price_from_web}=               SeleniumLibrary.Get text                ${price_locator}
    ${expected_value}=              splitword.Get the price from context                ${price_from_web}
    SeleniumLibrary.Click element               ${cart_btn_locator}
    [Return]                ${expected_value}