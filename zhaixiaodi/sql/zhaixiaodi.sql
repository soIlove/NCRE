--普通用户表
create table zusers(
    uuid int primary key,--用户编号
	upwd varchar2(40) not null,--密码
    uname varchar2(30) not null,--昵称
    uphone varchar2(40) unique not null,--电话
    uemail varchar2(50) not null,--邮箱
    usex varchar2(4) check(usex in('男','女')) ,--性别
    upicture varchar2(200),-- 用户头像
	uaddr varchar2(40) not null, --用户地理位置 (学校)
	utype int default 0 check (utype in(0,1) ) ,--是否成为代递员  0否  1是
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)

select * from zusers
update zusers set utype=0   where uuid=1
select * from zusers where uphone ='13237343452'
drop table zusers;
delete zusers
drop sequence seq_zusers;
create sequence seq_zusers start with 1000;
<<<<<<< HEAD
update zusers set utype=1 where uuid=1000;
insert into zusers  values(seq_zusers.nextval,'aa','黄小州','18188970547','382418631@qq.com','女','3.jpg','皇家工学院',1,null,null);
=======

insert into zusers  values(seq_zusers.nextval,'a','黄小州','18188970547','382418631@qq.com','女','3.jpg','皇家工学院',1,null,null);
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git

insert into zusers  values(seq_zusers.nextval,'a','蒋小掉','110','110@qq.com','女','6.jpg' ,'gongxeuyua',0,null,null);
insert into zusers  values(seq_zusers.nextval,'a','xkj','111','223311','男','6.jpg' ,'gongxeuyua',0,null,null);

select * from zusers;
update zusers set uname='莫甘娜' , upicture='3.jpg' ,uaddr='日俄大学',uemail='19145888314@qq.com',usex='男' where uphone='18188970546'

select * from(
select ad.*,rownum rn from
(select * from ZUSERS) ad
where  4> rownum
)where rn >1

--管理员表
create table admin(
	adid int primary key,--管理员编号
	adpwd varchar2(30) not null,--管理员密码
	adname varchar2(30) not null,--管理员姓名
	adsex varchar2(4) check(adsex in('男','女')),--性别
	adphone varchar2(30) not null,--管理员电话
	adrank varchar2(20) not null,--管理员等级（普通管理员，超级管理员）
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)
create sequence seq_adminId
select * from admin
insert into admin values(seq_adminId.nextval,'a','zhangsan','男','13237343452','普通管理员',null,null);
insert into admin values(seq_adminId.nextval,'a','lisi','女','110','普通管理员',null,null);
insert into admin values(seq_adminId.nextval,'a','wangwu','女','110','普通管理员',null,null);
insert into admin values(seq_adminId.nextval,'a','zhaoliu','女','110','普通管理员',null,null);



--被删除的用户表
create table delusers(
	delid int primary key,--删除用户编号
	uuid int references zusers(uuid) on delete cascade,--用户编号
	deldesc varchar2(50),--删除原因描述
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)

--代递员表
create table dusers(
    did int primary key,--代递员编号201
	uuid int unique references zusers(uuid) on delete cascade,--普通用户编号1001
    dsid varchar2(30) not null,--认证学号
    dspic varchar2(30) not null,--学生证图片
	dscore  varchar2(30) not null, --信誉度评分累计
	dnum  varchar2(30) not null,--接单次数
	uremain1 varchar2(50),
	uremain2 varchar2(50)	 
)
delete dusers



select did from dusers where uuid=1000
=======
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
=======
select * from dusers
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
drop table dusers;
drop sequence seq_dusers;
create sequence seq_dusers start with 200;
<<<<<<< HEAD
insert into dusers values(seq_dusers.nextval,1000,'1420140315','/zxdImg/4.jpg','4.5','5',null,null)
insert into dusers values(seq_dusers.nextval,1030,'1420140311','/zxdImg/4.jpg','4.5','5',null,null)
select * from dusers  where did=201;
=======

insert into dusers values(seq_dusers.nextval,1001,'1440340410','图片','100','10',null,null);
insert into dusers values(seq_dusers.nextval,1002,'1430340410','图片','100','10',null,null);
insert into dusers values(seq_dusers.nextval,1003,'1420340410','图片','100','10',null,null);
insert into dusers values(seq_dusers.nextval,1020,'1440340420','图片','100','10',null,null);
select * from dusers;

>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
--收货地址表
create table zaddr(
	zid int primary key,--地址编号
    uuid int references zusers(uuid) on delete cascade,--引用用户编号
	zaddr varchar2(200) not null,--地址
	uremain1 varchar2(50),
	uremain2 varchar2(50)

)
drop table zaddr;
drop sequence seq_zid
create sequence seq_zid start with 100001;
insert into zaddr values(seq_zid.nextval,1004,'RZ-17 312寝室',null,null);
insert into zaddr values(seq_zid.nextval,1004,'2栋教学楼2514教室',null,null);
insert into zaddr values(seq_zid.nextval,1004,'RZ-17 312寝室',null,null);
select * from zaddr where zid='100030';

);

