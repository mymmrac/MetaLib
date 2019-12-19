# import psycopg2
import os
import pandas as pd
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity
from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()

# connection = "host=%s port=%s user=%s password=%s dbname=%s sslmode=%s" % (
#     os.getenv("DB_HOST"), os.getenv("DB_PORT"),
#     os.getenv("DB_USER"), os.getenv("DB_PASS"),
#     os.getenv("DB_NAME"),
#     os.getenv("DB_SSLMODE"))
# conn = psycopg2.connect(connection)

engine = create_engine("postgresql://%s:%s@%s:%s/%s" % (
    os.getenv("DB_USER"), os.getenv("DB_PASS"), os.getenv("DB_HOST"), os.getenv("DB_PORT"), os.getenv("DB_NAME")))
conn = engine.raw_connection()

ratings = pd.read_sql("SELECT * FROM ratings", conn).drop("id", axis=1)

mean = ratings.groupby(by="user_id", as_index=False)['rating'].mean()
rating_avg = pd.merge(ratings, mean, on='user_id')
rating_avg['adg_rating'] = rating_avg['rating_x'] - rating_avg['rating_y']

check = pd.pivot_table(rating_avg, values='rating_x', index='user_id', columns='book_id')
final = pd.pivot_table(rating_avg, values='adg_rating', index='user_id', columns='book_id')

final_book = final.fillna(final.mean(axis=0))
final_user = final.apply(lambda row: row.fillna(row.mean()), axis=1)

b = cosine_similarity(final_user)
np.fill_diagonal(b, 0)
similarity_with_user = pd.DataFrame(b, index=final_user.index)
similarity_with_user.columns = final_user.index

cosine = cosine_similarity(final_book)
np.fill_diagonal(cosine, 0)
similarity_with_book = pd.DataFrame(cosine, index=final_book.index)
similarity_with_book.columns = final_user.index


def find_n_neighbours(df, n):
    df = df.apply(lambda x: pd.Series(x.sort_values(ascending=False)
                                      .iloc[:n].index,
                                      index=['top{}'.format(i) for i in range(1, n + 1)]), axis=1)
    return df


user_count = ratings.user_id.nunique()
sim_user_u = find_n_neighbours(similarity_with_user, user_count)
sim_user_m = find_n_neighbours(similarity_with_book, user_count)


def user_item_score(user, item):
    a = sim_user_m[sim_user_m.index == user].values
    b = a.squeeze().tolist()
    c = final_book.loc[:, item]
    d = c[c.index.isin(b)]
    f = d[d.notnull()]
    avg_user = mean.loc[mean['user_id'] == user, 'rating'].values[0]
    index = f.index.values.squeeze().tolist()
    corr = similarity_with_book.loc[user, index]
    fin = pd.concat([f, corr], axis=1)
    fin.columns = ['adg_score', 'correlation']
    fin['score'] = fin.apply(lambda x: x['adg_score'] * x['correlation'], axis=1)
    nume = fin['score'].sum()
    deno = fin['correlation'].sum()
    final_score = round(avg_user + (nume / deno), 2)
    return final_score


rating_avg = rating_avg.astype({"book_id": str})
book_user = rating_avg.groupby(by='user_id')['book_id'].apply(lambda x: ','.join(x))

recommend_count = 10


def user_top_books(user):
    book_seen_by_user = check.columns[check[check.index == user].notna().any()].tolist()
    a = sim_user_m[sim_user_m.index == user].values
    b = a.squeeze().tolist()
    d = book_user[book_user.index.isin(b)]
    if len(d) == 0:
        return []
    l = ','.join(d.values)
    book_seen_by_similar_users = l.split(',')
    books_under_consideration = list(set(book_seen_by_similar_users) - set(list(map(str, book_seen_by_user))))
    books_under_consideration = list(map(int, books_under_consideration))
    score = []
    for item in books_under_consideration:
        score.append(user_item_score(user, item))
    data = pd.DataFrame({'book_id': books_under_consideration, 'score': score})
    top_recommendation = data.sort_values(by='score', ascending=False).head(recommend_count)
    return list(top_recommendation.book_id)


users = pd.read_sql("SELECT * FROM users", conn)
predictions = pd.DataFrame(columns=["user_id", "book_id", "pos"])

for uid in users.id:
    user_top = user_top_books(uid)
    for i, book in enumerate(user_top):
        predictions.loc[-1] = [uid, book, i]
        predictions.index += 1

# print(predictions.head())
predictions.to_sql("user_tops", con=engine, schema="public", if_exists="replace", index_label="id")

conn.close()
engine.dispose()
