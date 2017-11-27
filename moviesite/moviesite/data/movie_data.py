import sqlite3
import datetime
import json
conn = sqlite3.connect('mysite.sqlite3')
c = conn.cursor()

sql = "insert into movie(name,summary,is_recommend,click_count,box_office,grade,url,password,date_upload,type,duration,director,scriptwriter,actor,date_release,language,category_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"
with open('data_movie.json', 'r', encoding='utf-8') as f:
    data = f.read()
# print(data)
data = json.loads(data)
# data = [{
#     'name': '世界',
#     'image': 'httpimage.com',
#     'summary': '风格装修风格发现广泛关注定向增发的房子的',
#     'grade': '5.9',
#     'url': 'httpdzfzfzsf.com',
#     'date_upload': '2017-10-12',
#     'type': '搞笑',
#     'duration': '125',
#     'director': 'wode',
#     'scriptwriter': 'caianladuo',
#     'actor': 'nide',
#     'date_release': '2015-10-23'
# }]
# for x in data:
#     # print([x['name'], x['summary'], 'false', '1', '1', x['grade'], x['url'], '123456', '2017-10-12', x['type'], x['duration'], x['director'], x['scriptwriter'], x['actor'], x['date_release'], 'wewe', 1])
#     c.execute(sql, [x['name'], x['summary'], 'false', '0', '0', x['grade'], x['url'], '123456', '2017-10-12', x['type'], x['duration'], x['director'], x['scriptwriter'], x['actor'], x['date_release'], 'wewe', 1])
# conn.commit()
# print(c.rowcount)
# c.close()
# conn.close()
param = []
for x in data:
    param.append([x['name'], x['summary'], 'false', '1', '0', x['grade'], x['url'], '123456', datetime.datetime.now(), x['type'], x['duration'], x['director'], x['scriptwriter'], x['actor'], x['date_release'], '中文', 1])
try:
    c.executemany(sql, param)
    conn.commit()
except Exception as e:
    print(e.message)
    conn.rollback()
print(c.rowcount)
c.close()
conn.close()
