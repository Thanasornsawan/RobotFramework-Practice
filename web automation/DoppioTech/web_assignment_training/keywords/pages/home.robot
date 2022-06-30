*** settings ***
Library			SeleniumLibrary

*** Variables ***
${product_name}             Doppio CUP
${product_locator}                    xpath=//span[@data-element='product-name' and contains(text(),'${product_name}')]

*** Keywords ***
View product
    SeleniumLibrary.Wait until element is visible               ${product_locator}
    SeleniumLibrary.Click element               ${product_locator}