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

driver.close()
