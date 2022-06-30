*** settings ***
Library			AppiumLibrary
Variables       ../utils/variables.yaml

*** Keywords ***
Close popup when app start
    AppiumLibrary.Wait until page contains element          ${close_popup_locator}              30s
    AppiumLibrary.Tap             ${close_popup_locator}

Tap at expansion panels to view dropdown
    AppiumLibrary.Wait until page contains element              ${expansion_dropdown_locator}               30s
    AppiumLibrary.Tap             ${expansion_dropdown_locator}

Tap at basic
    AppiumLibrary.Wait until page contains element              ${basic_locator}                30s
    AppiumLibrary.Tap             ${basic_locator}