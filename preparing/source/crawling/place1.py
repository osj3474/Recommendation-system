import requests
from bs4 import BeautifulSoup as bs

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time


url = "https://www.siksinhot.com/taste?hpSchCate=&"

driver = webdriver.Chrome('./chromedriver')
driver.get(url)

for i in range(5):
    try:
        more = driver.find_element_by_css_selector('#tabMove2 > div > a')
        more.click()
        time.sleep(1)
    except:
        break


contents = driver.find_element_by_xpath(
    '//*[@id="tabMove1"]/div')
print(contents.text)


driver.close()

# siksin_result = requests.get(url)
# siksin_soup = bs(siksin_result.text, "html.parser")

#


# with open('test.html', 'w') as html_file:
#     html_file.write(siksin_soup.text)
