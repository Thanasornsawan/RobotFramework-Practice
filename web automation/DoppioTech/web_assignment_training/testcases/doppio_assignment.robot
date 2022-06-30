*** settings ***
Library			SeleniumLibrary
Resource                ../keywords/utils/import.robot

Test Setup              common.Open browser and maximize
Test Teardown               common.Close browser window

*** Variables ***
${invalid_username}             helloworld
${valid_username}               oz4899
${password}             1234
${invalid_search}               abcd
${valid_search}             Shirt

*** Test cases ***
TC001- Verify that user cannot login with wrong username
    login_feature.Input username ,password and click login button             ${invalid_username}             ${password}
    login.Verify login failed

TC002- Verify that user can login to the system when username are correct
    login_feature.Input username ,password and click login button               ${valid_username}               ${password}
    login.Verify login successful

TC003- Verify that search function are working correctly
    login_feature.Input username ,password and click login button               ${valid_username}               ${password}
    login.Verify login successful
    #input invalid search
    navbar.Search with keyword              ${invalid_search}
    navbar.Verify search not found
    #input valid search
    navbar.Search with keyword              ${valid_search}
    navbar.Verify search result found               ${valid_search}

TC004- Verify that add to cart function are working correctly
    login_feature.Input username ,password and click login button               ${valid_username}               ${password}
    login.Verify login successful
    home.View product
    #add one product and verify amount is 1
    cart_feature.Add products and total amount in cart is correct               1
    #increase 5 times and verify amount is 6 and then clear cart
    cart_feature.Add products and total amount in cart is correct               5
    cart_feature.Click "clear all cart" button