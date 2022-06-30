*** Keywords ***
Verify list of seller name has all companies and click at IT CITY
    computer.Verify computer page has all categories
    computer.Click at company name                   IT CITY

Search products sort by "Popular, Latest, Top Sales and Price"
    Sort by keyword                Popular
    Sort by keyword                Latest
    Sort by keyword                Top Sales
    Sort by keyword                Low to High

Click see all to view all company names
    computer.Click see all to view all company

Sort by keyword
    [Arguments]             ${keywords}
    ${sortby_dict}  ${sortby_key} =          common.Get dictionary from file            ${data_path}            SortBy
    ${top_sales_key}=              String.Replace string              ${sortby_key}[2]       _       ${space}
    ${Popular}=                    BuiltIn.Set variable               ${sortby_key}[0]
    ${Latest}=                     BuiltIn.Set variable               ${sortby_key}[1]
    ${Top_Sales}=                  BuiltIn.Set variable               ${top_sales_key}
    
    IF          '${keywords}' == '${Popular}'
            computer.Select popular dropdown
            SeleniumLibrary.Location should contain                     sortBy=${sortby_dict}[Popular]
    ELSE IF     '${keywords}' == '${Latest}'
            computer.Select latest dropdown
            SeleniumLibrary.Location should contain                     sortBy=${sortby_dict}[Latest]
    ELSE IF     '${keywords}' == '${Top_Sales}'
            computer.Select top sales dropdown
            SeleniumLibrary.Location should contain                     sortBy=${sortby_dict}[Top_Sales]
    ELSE IF     '${keywords}'=='Low to High'
            SeleniumLibrary.Mouse over                                  ${price_locator}
            computer.Select price dropdown                              ${keywords}
            SeleniumLibrary.Wait until location contains                ?order=asc
            SeleniumLibrary.Location should contain                     sortBy=${sortby_dict}[Price]
            computer.Verify third product is wireless mouse in search result
    ELSE IF     '${keywords}'=='High to Low'
            SeleniumLibrary.Mouse over                                  ${price_locator}
            computer.Select price dropdown                              ${keywords}
            SeleniumLibrary.Wait until location contains                ?order=desc
            SeleniumLibrary.Location should contain                     sortBy=${sortby_dict}[Price]
    END