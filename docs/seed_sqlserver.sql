-- 创建数据库
IF DB_ID('e_government') IS NOT NULL DROP DATABASE e_government;
GO
CREATE DATABASE e_government
ON PRIMARY (
    NAME=e_government_DAT_MAIN1
    ,FILENAME='D:\SQLDATAS\e_government_DAT_MAIN1.MDF'
    ,SIZE=3MB
    ,MAXSIZE=UNLIMITED
    ,FILEGROWTH=5MB
),(
NAME=e_government_DAT_MAIN2
    ,FILENAME='D:\SQLDATAS\e_government_DAT_MAIN2.MDF'
    ,SIZE=3MB
    ,MAXSIZE=UNLIMITED
    ,FILEGROWTH=5MB
)
,FILEGROUP e_government_DAT_SUB1 DEFAULT (
    NAME=e_government_DAT_SUB1
    ,FILENAME='D:\SQLDATAS\e_government_DAT_SUB1.MDF'
    ,SIZE=2MB
    ,MAXSIZE=UNLIMITED
    ,FILEGROWTH=5MB
),(
NAME=e_government_DAT_SUB2
    ,FILENAME='D:\SQLDATAS\e_government_DAT_SUB2.MDF'
    ,SIZE=2MB
    ,MAXSIZE=UNLIMITED
    ,FILEGROWTH=5MB
)
,FILEGROUP e_government_DAT_SUB2 (
    NAME=e_government_DAT_SUB3
    ,FILENAME='D:\SQLDATAS\e_government_DAT_SUB3.MDF'
    ,SIZE=2MB
    ,MAXSIZE=UNLIMITED
    ,FILEGROWTH=5MB
)
LOG ON (
    NAME=e_government_LOG1
    ,FILENAME='D:\SQLDATAS\e_government_LOG1.LDF'
    ,SIZE=10MB
    ,MAXSIZE=UNLIMITED
    ,FILEGROWTH=10MB
),(
NAME=e_government_LOG2
    ,FILENAME='D:\SQLDATAS\e_government_LOG2.LDF'
    ,SIZE=10MB
    ,MAXSIZE=UNLIMITED
    ,FILEGROWTH=10MB
)
COLLATE CHINESE_PRC_CI_AS WITH 
    DB_CHAINING OFF,TRUSTWORTHY OFF;


-- 系统用户表(sysuser)
INSERT INTO sysuser (NAME, PASS, TRUENAME, DESCRIPTION, STATUS) 
    values ('admin', 'f9417e5514d0f525', '蒋志龙', '超级管理员', 0);
INSERT INTO sysuser (NAME, PASS, TRUENAME, DESCRIPTION, STATUS) 
    values ('zs', '28acb27e0e98c47f', '张三', '普通管理员', 0);


-- 系统模块表(sysmodule)
INSERT INTO sysmodule (NAME,link,STATUS) VALUES ('模块管理', '/sys/module_manage',0);
INSERT INTO sysmodule (NAME,link,STATUS) VALUES ('角色管理', '/sys/role_manage',0);
INSERT INTO sysmodule (NAME,link,STATUS) VALUES ('用户管理', '/sys/user_manage',0);
INSERT INTO sysmodule (NAME,link,STATUS) VALUES ('栏目管理', '/sys/catalog_manage.jsp',0);
INSERT INTO sysmodule (NAME,link,STATUS) VALUES ('文章管理', '/sys/article_manage.jsp',0);
INSERT INTO sysmodule (NAME,link,STATUS) VALUES ('领导信箱', '/sys/leadermail_manage.jsp',0);
INSERT INTO sysmodule (NAME,link,STATUS) VALUES ('信息反馈', '/sys/feedback_manage.jsp',0);


-- 系统栏目表(syscatalog)
INSERT INTO syscatalog (id,content,LEVEL,NAME,parentId,STATUS) 
    VALUES(0,'首页，根目录',0,'首页',-1,1);

