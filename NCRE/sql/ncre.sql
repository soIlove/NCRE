
/*************已创建*******************/

--系统管理员
create table sysadmin(	
	syid int primary key,
	syname varchar2(12),--管理员姓名
	sypwd varchar2(16)--登录密码
)
insert into sysadmin values(1,'admin','a');

drop table sysadmin;

--学院表
create table academy(   
	aid int primary key ,--学院id
	aname varchar2(20)--学院名称
)

alter table academy modify(aname varchar2(40));
create sequence seq_academy_aid start with 10001;
select * from academy;

drop sequence seq_academy_aid;
drop table academy;


--院系管理员表
create table academyadmin(      
	acid int primary key,
	acloginname varchar2(16),--姓名
	acemail varchar2(20), --注册邮箱
	acloginpwd varchar2(16),--登录密码
	acsex varchar2(2) check (acsex in('男','女')),--性别
	acpicture varchar2(50),  --用户证件照地址
	acwork varchar2(20),	--职位
	acacademyid int, --所属学院
	acphone varchar2(20), --联系方式，
	actime varchar2(12), --注册时间
	acstatus varchar2(8) default '待审核' check (acstatus in('审核通过','未通过','待审核'))
)
alter table academyadmin ADD CONSTRAINT FK_academyadmin_acacademyid foreign key(acacademyid) references academy(aid) on delete cascade;
select * from academyadmin am inner join academy ac on am.acacademyid=ac.aid and am.acstatus='待审核' order by actime desc
create sequence seq_acid start with 1003

drop sequence seq_acid
drop table academyadmin
 --班级表
create table clazz(     
	cid int primary key, --班级id
	cname varchar2(20),--班级名称
	acacademyid int --所属学院
)

alter table clazz modify(cname varchar2(40))
alter table clazz ADD CONSTRAINT FK_class_acacademyid foreign key(acacademyid) references academy(aid) on delete cascade;
select * from clazz c inner join academy a on c.acacademyid=a.aid order by cid,aid;
create sequence seq_clazz_cid start with 1;

drop sequence seq_clazz_cid
drop table clazz
	
--新闻通知表
create table news(				
	news_id int primary key,	--新闻id
	news_name varchar2(60),		--标题名称	
	news_text varchar2(1000),	--新闻正文
	news_pic varchar2(100),		--新闻图片
	news_date date				--发布时间
);

alter table news modify(news_text varchar2(4000))
create sequence seq_news_id start with 1;
select * from news;

drop sequence seq_news_id
drop table news;



--考场表
create table kaoroom(		
	krid int primary key,
	krclass varchar2(20),	--考场名称		第15考室
	krtotal varchar2(10),	--教室最大容量		40
	krlou varchar2(20), 	--考场所属楼层		2号楼（信息楼）
	kraddr varchar2(20)		--考场位置			612
)
select * from kaoroom;
create sequence seq_kaoroom_kaid start with 1;

drop sequence seq_kaoroom_kaid;
drop table kaoroom
		
--学生注册表
create table students(               
     sid int primary key,  --学生编号
     sxid varchar2(15) unique ,    --登录账号
     spwd varchar2(30),  --登录密码
     sname varchar2(10),  --学生姓名，
     ssex varchar2(10) check(ssex in('男','女')) ,  --性别
     semail varchar2(40),  --邮箱
     sacademy varchar2(50),  --所在学院
     sclass varchar2(50),  --所在班级
     remain1 varchar2(30) ,
     remain2 varchar2(30) 
)

delete  from STUDENTS ;
alter table students modify(sclass varchar2(50))
create sequence seq_sid start with 1001;
select * from students;

drop sequence seq_sid
drop table students

--报名信息表
create table enrollmsg(       
     eid int primary key,          --报名编号
     sid int  references  students(sid) on delete cascade , --学生id
     epicture varchar2(100),     --证件头像
     enation varchar2(16),        --民族
     eidentif varchar2(30) ,  --身份证号
     ebirthday varchar2(30),     --出生日期
     ework varchar2(30),       --职业
     eaddr varchar2(50),       --联系地址
     ephone varchar2(11),               --联系电话
     remain1 varchar2(30) ,
     remain2 varchar2(30) 
)
create sequence seq_eid start with 2001
select * from enrollmsg

drop table enrollmsg;

--考试类别表
create table testclas( 
	teid int primary key,
	tename varchar2(40),    --考试名称
	televel int check (televel in(1,2,3,4)) --考试级别
)

alter table testclas modify(tename varchar2(40))
create sequence seq_teid start with 3001;
select * from testclas;

insert into testclas values(seq_teid.nextval,'计算机基础及MS Office应用',1);
insert into testclas values(seq_teid.nextval,'计算机基础及Photoshop应用',1);
insert into testclas values(seq_teid.nextval,'C语言程序设计',2);
insert into testclas values(seq_teid.nextval,'vb语言程序设计',2);
insert into testclas values(seq_teid.nextval,'java语言程序设计',2);
insert into testclas values(seq_teid.nextval,'vfp数据库程序设计',2);
insert into testclas values(seq_teid.nextval,'java语言程序设计',2);
insert into testclas values(seq_teid.nextval,'Access数据库程序设计',2);
insert into testclas values(seq_teid.nextval,'C++语言程序设计',2);
insert into testclas values(seq_teid.nextval,'MySQL数据库程序设计',2);
insert into testclas values(seq_teid.nextval,'Web程序设计',2);
insert into testclas values(seq_teid.nextval,'MS Office高级应用',2);
insert into testclas values(seq_teid.nextval,'网络技术',3);
insert into testclas values(seq_teid.nextval,'数据库技术',3);
insert into testclas values(seq_teid.nextval,'软件测试技术',3);
insert into testclas values(seq_teid.nextval,'信息安全技术',3);
insert into testclas values(seq_teid.nextval,'嵌入式系统开发技术',3);
insert into testclas values(seq_teid.nextval,'软件测试技术',3);
insert into testclas values(seq_teid.nextval,'网络技术',4);
insert into testclas values(seq_teid.nextval,'网络技术',4);
insert into testclas values(seq_teid.nextval,'网路工程师',4);
insert into testclas values(seq_teid.nextval,'数据库工程师',4);
insert into testclas values(seq_teid.nextval,'软件测试工程师',4);
insert into testclas values(seq_teid.nextval,'嵌入式系统开发工程师',4);


select teid from testclas where tename='java语言程序设计'

drop sequence seq_teid
drop table testclas;

 --报考表                                       《关键表》
create table computest( 
	cid int primary key,  --报考编号
	eid  references enrollmsg(eid) on delete cascade,  --报名编号
	teid  references testclas(teid) on delete cascade,  --考试类别编号
	cstatus varchar2(10) check (cstatus in('未审核','审核通过','未通过','已删除')),
	cotid varchar2(20),   --准考证号
	cotclass varchar2(30),--考场号
	cottask varchar2(10)--座位号
)
 create sequence seq_cid start with 4001;
select * from computest where cstatus='未通过';

drop sequence seq_cid;
drop table computest;

--审核未通过日志记录表
create table notThrowLog(  
    noid int primary key,    --日志编号
    cid references computest(cid) on delete cascade,   --报考信息编号
    nocontent varchar2(400)  --未通过原因描述
 )
create sequence seq_noid start with 1001;

drop sequence seq_noid
drop table notThrowLog