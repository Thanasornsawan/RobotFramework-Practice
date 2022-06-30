*** settings ***
Resource                ../utils/import.robot

*** Keywords ***
Add products and total amount in cart is correct
    [Arguments]             ${amount}
    Run Keyword If               ${amount} == 1                Not click increase button            ${amount}
    ...      ELSE IF                ${amount} > 1               Click add amount more than one              ${amount}
    ...      ELSE               Log     Amount should be equal to 1 or more than 1

Click "clear all cart" button
    navbar.Clear cart
    Wait until keyword succeeds       5x      1s      navbar.Verify cart amount is correct            0

Not click increase button
    [Arguments]             ${amount}
    product.Add product to cart
    Wait until keyword succeeds       5x      1s      navbar.Verify cart amount is correct            ${amount}

Click add amount more than one
    [Arguments]             ${amount}
    #initial value input before click increase is 1
    ${init}=                Set variable            1
    product.Increase amount to cart             ${amount}
    product.Add product to cart
    ${sum}=             Evaluate                int(${init}) + int(${amount})
    Wait until keyword succeeds       5x      1s      navbar.Verify cart amount is correct            ${sum}