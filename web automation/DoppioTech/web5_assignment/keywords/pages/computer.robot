*** Keywords ***
Verify computer page has all categories
    ${data}=                common.Read data from file                     ${data_path}
    SeleniumLibrary.Wait until element is visible                    ${see_all_locator}
    SeleniumLibrary.Scroll element into view                         ${see_all_locator}
    ${brand_name_list}=                Collections.Convert to list             ${data}[Computer_categories]
    FOR     ${brand_name}              IN                   @{brand_name_list}
            ${comp_categories_locator}=              String.Replace string               ${computer_categories_locator}               label                ${brand_name}
            SeleniumLibrary.Page should contain element             ${comp_categories_locator}
            ${url}=             SeleniumLibrary.Get element attribute                    ${comp_categories_locator}           href
            Collections.Set to dictionary            ${data}[Computer_categories]             ${brand_name}=${url}
    END
    #Keep urls of all tech brands for use later from assignment
    common.Record data into new file                 ${data}

Select popular dropdown
    SeleniumLibrary.Wait until element is visible               ${sort_by_locator}              20s
    SeleniumLibrary.Scroll element into view                    ${sort_by_locator}
    SeleniumLibrary.Click element                               ${pop_locator}
    SeleniumLibrary.Wait until element is visible               ${sort_by_locator}              20s

Select latest dropdown
    SeleniumLibrary.Wait until element is visible               ${sort_by_locator}              20s
    SeleniumLibrary.Scroll element into view                    ${sort_by_locator}
    SeleniumLibrary.Click element                               ${latest_locator}
    SeleniumLibrary.Wait until element is visible               ${sort_by_locator}              20s     

Select top sales dropdown
    SeleniumLibrary.Wait until element is visible               ${sort_by_locator}              20s
    SeleniumLibrary.Scroll element into view                    ${sort_by_locator}
    SeleniumLibrary.Click element                               ${top_locator}
    SeleniumLibrary.Wait until element is visible               ${sort_by_locator}              20s

Select price dropdown
    [Arguments]             ${keyword}
    ${price_dropdown_locator}=              String.Replace string           ${price_dropdown_locator}           label           ${keyword}
    SeleniumLibrary.Wait until element is visible                  ${price_dropdown_locator}            20s
    SeleniumLibrary.Mouse down                                     ${price_dropdown_locator}
    SeleniumLibrary.Click element                                  ${price_dropdown_locator}

Verify third product is wireless mouse in search result
    SeleniumLibrary.Wait until element is visible                  ${product_result_locator}            20s
    SeleniumLibrary.Scroll element into view                       ${product_result_locator}
    BuiltIn.Run keyword and continue on failure                           SeleniumLibrary.Page should contain element               ${search_result3_locator}
    ${search_result_is_not_visible}=              BuiltIn.Run keyword and return status         SeleniumLibrary.Page should contain element               ${search_result3_locator}
    IF  ${search_result_is_not_visible}
        Log          Pass because found wireless mouse MI at third product
    ELSE
        Log to console          Fail because not found wireless mouse MI at third product
    END

Get brand name and url from file
    [Arguments]             ${keyword}
     ${status}=              BuiltIn.Run keyword and return status                   BuiltIn.Should contain              ${keyword}              ${space}
    IF     '${status}'=='True'
            ${convert_brand_to_same_key}=       String.Replace string               ${keyword}               ${space}            ${empty}
            ${brand_name}=                      String.Convert to lower case        ${convert_brand_to_same_key}
    ELSE
            ${brand_name}=                      String.Convert to lower case        ${keyword}
    END
    ${brand_dict}  ${brand_key}=        common.Get dictionary from file            ${new_data_path}                Computer_categories
    ${brand_url}=                       BuiltIn.Set variable                       ${brand_dict}[${brand_name}]
    [Return]                ${brand_name}       ${brand_url}

Click at company name
    [Arguments]         ${keyword}
    ${brand_name}       ${brand_url}=       Get brand name and url from file           ${keyword} 
    ${categories_locator}=                  String.Replace string                      ${computer_categories_locator}               label                /${brand_name}
    SeleniumLibrary.Click element                               ${categories_locator}
    SeleniumLibrary.Wait until element is visible               ${seller_profile_locator}           20s
    SeleniumLibrary.Location should be                          ${brand_url}
    SeleniumLibrary.Go back
    SeleniumLibrary.Wait until location contains                Computers                           20s

Click see all to view all company
    SeleniumLibrary.Wait until element is visible                       ${categories_sidebar_locator}           20s
    ${url}=             SeleniumLibrary.Get element attribute           ${see_all_url}           href
    SeleniumLibrary.Click element                                       ${see_all_locator}
    SeleniumLibrary.Location should be                                  ${url}