from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
from bs4 import BeautifulSoup as bs
import urllib.request
import pandas as pd
import requests
import re

# driver = webdriver.Chrome('/Users/osangjin/Desktop/chromedriver')
url = 'https://www.siksinhot.com/users/471669/list/review'
# driver.get(url)

# for i in range(5):
#     driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
#     time.sleep(1)


response = requests.get(url)
if response.status_code == 200:
    # soup = bs(response.text, 'html.parser')
    text = response.content.decode('UTF-8')
    score_lst = re.findall(r'\d">(.*?)\'', text)
    #">2.5', '#
    name_lst = re.findall(r'"pname":"(.*?)",', text)
    print(score_lst)
    if score_lst == name_lst:
        for i in range(len(score_lst)):
            print(name_lst[i], score_lst[i])
    # for link in soup.find_all('a'):
    #     print(link.get('href'))

# contents > div > div > div.mp_conts > div.s_left > div.mp_review > div:nth-child(1) > ul > li:nth-child(3) > div > div.cnt > div > span > a
    # take_lst = driver.find_elements_by_class_name("date")
    # for i in range(len(take_lst)-1, len(take_lst)-30, -1):
    #     print(take_lst[i].text)
    # request = urllib.request.urlopen(url)
    # html = request.read()

    # soup = BeautifulSoup(html, "html.parser")
    # wanted_lst = soup.find_all("")

    # def getData(chunk, target):
    #     try:
    #         ret = chunk.find("{}".format(target)).text
    #     except:
    #         ret = ""
    #     return ret

    # # Notice Table
    # cols = ["title", "saltpnm", "minsal", "maxsal", "holidaytpnm",
    #         "minedubg", "maxedubg", "career", "wantedinfourl"]

    # entire_dic = {}
    # idx = 0
    # for wanted in wanted_lst:
    #     each = []
    #     for element in cols:
    #         each.append(getData(wanted, element))
    #     entire_dic.setdefault(idx, each)
    #     idx += 1

    # output = pd.DataFrame.from_dict(entire_dic, orient='index', columns=cols)
    # output.to_csv("~/Desktop/test_output.csv", encoding='utf-8-sig')
