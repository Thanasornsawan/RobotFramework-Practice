*** settings ***
Resource                ${CURDIR}/../keywords/utils/import.robot
Test Setup              common.Open browser and maximize
Test Teardown           common.Close browser window
Documentation           Test to verify that home page should has all categories following list
...                     and when enter computer categories, page should has all categories and
...                     when enter any topics in computer page like 'IT CITY', it must verify that
...                     the page redirect to that topic correctly. At computer page, robot can
...                     sort result following argument 'Popular, Lastest, Top Sales and Price from low to high'.
...                     When sort by price, it should verify that third product has wireless mouse MI but
...                     if the search result not found wireless mouse, the script should show fail result but
...                     continue process until the end of script.At computer page, when robot click see all,
...                     the browser will redirect to search page by name from A-Z, it should verify that
...                     the first letter of brand name in search result same alphabet as robot click [A-Z]

*** Test cases ***
TC001- Test shopee website at home page, computer products page and search company names page
    home_feature.Verify list of products has all categories and click at "Computers & Laptops"
    computer_products_feature.Verify list of seller name has all companies and click at IT CITY
    computer_products_feature.Search products sort by "Popular, Latest, Top Sales and Price"
    computer_products_feature.Click see all to view all company names
    search_brand_feature.Search company names by click at alphabet A-Z and verify the result is correct