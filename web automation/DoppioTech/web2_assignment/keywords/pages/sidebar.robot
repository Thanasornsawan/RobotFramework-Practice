*** settings ***
Library			SeleniumLibrary

*** Variables ***
${browse_categories_locator}             xpath=//div[@id='sectionLinks']/ul/li[1]/a[@href='categories.php']
${your_cart_locator}                xpath=//div[@id='sectionLinks']/ul/li[3]/a[@href='cart.php']

*** Keywords ***
Click browse categories
    SeleniumLibrary.Click element               ${browse_categories_locator}
    Sleep               2s

Click your cart
    SeleniumLibrary.Click element             ${your_cart_locator}
    Sleep               2s