from selenium import webdriver
from selenium.webdriver.common.keys import Keys

import requests
from bs4 import BeautifulSoup as bs
import random
import time
import pandas as pd
import re
from tqdm import tqdm, trange

driver = webdriver.Chrome('/Users/osangjin/Desktop/chromedriver')
url = 'https://www.siksinhot.com/users/471669/list/review'

driver.get(url)

for i in range(5):
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    time.sleep(1)

time.sleep(2)

response = requests.get(url)

if response.status_code == 200:
    html = bs(response.text, 'html.parser')
    tags = html.select(
        '#contents > div > div > div.mp_conts > div.s_left > div.mp_review > div:nth-child(1) > ul')[0].find_all('strong')
    objs = []
    for tag in tags:
        objs.append(re.compile('\d.\d').findall(tag.text)[0])
    objs = list(map(float, objs))
    print(objs)
