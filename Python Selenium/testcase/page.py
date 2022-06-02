from locator import *
from element import BasePageElement

#inherit BasePageElement from element.py for do search function
class SearchTextElement(BasePageElement):
    #id q is search box
    locator = "q"

class BasePage(object):
    def __init__(self, driver):
        self.driver = driver

#inherit BasePage.So,we not need to def driver again
class MainPage(BasePage):
    search_text_element = SearchTextElement()

    def is_title_matches(self):
        return "Python" in self.driver.title

    def click_go_button(self):
        #* is split one object (*(1,2)) into two object like (1,2) to pass argument
        # find_element here will check class in element.py
        element = self.driver.find_element(*MainPageLocators.GO_BUTTON)
        element.click()

class SearchResultPage(BasePage):

    def is_results_found(self):
        return "No results found." not in self.driver.page_source