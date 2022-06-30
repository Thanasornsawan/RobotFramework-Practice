*** settings ***
Library			AppiumLibrary
Variables       variables.yaml

*** Keywords ***
Open current application
    AppiumLibrary.Open application   remote_url=${url}
    ...                deviceName=${device_name}
    ...                platformVersion=${platform_version}
    ...                platformName=${platform_name}
    ...                appPackage=${package_name}
    ...                appActivity=${activity_name}

Close current application
    AppiumLibrary.Close application
    Log to console              Test Completed