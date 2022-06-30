*** settings ***
Documentation               Verify the total price of product
Resource                ../keywords/utils/import.robot

Test Setup              common.Open browser and maximize
Test Teardown               common.Close browser window

*** Variables ***
${username}             test
${password}             test

*** Test cases ***
TC001 add poster 'Trees' to cart and verify total price is correct
    [Documentation]             Add poster 'Trees' to cart and verify total price is correct
    [Tags]              Functional
    login.Input username ,password and click sign in button  ${username}  ${password}
    sidebar.Click your cart
    cart.Verify cart is empty
    sidebar.Click browse categories
    categories.Choose posters
    listproducts.List products should have 'Trees' and draw by Blad3
    ${expected_value}=              trees.Add trees to cart
    cart.Verify total price in cart is $1500                ${expected_value}