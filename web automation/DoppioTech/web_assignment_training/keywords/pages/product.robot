*** settings ***
Library			SeleniumLibrary
Resource                ../utils/import.robot

*** Variables ***
${increase_btn}             xpath=//button[contains(text(),'+')]
${add_cart_btn}             xpath=//button[contains(text(),'Add To Cart')]

*** Keywords ***
Add product to cart
    SeleniumLibrary.Wait until page contains element              ${add_cart_btn}
    SeleniumLibrary.Click element               ${add_cart_btn}

Increase amount to cart
    [Arguments]             ${amount}
    FOR    ${item}              IN RANGE              1             ${amount}
           SeleniumLibrary.Click element                ${increase_btn}
    END
    SeleniumLibrary.Textfield value should Be               id=qty                  ${amount}