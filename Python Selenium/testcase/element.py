from selenium.webdriver.support.ui import WebDriverWait

class BasePageElement(object):
    def __set__(self, obj, value):
        driver = obj.driver
        WebDriverWait(driver,100).until(
            lambda driver: driver.find_element_by_name(self.locator))
        driver.find_element_by_name(self.locator).clear() #clear that input field
        driver.find_element_by_name(self.locator).send_keys(value)

    def __get__(self, obj, owner):
        WebDriverWait(driver,100).until(
            lambda driver: driver.find_element_by_name(self.locator))
        element = driver.find_element_by_name(self.locator)
        return element.get_attirbute("value")