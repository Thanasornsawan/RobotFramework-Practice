from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains

PATH = "C:\chromedriver\chromedriver.exe"
driver = webdriver.Chrome(PATH)
driver.get("https://orteil.dashnet.org/cookieclicker/")
link = driver.find_element_by_id("langSelect-EN")
link.click()

driver.implicitly_wait(5)
cookie = driver.find_element_by_id("bigCookie")
cookie_count = driver.find_element_by_id("cookies")
items = [driver.find_element_by_id("productPrice" + str(i)) for i in range(1,-1,-1)]

actions = ActionChains(driver)
actions.click(cookie)
#ActionChains will do only when use perform in code
#perform click on bigCookie ID 5000 time
for i in range(5000):
    actions.perform()
    if cookie_count.text:
        #the cookie ID shows 4 cookies but we want only number at front
        count = int(cookie_count.text.split(" ")[0])
    else:
        count = 0 
    #print(count)

    for item in items:
        value = int(item.text)
        if value <= count:
            upgrade_actions = ActionChains(driver)
            upgrade_actions.move_to_element(item)
            upgrade_actions.click()
            upgrade_actions.perform()