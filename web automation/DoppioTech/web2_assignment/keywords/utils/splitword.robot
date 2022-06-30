*** settings ***
Library         String

*** Keywords ***
Get the price from context
    [Arguments]             ${context}
    Log          ${context}
    ${price}                Set Variable                ${context}
    ${price_number}             String.Get regexp matches      ${price}        [0-9]+
    ${final}                Set variable              ${price_number}[0]
    [Return]            ${final}