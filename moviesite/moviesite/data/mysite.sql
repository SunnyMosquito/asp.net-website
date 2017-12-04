CREATE TABLE user(
    id             INTEGER         PRIMARY KEY  AUTOINCREMENT,
    username       NVARCHAR(16)    NOT NULL     UNIQUE,
    password       NVARCHAR(16)    NOT NULL,
    avatar         NVARCHAR(200)   DEFAULT 'media\upload\avatar\default.png',
    description    NVARCHAR(100),
    is_superuser   BOOLEAN         DEFAULT 'false',
    date_joined    DATE            NOT NULL     DEFAULT '2017-11-11',
    last_login     DATE            DEFAULT '2017-11-11',
    name           NVARCHAR(50),
    email          NVARCHAR(50),
    qq             NVARCHAR(10),
    phone          NVARCHAR(11),
    url            NVARCHAR(200),           
    address        NVARCHAR(200)
);

CREATE TABLE message(
    id             INTEGER        PRIMARY KEY  AUTOINCREMENT,
    content        NVARCHAR(200)  NOT NULL,
    date_release   DATE           NOT NULL,
    user_id        INTEGER        NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE tag(
    id           INTEGER        PRIMARY KEY    AUTOINCREMENT,
    name         NVARCHAR(20)   NOT NULL       UNIQUE
);

CREATE TABLE category(
    id           INTEGER        PRIMARY KEY  AUTOINCREMENT,
    name         NVARCHAR(20)   NOT NULL     UNIQUE
);

CREATE TABLE movie(
    id           INTEGER        PRIMARY KEY  AUTOINCREMENT,
    name         NVARCHAR(50)   NOT NULL     UNIQUE,
    image        NVARCHAR(200)  DEFAULT 'media\upload\movie\default.png',
    summary      NVARCHAR(300),
    is_recommend BOOLEAN        DEFAULT 'false',
    click_count  INTEGER        DEFAULT '0',
    box_office   REAL           DEFAULT '0',
    grade        REAL           DEFAULT '0',
    url          NVARCHAR(200)  NOT NULL,
    password     NVARCHAR(16),
    date_upload  DATE,
    type         NVARCHAR(50),
    duration     INTEGER,
    director     NVARCHAR(50),
    scriptwriter NVARCHAR(50),
    actor        NVARCHAR(200),
    date_release DATE,
    language     NVARCHAR(20),
    category_id  INTEGER        NOT NULL,
    user_id      INTEGER        NOT NULL,
    FOREIGN KEY (category_id)   REFERENCES category(id),
    FOREIGN KEY (user_id)       REFERENCES user(id)
);

CREATE TABLE movie__tag(
	movie_id     INTEGER        NOT NULL,
	tag_id       INTEGER        NOT NULL,
	FOREIGN KEY (movie_id)      REFERENCES movie(id),
	FOREIGN KEY (tag_id)        REFERENCES tag(id),
    PRIMARY KEY (movie_id,tag_id)
);

CREATE TABLE comment(
    id           INTEGER        PRIMARY KEY    AUTOINCREMENT,
    content      NVARCHAR(200),
    date_publish DATE,
    movie_id     INTEGER        NOT NULL,
    user_id      INTEGER        NOT NULL,
    pid_id       INTEGER        NOT NULL,
    FOREIGN KEY (movie_id)      REFERENCES movie(id),
    FOREIGN KEY (user_id)       REFERENCES movie(id)
);

insert into user(
    username,password,avatar,description,is_superuser,date_joined,last_login,
    name,email,qq,phone,url,address
    )
    values('admin', '123456', 'media\\upload\\avatar\\default.png','这是我的个性签名','true', '2017-10-10','2017-10-20',
        'zhiwen','1582452043@qq.com','111111','13642573767','http://www.baidu.com','韶关市韶关学院'
        );
insert into user(
    username,password,avatar,description,is_superuser,date_joined,last_login,
    name,email,qq,phone,url,address
    )
    values('zhiwen', '123456', 'media\\upload\\avatar\\default.png','zhiwen的个性签名','false', '2017-10-10','2017-10-20',
        '李四','10086@qq.com','111111','13642573767','http://www.baidu.com','韶关市韶关学院'
        );
insert into user(
    username,password,avatar,description,is_superuser,date_joined,last_login,
    name,email,qq,phone,url,address
    )
    values('datou', '123456', 'media\\upload\\avatar\\default.png','zhiwen的个性签名','false', '2017-10-10','2017-10-20',
        '张三','10086@qq.com','111111','13642573767','http://www.baidu.com','韶关市韶关学院'
        );

insert into tag(name)
    values('热血');
insert into tag(name)
    values('文艺');
insert into tag(name)
    values('治愈');
insert into tag(name)
    values('青春');
insert into tag(name)
    values('剧情');
insert into tag(name)
    values('安静');


insert into category(name)
    values('电影');
insert into category(name)
    values('电视剧');
insert into category(name)
    values('动漫');

insert into movie(
    name,image,summary,is_recommend,click_count,box_office,grade,url,password,
    date_upload,type,duration,
    director,scriptwriter,actor,date_release,language,category_id,user_id
    ) values(
    '罗马假日 Roman Holiday','https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2189265085.webp','欧洲某国的安妮公主（奥黛丽·赫本 Audrey Hepburn 饰）到访罗马，国务烦身，但她又厌倦繁文缛节。一天晚上，身心俱疲的她偷偷来到民间欣赏夜景，巧遇报社记者乔（格里高利·派克 Gregory Peck 饰）。二人把手同游，相当快乐。公主更是到乔的家中作客并在那过夜。 
　　不料乔无意中发现了公主的真实身份，他决定炮制一个独家新闻，于是乔和朋友、摄影师欧文（埃迪·艾伯特 Eddie Albert 饰）一起带公主同游罗马，并且偷拍了公主的很多生活照。然而，在接下来与公主的相处中，乔不知不觉恋上了公主。为了保护公主的形象，乔只能忍痛抛弃功成名就的良机，将照片送予了公主。 
　　安妮公主在经历了罗马一日假期后，反而体验了自己对国家的责任，毅然返回了大使馆，为了本身的责任而果断抛弃了爱情。','true','1','0','8.9','https://pan.baidu.com/s/1bp8m1hd','dxb5',
    '2017-12-01','剧情/喜剧/爱情','118','威廉·惠勒',' 达尔顿·特朗勃/伊安·麦克莱伦·亨特/约翰·戴顿',' 奥黛丽·赫本/格利高里·派克/埃迪·艾伯特/哈特利·鲍尔/哈考特·威廉姆斯','1953-09-02','英语/意大利语/德语','1','1'
    );
insert into movie(
    name,image,summary,is_recommend,click_count,box_office,grade,url,password,date_upload,type,duration,
    director,scriptwriter,actor,date_release,language,category_id,user_id
    ) values(
    '盗梦空间 Inception','https://img3.doubanio.com/view/photo/s_ratio_poster/public/p513344864.webp','道姆·柯布（莱昂纳多·迪卡普里奥 Leonardo DiCaprio 饰）与同事阿瑟（约瑟夫·戈登-莱维特 Joseph Gordon-Levitt 饰）和纳什（卢卡斯·哈斯 Lukas Haas 饰）在一次针对日本能源大亨齐藤（渡边谦 饰）的盗梦行动中失败，反被齐藤利用。齐藤威逼利诱因遭通缉而流亡海外的柯布帮他拆分他竞争对手的公司，采取极端措施在其唯一继承人罗伯特·费希尔（希里安·墨菲 Cillian Murphy 饰）的深层潜意识中种下放弃家族公司、自立门户的想法。为了重返美国，柯布偷偷求助于岳父迈尔斯（迈克尔·凯恩 Michael Caine 饰），吸收了年轻的梦境设计师艾里阿德妮（艾伦·佩吉 Ellen Page 饰）、梦境演员艾姆斯（汤姆·哈迪 Tom Hardy 饰）和药剂师约瑟夫（迪利普·劳 Dileep Rao 饰）加入行动。','true','1','12.3','9.0','https://pan.baidu.com/s/1c2AmkYO',
    'yluu','2017-12-01','剧情/动作/科幻/悬疑/冒险','148','克里斯托弗·诺兰','克里斯托弗·诺兰',' 莱昂纳多·迪卡普里奥/约瑟夫·高登-莱维特/艾伦·佩吉/汤姆·哈迪/渡边谦/迪利普·劳/基里安·墨菲/汤姆·贝伦杰/玛丽昂·歌迪亚','2010-09-01','英语/日语/法语','1','1'
    );
insert into movie(
    name,image,summary,is_recommend,click_count,box_office,grade,url,password,date_upload,type,duration,
    director,scriptwriter,actor,date_release,language,category_id,user_id
    ) values(
    '天空之城','https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1446261379.webp','古老帝国拉比达是一座漂浮在空中的巨大的机器岛，传说那里已经无人居住，蕴藏着巨大的财富。因此，无论军方还是海盗，都在找寻着这座传说中的飞行岛。 
　　矿工帕克这天偶遇拉达比继承人希达，两人一见如故。因为希达身上有找寻拉比达帝国的重要物件飞行石，军方和海盗两帮人马都在追杀希达。帕克带着希达一起逃亡，最终都没有逃出军方的手中，希达被军队掳走了。 
　　为救朋友，帕克只能选择与海盗合作。帕克与海盗成功救出了希达，同时，他们也发现了军方的邪恶计划。为了阻止军方邪恶计划的实施，他们和海盗一起踏上了寻找拉比达之旅','true','1','23.1','9.0','https://pan.baidu.com/s/1miOOZu4',
    'rxoe','2017-12-01','动画/奇幻/冒险','125','宫崎骏','宫崎骏',' 田中真弓/横泽启子/初井言荣/寺田农/常田富士','1986-08-02','日语','3','1'
    );

insert into movie__tag(movie_id,tag_id)
    values(1,2);
insert into movie__tag(movie_id,tag_id)
    values(1,3);
insert into movie__tag(movie_id,tag_id)
    values(1,5);
insert into movie__tag(movie_id,tag_id)
    values(2,1);
insert into movie__tag(movie_id,tag_id)
    values(2,5);
insert into movie__tag(movie_id,tag_id)
    values(3,1);
insert into movie__tag(movie_id,tag_id)
    values(3,3);
insert into movie__tag(movie_id,tag_id)
    values(3,4);

insert into comment(content,date_publish,movie_id,user_id,pid_id) values('这部电影挺好看的','2017-12-10',1,1,0);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('是挺好看的，但是画质不够清楚','2017-12-11',1,2,1);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('赫本，无与伦比的美丽。','2017-12-12',1,3,0);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('1、电影确实精彩。2、没有想象的难懂，相信你自己。3、总会有一个让你记一辈子的镜头。4、请降低期待值。5、请提前上厕所。6、记得关手机。7、一定要去影院，因为影院也是个造梦机器。8、记得听完结尾音乐。因为它负责让你醒来。9、极可能是近几年你在影院看过最精彩的电影。10、穿越吧少年','2017-12-13',2,3,0);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('还是觉得这是宫崎骏最好的一部——“我会像傻瓜那样去保护她”','2017-12-14',3,1,0);
insert into comment(content,date_publish,movie_id,user_id,pid_id) values('对天空的追逐，永不停止。','2017-12-15',3,1,0);

  