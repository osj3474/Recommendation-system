import requests
from bs4 import BeautifulSoup as bs

indeed_result = requests.get("https://www.indeed.com/jobs?q=python&limit=50")

indeed_soup = bs(indeed_result.text, "html.parser")

pagination = indeed_soup.find("div", {"class": "pagination"})
print(pagination)
