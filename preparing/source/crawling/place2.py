import requests
from bs4 import BeautifulSoup as bs
import re

# url = "https://www.siksinhot.com/taste?hpSchCate=&"


def findPlaces(url):
    siksin_result = requests.get(url)
    siksin_soup = bs(siksin_result.text, "html.parser")

    places_lst = siksin_soup.find_all("div", {"class": "cont"})

    places_id_lst = []
    for place in places_lst:
        temp = place.find("a")["href"]
        if re.findall(r'^/P', temp):
            places_id_lst.append(temp)
        else:
            pass
    return places_id_lst