-- level 1
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('地区概况',1,'地区概况',1,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('动态信息',1,'动态信息',1,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('招商引资',1,'招商引资',1,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('法律法规',1,'法律法规',1,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('网上办事',1,'网上办事',1,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('政务公开',1,'政务公开',1,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('网站链接',1,'网站链接',1,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('政府部门网站',1,'政府网站',1,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('便民服务',1,'便民服务',1,1);

-- level 2
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('地区简介',2,'地区简介',2,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('历史沿革',2,'历史沿革',2,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('规划建设',2,'规划建设',2,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('自然环境',2,'自然环境',2,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('经济状况',2,'经济状况',2,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('人口就业',2,'人口就业',2,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('综合实力',2,'综合实力',2,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('名胜旅游',2,'名胜旅游',2,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('知名企业',2,'知名企业',2,1);

-- level 3
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('水文水系',3,'水文水系',14,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('气候气象',3,'气候气象',14,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('地貌',3,'地貌',14,1);

INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('地理位置',3,'地理位置',14,1);

SELECT id FROM syscatalog WHERE NAME='动态信息';
SELECT * FROM syscatalog WHERE parentId = 3;
UPDATE syscatalog SET LEVEL = 2 WHERE parentId = 3;
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('天气预报',2,'天气预报',3,1);
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('公告公示',2,'公告公示',3,1);
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('图片新闻',2,'图片新闻',3,1);
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('动态新闻',2,'动态新闻',3,1);

SELECT id FROM syscatalog WHERE NAME='招商引资';
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('动态投资',2,'动态投资',4,1);

SELECT id FROM syscatalog WHERE NAME='法律法规';
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('新法速递',2,'新法速递',5,1);

SELECT id FROM syscatalog WHERE NAME='网上办事';
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('办事指南',2,'办事指南',6,1);
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('意见反馈',2,'意见反馈',6,1);

SELECT id FROM syscatalog WHERE NAME='政务公开';
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('干部任免',2,'干部任免',7,1);

SELECT id FROM syscatalog WHERE NAME='网站链接';
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('中央部门网站',2,'中央部门网站',8,1);

SELECT id FROM syscatalog WHERE NAME='政府网站';
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('建设局',2,'建设局',9,1);

SELECT id FROM syscatalog WHERE NAME='便民服务';
INSERT INTO syscatalog (content,LEVEL,NAME,parentId,STATUS) 
    VALUES('便民电话',2,'便民电话',10,1);


-- 文章表(article)
SELECT id FROM syscatalog WHERE NAME='动态新闻';
INSERT INTO article (title,content,sysCatalog_id) VALUES('中国驻叙利亚大使举行招待会庆祝中叙建交50周年','
    新华社大马士革８月９日电（记者顾康　贾小华）中国驻叙利亚大使周秀华９日晚在这里举行大型招待会，隆重庆祝中叙两国建交５０周年。
\r\n
    叙利亚人民议会议长阿卜拉什、副总理达尔达里、外长穆阿利姆等和３００多位叙各界人士及中资机构代表出席了招待会。
\r\n
    中国驻叙利亚大使周秀华在招待会上发表讲话说，自１９５６年８月１日中国和叙利亚正式建立外交关系以来，两国在各个领域开',26);

SELECT * FROM article WHERE sysCatalog_id = (SELECT id FROM syscatalog WHERE NAME='动态新闻');

-- select SYSDATETIME()
SELECT * FROM syscatalog WHERE NAME='政府网站';


-- 领导类别表(leader_sort)
INSERT INTO leader_sort (POSITION, info, STATUS) VALUES ('书记', '书记职位', 0);
INSERT INTO leader_sort (POSITION, info, STATUS) VALUES ('主任', '主任职位', 0);


-- 领导表(leader)
INSERT INTO leader (NAME, duty, parentId, RESUME, photo, email, serialNum, STATUS, isIndex)
    VALUES ('李光明', '政府书记', 1, '简历', 'default.jpg', 'XXX@gmail.com', '23918132', '0', '1');

INSERT INTO leader (NAME, duty, parentId, RESUME, photo, email, serialNum, STATUS, isIndex)
    VALUES ('元芳', '副书记', 1,  '副书记简历', 'default.jpg', 'XXX@gmail.com', '23918139', '0', '0');

INSERT INTO leader (NAME, duty, parentId, RESUME, photo, email, serialNum, STATUS, isIndex)
    VALUES ('建芳', '主任', 1,  '主任简历', 'default.jpg', 'XXX@163.com', '23918439', '0', '1');

