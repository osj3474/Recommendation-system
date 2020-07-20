from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
import requests
from bs4 import BeautifulSoup as bs


def useSelenium(url):
    driver = webdriver.Chrome('/Users/osangjin/Desktop/chromedriver')
    driver.get(url)

    for i in range(5):
        driver.execute_script(
            "window.scrollTo(0, document.body.scrollHeight);")
        time.sleep(1)


def extract_reviews(url):

    siksin_result = requests.get(url)
    siksin_soup = bs(siksin_result.text, "html.parser")
    reviews = siksin_soup.find_all("div", {"class": "cont"})

    span_lst = []
    for review in reviews:
        span_lst.append(review.find("span"))

    target_lst = []
    for span in span_lst:
        title = span.find("a").string
        score = float(span.find("strong").string)
        review_dic = {'title': title, 'score': score}
        target_lst.append(review_dic)
    return target_lst
