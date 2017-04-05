--计算机等级考试报名系统数据库用例：
		create table students{               --学生注册表
			sid int primary key,  --学生编号
			sxid int unique ,    --学生学号
			spwd varchar2(30),  --登录密码
			sname varchar2(10),  --学生姓名，
			ssex varchar2(10) check in('男','女') ,  --性别
			semail varchar2(40),  --邮箱
			sacademy varchar2(20),  --所在学院
			sclass varchar2(20),  --所在班级
			remain1 varchar2(30) ,
			remain2 varchar2(30) ,
		}
		
		create sequence seq_sid start with 1001;                    --后面序列格式类似，    seq_(*id)
		
		
		create table enrollmsg{        --报名信息表
			eid int primary key,          --报名编号
			sid int  foreigen key references  students(sid) on delete cascade on update cascade, --学生id
			epicture varchar2(100),     --证件头像
			enation varchar2(16),        --民族
			eidentif int not null unique,  --身份证号
			ebirthday varchar2(30),     --出生日期
			ework varchar2(30),       --职业
			eaddr varchar2(50),       --联系地址
			ephone int,               --联系电话
			remain1 varchar2(30) ,
			remain2 varchar2(30) ,	
		
		}
		
		create table class{      --班级表
			cid int primary key, --班级id
			cname varchar2(20),--班级名称
			aid int foreigen key references academy(aid) on delete cascade, -- 所在学院
			remain1 varchar2(30) ,
			
		}
		
		
		create table news{   --新闻通知表
			nid int primary key,--新闻id
			toid int foreigen key references topic(toid) on delete cascade,--新闻标题
			ntext varchar2(10000),--新闻正文
			remain1 varchar2(30) ,
		
		
		}
		
		create table topic{  --新闻标题表
			toid int primary key, --标题id
			toname varchar2(60),--标题名称	
			todate Date ,--发布时间
			remain1 varchar2(30) ,	
		}
		
		create table computest{  --报考表                                       《关键表》
			cid int primary key,  --报考编号
			eid foreigen key references enrollmsg(eid) on delete cascade,
			teid foreigen key references testclas(teid) on delete cascade,
			cstatus varchar2 check in('未审核','审核通过','未通过','已删除')
			cotid varchar2(20),   --准考证号
			cotclass varchar2(30),--考场号
			cottask varchar2(10), --座位号
		}
		
		create table testclas{  --考试类别表
			teid int primary key,
			tename varchar2(20),    --考试名称
			televel int check in(1,2,3,4),  --考试级别

		}
		
		
		create table testclass{    --考场表
			teid int primary key,
			teclass varchar2(14),--教室编号
			testutotal varchar2(12),--教室最大容量
	
		}
		
		
		/*************已创建*******************/
		create table sysadmin(	--系统管理员
			syid int primary key,
			syname varchar2(12),--管理员姓名
			sypwd varchar2(16)--登录密码
		)
		insert into sysadmin values(1,'admin','a');
		
		create table academy(   --学院表
			aid int primary key ,--学院id
			aname varchar2(20),--学院名称
			remain1 varchar2(30)
		)
		insert into  academy values(1,'计信学院','');
		select * from academy;
		
		create table academyadmin(      --院系管理员表
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
		insert into academyadmin values(1000,'粟辉','1134725937@qq.com','961014','男','/picKu/8.jpg','院长',1,'18216062440','2017-03-21',default);
		insert into academyadmin values(1001,'刘婷玉','1436586658@qq.com','961014','女','/picKu/3.jpg','书记',1,'18216034297','2017-03-22',default);
		select * from academyadmin am inner join academy ac on am.acacademyid=ac.aid and am.acstatus='待审核'
		
		
		
		
		
		
		