select * from zaddr;



--投单表（寄件记录）
create table zorders(
	oid int primary key,   --投单编号，一般可以考虑引用物流单号，10011
    uuid int references zusers(uuid) on delete cascade,--投单人用户编号1002
    otime date not null,--投单时间
	orelname varchar2(30) not null,--投单人真实姓名
	ocode varchar2(30) not null,--取货码
	osize varchar2(40) check(osize in ('大包裹','小包裹')) not null,--包裹大小
    odesc varchar2(100) not null,--投单描述（期望送达时间）
	zid int references zaddr(zid) on delete cascade,--投单人地址编号
    oprice varchar2(30) not null,--代递金额
	otype varchar2(30) not null,--快递类型
	uremain1 varchar2(50),--接单状态
	uremain2 varchar2(50)--接单数目
)

select zo.*,zaddr oaddr from zorders zo,zaddr za where oid in(select oid from zaccept where did=(select did from dusers where uuid=1000) ) and zo.zid=za.zid and zo.uremain1='已接单';
=======
select * from zorders;
=======
select * from zorders
select distinct otype,count(otype) num from zorders group by otype order by count(otype) desc;

delete *  from zorders;
update zorders set uremain1='未接单',uremain2='0'

select zo.*,za.zaddr oaddr from zorders zo left join zaddr za on
zo.zid=za.zid
where zo.uuid=1004;

=======
select * from zorders
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
select distinct otype,count(otype) num from zorders group by otype order by count(otype) desc;
select zid from zaddr where  zaddr='湖南工学院D6-318' 
drop table zorders;
drop sequence seq_zorders;
select * from zorders;
create sequence seq_zorders start with 10000;
insert into zorders values (seq_zorders.nextval,1004,sysdate,'小花花','6789','小包裹','wusuowuo午',100021,'5','圆通快递',null,null);
insert into zorders values (seq_zorders.nextval,1004,sysdate,'小花花','679','小包裹','尽量中午',100025,'5','圆通快递',null,null);
insert into zorders values (seq_zorders.nextval,1004,sysdate,'小花','6799','小包裹','都可以的',100030,'5','圆通快递',null,null);
insert into zorders values (seq_zorders.nextval,1004,sysdate,'花小花','0789','小包裹','尽量中午',100028,'5','圆通快递',null,null);
insert into zorders values (seq_zorders.nextval,1004,sysdate,'花花','6689','小包裹','你是不是傻',100030,'5','圆通快递',null,null);
insert into zorders values (seq_zorders.nextval,1004,sysdate,'小花','6799','小包裹','尽量中午',100030,'5','圆通快递',null,null);
insert into zorders values (seq_zorders.nextval,1004,sysdate,'花花','6689','小包裹','尽量中午',100030,'5','圆通快递',null,null);
insert into zorders values (seq_zorders.nextval,1004,sysdate,'花小花','0789','小包裹','尽量中午',100030,'5','圆通快递',null,null);

<<<<<<< HEAD
<<<<<<< HEAD
=======
insert into zorders values (seq_zorders.nextval,1001,sysdate,'小花花','6789','小包裹','尽量中午',101,'5','申通快递',null,null);
insert into zorders values (seq_zorders.nextval,1001,sysdate,'小花花','679','小包裹','尽量中午',101,'5','汇通快递',null,null);
insert into zorders values (seq_zorders.nextval,1002,sysdate,'小花','6799','小包裹','尽量中午',102,'5','韵达快递',null,null);
insert into zorders values (seq_zorders.nextval,1003,sysdate,'花小花','0789','小包裹','尽量中午',103,'5','全峰快递',null,null);
insert into zorders values (seq_zorders.nextval,1004,sysdate,'花花','6689','小包裹','尽量中午',104,'5','中通快递',null,null);
insert into zorders values (seq_zorders.nextval,1002,sysdate,'小花','6799','小包裹','尽量中午',102,'5','国通快递',null,null);
insert into zorders values (seq_zorders.nextval,1004,sysdate,'花花','6689','小包裹','尽量中午',104,'5','中通快递',null,null);
insert into zorders values (seq_zorders.nextval,1003,sysdate,'花小花','0789','小包裹','尽量中午',103,'5','中通快递',null,null);

>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git


=======
 
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
delete from zorders;
select * from zorders;
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git

select * from
(select zd.* ,rownum rn from 
(select oid,uname,upicture,otime,orelname,ocode,osize,odesc,zaddr,oprice,otype 
from ZORDERS o,ZUSERS u,ZADDR a where o.uuid=u.uuid and o.zid=a.zid and o.otype='圆通快递')zd where rownum>=1)where rn<5;


