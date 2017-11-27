import json
import urllib.request as request
import sqlite3
from bs4 import BeautifulSoup
list = []
urllist = []
data = []
for x in range(0, 256, 25):
    url = 'https://movie.douban.com/top250?start={0}'.format(x)
    with request.urlopen(url) as f:
        content = f.read().decode('utf-8')
        soup = BeautifulSoup(content, "html.parser")
        list.append(soup.find('ol', class_='grid_view').find_all('li'))

for li in list:
    for i in li:
        url = i.find('div', class_='hd').a['href']
        urllist.append(url)
        print("下载...", url)
        try:
            with request.urlopen(url) as f:
                content = f.read().decode('utf-8')
                soup = BeautifulSoup(content, "html.parser")
                content = soup.find('div', id='content')
                d = {}
                d['url'] = url
                d['top250_no'] = content.find(
                    'span', class_='top250-no').get_text()
                d['name'] = content.find('h1').find(
                    'span', property='v:itemreviewed').get_text()
                d['director'] = content.find(
                    'a', rel='v:directedBy').string
                d['scriptwriter'] = "沃兹基遍的"
                d['actor'] = content.find('span', class_='actor').find(
                    'span', class_='attrs').get_text()
                d['type'] = content.find(
                    'span', property='v:genre').get_text()
                d['duration'] = content.find(
                    'span', property='v:runtime').string
                d['date_release'] = content.find(
                    'span', property='v:initialReleaseDate').string[:10]
                d['grade'] = content.find(
                    'strong', property='v:average').string
                d['summary'] = content.find(
                    'span', property='v:summary').get_text()
                d['image'] = content.find('img', rel='v:image').attrs['src']
                data.append(d)
                print("完成")
        except Exception as e:
            print(url + "\n失败")


print(len(urllist))
# print(data)


# conn = sqlite3.connect('C:\\Users\\zhiwen\\Desktop\\test.db')
# c = conn.cursor()

# sql = "insert into data (id,top,name,director,actor,average,summary,imageurl)\
# values (?,?,?,?,?,?,?,?);"

# param = []
# count = 0
# for x in data:
#     count = count + 1
#     param.append([count, x['top250_no'], x['name'], x['director'],
#                   x['actor'], x['average'], x['summary'], x['imageurl']])
# try:
#     c.executemany(sql, param)
#     conn.commit()
# except Exception as e:
#     print(e)
#     conn.rollback()
# print(c.rowcount)
# c.close()
# conn.close()
with open("C:\\Users\\zhiwen\\Documents\\GitHub\\asp.net-website\\moviesite\\moviesite\\data\\data_movie.json", "w", encoding='utf-8') as f:
    json.dump(data, f, sort_keys=True, indent=4, separators=(',', ': '), ensure_ascii=False)
    print("加载入文件完成...")
# dic1 = data
# json_dic1 = json.dumps(dic1)
# print(json_dic1)
# json_dic2 = json.dumps(dic1, sort_keys=True, indent=4, separators=(',', ': '), ensure_ascii=True)
# print(json_dic2)
