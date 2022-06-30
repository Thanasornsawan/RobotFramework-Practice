*** settings ***
Resource                ../utils/import.robot

*** Keywords ***
Navigate to input dropdown and select sex "female"
    basic.Tap at input to view dropdown
    basic.Select female
    basic.Tap save