*** Keywords ***
Open application
    BuiltIn.Set Library search order    AppiumLibrary
    ${capability}       Create dictionary
        ...                 platformName=${platformName}
        ...                 automationName=${automation}
        ...                 platformVersion=${platformVersion}
        ...                 deviceName=${deviceName}
        ...                 udid=${udid}
        # ...                 systemPort=${systemPort}
        ...                 noReset=${FALSE}
        ...                 newCommandTimeout=0
        ...                 uiautomator2ServerInstallTimeout=120000
        ...                 autoGrantPermissions=true
        ...                 appPackage=${appPackage}
        ...                 appActivity=${appActivity}
    AppiumLibrary.Set appium timeout    ${GLOBAL_TIMEOUT}
    AppiumLibrary.Open application      remote_url=${remoteUrl}
    ...                 &{capability}

Close application
    AppiumLibrary.Close application