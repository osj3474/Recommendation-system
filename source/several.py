import requests
from bs4 import BeautifulSoup as bs
from myre import findTarget


def findSeveralUsers(place_id):
    url = f"https://www.siksinhot.com/P/{place_id}"

    place_result = requests.get(url)
    place_soup = bs(place_result.text, "html.parser")

    script = place_soup.find("script").get_text()

    start = 'uid":'
    end = ',"nickname'
    users_id = findTarget(script, start, end)
    users_id = list(map(int, users_id))
    return users_id
