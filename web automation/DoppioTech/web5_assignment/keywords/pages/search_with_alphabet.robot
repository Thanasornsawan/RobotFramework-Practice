*** Keywords ***
Search company name by click at alphabet
    SeleniumLibrary.Wait until element is visible                                   ${alphabet_locator}             20s
    ${total_alphabet}=              SeleniumLibrary.Get element count               ${alphabet_locator}
    FOR         ${index}            IN RANGE              1             ${total_alphabet}+1
        ${path}=                    BuiltIn.Catenate                    SEPARATOR=  ${alphabet_locator}  [${index}]
        ${alphabet}=                SeleniumLibrary.Get text            ${path}
        SeleniumLibrary.Click element               ${path}
        Verify each result show the correct first letter same the alphabet A-Z                ${alphabet}
    END

Verify each result show the correct first letter same the alphabet A-Z
    [Arguments]                    ${alphabet}
    #Get only A-Z character, the '#' character will show as empty string
    ${check_alphabet}=             String.Get regexp matches             ${alphabet}                [A-Z]+
    ${chars}=                      BuiltIn.Set variable                  @{check_alphabet}
    IF           '${chars}'!='${EMPTY}'
        ${brand_name_locator}=                  String.Replace string               ${brand_name_locator}              alphabet            ${chars}
        ${brand_list_with_letters}=             SeleniumLibrary.Get webelements             ${brand_name_locator}
        ${brand_list_length}=                   BuiltIn.Get length                  ${brand_list_with_letters}
    #Covert name to upper case and check that the first letter same robot click alphabet [A-Z]
        FOR       ${index}              IN RANGE              1                     ${brand_list_length}
            ${brand_name}=              SeleniumLibrary.Get text                    ${brand_list_with_letters}[${index}]
            ${upper_text}=              String.Convert to upper case                ${brand_name}
            BuiltIn.Should match regexp                 ${upper_text}                  \^${chars}
        END
    END

Verify the search result contain the same link and company name as computer product page
    ${brand_dict_title}     ${brand_key_url}=               common.Get dictionary from file            ${data_path}                Computer_categories
    ${brand_name_list}=          Collections.Get dictionary values       ${brand_dict_title}
    #Verify has all urls from computer products page in this page
    FOR     ${url}            IN                   @{brand_key_url}
            ${brand_name_locator}=                 String.Replace string               ${brand_name_url_locator}       url     ${url}
            SeleniumLibrary.Page should contain element                  ${brand_name_locator}
    END
    #Verify has all brand name from computer products page in this page
    FOR     ${name}           IN                    @{brand_name_list}
            SeleniumLibrary.Page should contain                          ${name}
    END