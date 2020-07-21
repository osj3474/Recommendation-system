from basic_sele import extract_reviews
import pandas as pd
from several import findSeveralUsers
from place2 import findPlaces


def findData(user_id):
    url = f'https://www.siksinhot.com/users/{user_id}/list/review'

    review_lst = extract_reviews(url)
    print('review:', review_lst)

    df = pd.DataFrame(review_lst)
    df.to_csv("../../data/review_{}.csv".format(user_id),
              mode='w', encoding='utf-8')


place_url = "https://www.siksinhot.com/taste?hpSchCate=&"
places_id_lst = findPlaces(place_url)

for place in places_id_lst:
    print("place:", place)
    users_id_lst = findSeveralUsers(place)
    for user in users_id_lst:
        print("\t", user)
        findData(user)
