import requests
from bs4 import BeautifulSoup as bs

url = "https://www.siksinhot.com/users/471669/list/review"

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

print(target_lst)

# 만약 a 태그 안에 있는 key를 접근할 때는, find("a")["title"]
# .strip()
# .string 안되면, .get_text(strip=True)
# .find("a", recursive=False)  # 이렇게 하면, a태그 첫번째 level만 가져온다.
# 빼고 싶은게 있으면, strip("빼고 싶은 것 ")
