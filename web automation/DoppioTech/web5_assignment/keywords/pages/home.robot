*** Keywords ***
Choose language on popup
    [Arguments]                             ${language}
    ${language_popup_locator}=              String.Replace string               ${language_popup_locator}                language                ${language}
    SeleniumLibrary.Wait until element is visible                               ${language_popup_locator}                20s
    SeleniumLibrary.Click element           ${language_popup_locator}

Close advertise popup
    #Method 1: use key ESC
    SeleniumLibrary.Wait until page contains element                         ${advertise_popup}
    SeleniumLibrary.Press keys              ${advertise_popup}              ESCAPE
    #Method 2: use javascript
    #SeleniumLibrary.Execute Javascript                  document.querySelector('shopee-banner-popup-stateful').shadowRoot.querySelector("[class*=close-btn]").click()

Verify home page has all categories
    SeleniumLibrary.Wait until element is visible                   ${categories_locator}                20s
    SeleniumLibrary.Scroll element into view                        ${categories_locator}
    @{categories_list}=              common.Get list from file               ${data_path}                categories
    FOR         ${item}              IN                             @{categories_list}
                SeleniumLibrary.Page should contain                 ${item}
                Log              ${item}
    END

Choose category
    [Arguments]                    ${topic}
    ${topic_locator}=              String.Replace string               ${topic_locator}               topic                ${topic}
    SeleniumLibrary.Scroll element into view                           ${categories_locator}
    SeleniumLibrary.Click element                       ${topic_locator}