--接单表(多人抢单)
create table zaccept(
	aid int primary key,--接单编号20001
	oid int references zorders(oid) on delete cascade,--投单编号10011
	adesc varchar2(30) not null,--接单描述（预计到达时间）
	did int references dusers(did) on delete cascade,--接单人编号  （修改成唯一值）
	ztime date not null,
	uremain2 varchar2(50)
)
create sequence seq_zaccept start with 20000;
insert into zaccept values(seq_zaccept.nextval,10011,201,'保证晚上5点之前送达',null,null);
insert into zaccept values(seq_zaccept.nextval,10012,220,'保证晚上5点之前送达',null,null);
insert into zaccept values(seq_zaccept.nextval,10013,221,'保证晚上5点之前送达',null,null);
insert into zaccept values(seq_zaccept.nextval,10014,222,'保证晚上5点之前送达',null,null);
select * from zaccept;



update zaccept set uremain2='1' where aid=30003;
drop table zaccept;
select count(1)  from zaccept where oid=10040;
create sequence seq_aid start with 30001;
drop sequence seq_aid;
insert into zaccept values(seq_aid.nextval,10040,'也许是要晚上才能到',220,sysdate,null);
select * from zaccept;
drop table zaccept;
=======
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
--订单表()
create table orders(
	ooid int primary key,--订单编号
	aid int references zaccept(aid) on delete cascade,--接单编号20001
	oscore varchar2(20) , --评分
	ostatus varchar2(40) check (ostatus in('等待评价','订单完成','订单取消','等待收货')),
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)
update orders set ostatus='等待收货' where ooid in(100000,100001,100002);
drop table orders;
drop sequence seq_orders;
create sequence seq_orders start with 100000; 
<<<<<<< HEAD
<<<<<<< HEAD
insert into orders values(seq_orders.nextval,30001,'0','待收货',null,null);
=======
insert into orders values(seq_orders.nextval,20001,null,'等待评价',null,null);--1002,1001 投单号10011
insert into orders values(seq_orders.nextval,20020,null,'订单取消',null,null);--1003投,1002接
insert into orders values(seq_orders.nextval,20021,null,'订单完成',null,null);--1004,1003
insert into orders values(seq_orders.nextval,20022,null,'等待收货',null,null);--1002,1020  10014
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
=======
insert into orders values(seq_orders.nextval,20001,null,'确认收货',null,null);
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
select * from orders;
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git

<<<<<<< HEAD
<<<<<<< HEAD
select distinct os.ooid，zo.otime,zo.osize,zo.odesc,ad.zaddr,zo.oprice,zo.otype,os.ostatus
from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where os.aid=za.aid and 
za.oid=zo.oid and  zo.zid=ad.zid and zo.uuid=1002 
=======
select * from orders;
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
=======
--创建投单和地址的视图
create OR REPLACE  view zorders_addr
as
select 
zorders.oid,zorders.uuid,zorders.otime,zorders.orelname,zorders.ocode,zorders.osize,zorders.odesc,zorders.oprice,zorders.otype,zaddr.zaddr
from zorders
join zaddr
on zorders.zid=zaddr.zid;
 
select * from zorders_addr
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git

<<<<<<< HEAD
<<<<<<< HEAD
select z.uuid 投单人编号
from zusers z,dusers d where z.uuid=d.uuid and d.did=(select distinct du.did from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where os.aid=za.aid and 
za.oid=zo.oid and  zo.zid=ad.zid and zo.uuid=1002);

select za.aid,za.did,du.uuid,du.dscore,zu.upicture,za.adesc,za.ztime from zaccept za
right join dusers du on za.did=du.did
right join zusers zu on du.uuid=zu.uuid
where za.oid=10040;
=======
select distinct du.did,os.ooid,otime,osize,odesc,zaddr,oprice,otype,upicture,ostatus
from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where os.aid=za.aid and 
za.oid=zo.oid and za.did=du.did  and  zo.zid=ad.zid and zo.uuid=1002 ;

select d.uuid,uname from zusers z,dusers d where z.uuid=d.uuid and d.did=201;

select a.did,otime,ooid,osize,odesc,zaddr,oprice,otype,upicture,ostatus from 
(select distinct du.did 
from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where os.aid=za.aid and 
za.oid=zo.oid and za.did=du.did  and  zo.zid=ad.zid and zo.uuid=1002 )a right join 
(select distinct du.did,otime,os.ooid,osize,odesc,zaddr,oprice,otype,upicture,ostatus
from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where za.aid=os.aid and 
za.oid=zo.oid and za.did=du.did and zo.zid=ad.zid and zo.uuid=1002 and ostatus='等待评价' )b on a.did=b.did order by otime;
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
=======
--订单id,投单人姓名,接单人昵称       
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git
