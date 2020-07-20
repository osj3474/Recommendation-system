from basic_sele import extract_reviews
import pandas as pd
from several import findSeveralUsers


def findData(user_id):
    url = f'https://www.siksinhot.com/users/{user_id}/list/review'

    review_lst = extract_reviews(url)

    df = pd.DataFrame(review_lst)
    df.to_csv("review_{}.csv".format(user_id), mode='w', encoding='ms949')


users_id = findSeveralUsers(28566)
for user_id in users_id:
    findData(user_id)
