*** settings ***
Documentation               Test the MateiralX application
Resource                    ../keywords/utils/import.robot
Test Setup                  common.Open current application
Test Teardown               common.Close current application

*** Test cases ***
TC001- Choose expansion panel and select female in basic page
    [Documentation]             Choose expansion panel and select female in basic page
    [Tags]              Functional
    mainpage.Close popup when app start
    mainpage_feature.Navigate to expansion panel dropdown and tap on basic
    basicpage_feature.Navigate to input dropdown and select sex "female"