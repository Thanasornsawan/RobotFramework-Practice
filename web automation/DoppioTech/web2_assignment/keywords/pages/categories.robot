*** settings ***
Library			SeleniumLibrary

*** Variables ***
${posters_locator}             xpath=//div[@class='story']/a[@href='listproducts.php?cat=1']

*** Keywords ***
Choose posters
    SeleniumLibrary.Click element               ${posters_locator}
    Sleep               2s