*** settings ***
Library			AppiumLibrary
Variables       ../utils/variables.yaml

*** Keywords ***
Tap at input to view dropdown
    AppiumLibrary.Wait until page contains element              ${input_dropdown_locator}               30s
    AppiumLibrary.Tap             ${input_dropdown_locator}

Select female
    AppiumLibrary.Wait until page contains element              ${female_radio_locator}             30s
    AppiumLibrary.Tap             ${female_radio_locator}

Tap save
    AppiumLibrary.Wait until page contains element              ${save_btn_locator}             30s
    AppiumLibrary.Tap             ${save_btn_locator}