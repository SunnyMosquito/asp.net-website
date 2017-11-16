CREATE TABLE user(
    id             INTEGER        PRIMARY KEY  AUTOINCREMENT,
    username       NVARCHAR(16)    NOT NULL     UNIQUE,
    password       NVARCHAR(16)    NOT NULL,
    avatar         NVARCHAR(200)   DEFAULT 'upload/avatar/default.png',
    description    NVARCHAR(100),
    is_superuser   BOOLEAN        DEFAULT 'false',
    date_joined    DATE           NOT NULL     DEFAULT '2017-11-11',
    last_login     DATE           DEFAULT '2017-11-11',
    name           NVARCHAR(50),
    email          NVARCHAR(50),
    qq             NVARCHAR(10),
    phone          NVARCHAR(11),
    url            NVARCHAR(200),           
    address        NVARCHAR(200)
);

CREATE TABLE tag(
    id           INTEGER       PRIMARY KEY    AUTOINCREMENT,
    name         NVARCHAR(20)   NOT NULL       UNIQUE
);

CREATE TABLE category(
    id           INTEGER      PRIMARY KEY  AUTOINCREMENT,
    name         NVARCHAR(20)  NOT NULL     UNIQUE
);

CREATE TABLE movie(
    id           INTEGER       PRIMARY KEY  AUTOINCREMENT,
    name         NVARCHAR(50)  NOT NULL     UNIQUE,
    image        NVARCHAR(200) DEFAULT 'upload/movie/default.png',
    summary      NVARCHAR(300),
    is_recommend BOOLEAN       DEFAULT 'false',
    click_count  INTEGER       DEFAULT '0',
    box_office   REAL          DEFAULT '0',
    grade        REAL          DEFAULT '0',
    url          NVARCHAR(200) NOT NULL,
    password     NVARCHAR(16),
    date_upload  DATE,
    type         NVARCHAR(50),
    duration     INTEGER,
    director     NVARCHAR(50),
    scriptwriter NVARCHAR(50),
    actor        NVARCHAR(200),
    date_release DATE,
    language     NVARCHAR(20),
    category_id  INTEGER      NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE movie__tag(
	movie_id     INTEGER       NOT NULL,
	tag_id       INTEGER       NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movie(id),
	FOREIGN KEY (tag_id)   REFERENCES tag(id),
    PRIMARY KEY (movie_id,tag_id)
);

CREATE TABLE comment(
    id           INTEGER       PRIMARY KEY    AUTOINCREMENT,
    content      NVARCHAR(200),
    date_publish DATE,
    movie_id     INTEGER       NOT NULL,
    user_id      INTEGER       NOT NULL,
    pid_id       INTEGER       NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(id),
    FOREIGN KEY (user_id) REFERENCES movie(id)
);

insert into user(
    username,password,avatar,description,is_superuser,date_joined,last_login,
    name,email,qq,phone,url,address
    )
    values('admin', '123456789', 'upload/avatar/mysite.png','这是我的个性签名','true', '2017-10-10','2017-10-20',
        'zhiwen','10086@qq.com','111111','13642573767','http://www.baidu.com','韶关市韶关学院'
        );
insert into user(
    username,password,avatar,description,is_superuser,date_joined,last_login,
    name,email,qq,phone,url,address
    )
    values('hehe', '123456789', 'upload/avatar/mysite.png','s是广告公司的fsfsdf签名','true', '2017-10-10','2017-10-20',
        'lisi','10sdfdf6@qq.com','111111','13642573767','http://www.baidu.com','韶关市韶关学院'
        );


insert into tag(name)
    values('热血');
insert into tag(name)
    values('无聊');
insert into tag(name)
    values('垃圾');
insert into tag(name)
    values('青春');
insert into tag(name)
    values('剧情');


insert into category(name)
    values('电影');
insert into category(name)
    values('电视剧');
insert into category(name)
    values('动漫');

insert into movie(
    name,summary,is_recommend,click_count,box_office,grade,url,password,date_upload,type,duration,
    director,scriptwriter,actor,date_release,language,category_id
    ) values(
    '我的世界','风格装修风格发现广泛关注定向增发的房子的','true','12','12.0','5.9','http://dzfzfzsf.com',
    '123456','2017-10-12','搞笑','125','wode','caianladuo','nide','2015-10-23','yingyu','2'
    );
insert into movie(
    name,summary,is_recommend,click_count,box_office,grade,url,password,date_upload,type,duration,
    director,scriptwriter,actor,date_release,language,category_id
    ) values(
    '猫鼠游戏','风格装修风格发现广泛关注定向增发的房子的','true','12','13.4','5.9','http://dzfzfzsf.com',
    '123456','2017-10-12','搞笑','125','wode','caianladuo','nide','2015-10-23','yingyu','1'
    );
insert into movie(
    name,summary,is_recommend,click_count,box_office,grade,url,password,date_upload,type,duration,
    director,scriptwriter,actor,date_release,language,category_id
    ) values(
    '你在干嘛','风格装修风格发现广泛关注定向增发的房子的','true','12','23.45','5.9','http://dzfzfzsf.com',
    '123456','2017-10-12','搞笑','125','wode','caianladuo','nide','2015-10-23','yingyu','3'
    );
insert into movie(
    name,summary,is_recommend,click_count,box_office,grade,url,password,date_upload,type,duration,
    director,scriptwriter,actor,date_release,language,category_id
    ) values(
    '天才枪手','第三个是豆腐干豆腐干大概士大夫敢死队风格','true','12','323.90','5.9','http://dzfzfzsf.com',
    '123456','2017-10-12','搞笑','125','wode','caianladuo','nide','2015-10-23','yingyu','2'
    );
insert into movie(
    name,summary,is_recommend,click_count,box_office,grade,url,password,date_upload,type,duration,
    director,scriptwriter,actor,date_release,language,category_id
    ) values(
    '无间道','d地方好大夫好大夫好大夫sdgdfhzsdgdszgdfgsdgfsfsdf风格装修风格发现广泛关注定向增发的房子的sdfASFsADfaSdadsFdf','true','12','134.89','5.9','http://dzfzfzsf.com',
    '123456','2017-10-12','搞笑','125','wode','caianladuo','nide','2015-10-23','yingyu','1'
    );
insert into movie(
    name,summary,is_recommend,click_count,box_office,grade,url,password,date_upload,type,duration,
    director,scriptwriter,actor,date_release,language,category_id
    ) values(
    '天空之城','风格装修风格发现广泛关注定向增发的房子的','true','12','678.67','5.9','http://dzfzfzsf.com',
    '123456','2017-10-12','搞笑','125','wode','caianladuo','nide','2015-10-23','yingyu','3'
    );
insert into movie__tag(movie_id,tag_id)
    values(1,1);
insert into movie__tag(movie_id,tag_id)
    values(1,2);
insert into movie__tag(movie_id,tag_id)
    values(1,3);
insert into movie__tag(movie_id,tag_id)
    values(2,2);
insert into movie__tag(movie_id,tag_id)
    values(2,4);

insert into comment(content,date_publish,movie_id,user_id,pid_id) values('a','2017-10-10',1,1,0);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('b','2017-10-11',2,2,0);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('c','2017-10-12',3,1,0);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('d','2017-10-13',2,3,0);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('e','2017-10-14',1,1,0);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('f','2017-10-15',5,1,0);