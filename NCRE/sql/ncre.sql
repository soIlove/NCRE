<<<<<<< HEAD
create table students(               --学生注册表
      sid int primary key,  --学生编号
      sxid varchar2(15) unique ,    --登录账号
      spwd varchar2(30),  --登录密码
      sname varchar2(10),  --学生姓名，
      ssex varchar2(10) check(ssex in('男','女')) ,  --性别
      semail varchar2(40),  --邮箱
      sacademy varchar2(20),  --所在学院
      sclass varchar2(20),  --所在班级
      remain1 varchar2(30) ,
      remain2 varchar2(30) ,
    )
    
    create sequence seq_sid start with 1001;                    --后面序列格式类似，    seq_(*id)
    
        insert into students values(seq_sid.nextval,'1914588314','a','黄小舟','男','1914588314@qq.com','计算机与信息科学学院','网络1403',null,null);
        insert into students values(seq_sid.nextval,'1103845033','a','粟小辉','女','1103845033@qq.com','计算机与信息科学学院','网络1402',null,null);
        insert into students values(seq_sid.nextval,'2212211221','a','小小丹','男','2212211221@qq.com','计算机与信息科学学院','网络1401',null,null);
        insert into students values(seq_sid.nextval,'234','a','小qqo','女','2656565521@qq.com','计算机与信息科学学院','软件1401',null,null);
        
        select * from students;

    create table enrollmsg(       --报名信息表
      eid int primary key,          --报名编号
      sid int  references  students(sid) on delete cascade , --学生id
      epicture varchar2(100),     --证件头像
      enation varchar2(16),        --民族
      eidentif varchar2(30) ,  --身份证号
      ebirthday varchar2(30),     --出生日期
      ework varchar2(30),       --职业
      eaddr varchar2(50),       --联系地址
      ephone varchar2(),               --联系电话
      
      remain1 varchar2(30) ,
      remain2 varchar2(30) ,  
    
    )
    
    select * from enrollmsg where eid=2010
    
    
    create sequence seq_eid start with 2001
   
  insert into enrollmsg values(seq_eid.nextval,1014,'/D:wwwfj','汉','342401233343243','1995-10-13','学生','湖南工学院','18188970546',null,null);
    insert into enrollmsg values(seq_eid.nextval,1002,'/D:wwwfj','汉','342401233343243','1995-10-13','学生','衡阳师范学院','18188970546',null,null);
      insert into enrollmsg values(seq_eid.nextval,1003,'/D:wwwfj','汉','342401233343243','1995-10-13','学生','蚌埠学院','18188970546',null,null)
      insert into enrollmsg values(seq_eid.nextval,1004,'/D:wydfgfj','汉','31349898743','1995-10-13','学生','安徽省六安市','1828970546',null,null)
      select * from enrollmsg
      
      create table testclas(  --考试类别表
=======
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
		
		
		create table news{   --新闻通知表
			nid int primary key,--新闻id
			toid int foreigen key references topic(toid) on delete cascade,--新闻标题
			ntext varchar2(10000),--新闻正文
		}
		
		create table topic{  --新闻标题表
			toid int primary key, --标题id
			toname varchar2(60),--标题名称	
			todate Date ,--发布时间
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
>>>>>>> branch 'master' of git@github.com:soIlove/NCRE.git
			teid int primary key,
			tename varchar2(20),    --考试名称
			televel int check (televel in(1,2,3,4)) --考试级别
      )
      
      
      drop table testclass
      create sequence seq_teid start with 3001;
      
      insert into testclas values(seq_teid.nextval,'MS office高级应用',2);
      insert into testclas values(seq_teid.nextval,'web程序设计',2);
      insert into testclas values(seq_teid.nextval,'java语言程序设计',2);

<<<<<<< HEAD
      select * from testclas
      
      create table computest(  --报考表                                       《关键表》
			cid int primary key,  --报考编号
			eid  references enrollmsg(eid) on delete cascade,  --报名编号
			teid  references testclas(teid) on delete cascade,  --考试类别编号
			cstatus varchar2(10) check (cstatus in('未审核','审核通过','未通过','已删除')),
			cotid varchar2(20),   --准考证号
			cotclass varchar2(30),--考场号
			cottask varchar2(10)--座位号
		)
    
    
    
    delete from enrollmsg where eid=(select eid from computest where cid=4008)  --删除学生补充信息
    
    update computest set cstatus='审核通过' where cid=4002;
    create sequence seq_cid start with 4001;
    
    delete from enrollmsg where eid=2001;
    insert into computest values(seq_cid.nextval,2012,3001,'未审核',null,null,null);
    insert into computest values(seq_cid.nextval,2013,3002,'未审核',null,null,null);
    insert into computest values(seq_cid.nextval,2014,3003,'未审核',null,null,null);
     insert into computest values(seq_cid.nextval,2016,3003,'未通过',null,null,null);

    select * from computest where cstatus='未通过';
    
    
    	create table academy(   --学院表
			aid int primary key ,--学院id
			aname varchar2(20),--学院名称
			remain1 varchar2(30)
		)
    
    create sequence seq_aid start with 5001;
		insert into  academy values(seq_aid.nextval,'机械学院',null);
    insert into  academy values(seq_aid.nextval,'材化学院',null);
    insert into  academy values(seq_aid.nextval,'经管学院',null);
    insert into  academy values(seq_aid.nextval,'计算机与信息科学学院',null);
		select * from academy;
    
    <th>报考编号</th>

					<th>姓名</th>	<th>证件照</th>	<th>性别</th><th>班级</th><th>民族</th><th>身份证号</th><th>联系电话</th><th>考试类别</th><th>审核状态</th>
											
			select cid, st.sname,en.epicture,st.ssex,st.sclass,en.enation,en.eidentif,en.ephone,te.tename,co.cstatus from computest co 
      left join  enrollmsg en 
      on co.eid=en.eid
      left join students st
      on en.sid=st.sid
      left join testclas te
      on co.teid=te.teid 
      left join academy ac
      on st.sacademy=ac.aname
      where ac.aid=5005 and cstatus='未通过'
      order by cid asc;
      
      
     						

			commit						
      
      
  create table notThrowLog(  --审核未通过日志记录表
        noid int primary key,    --日志编号
        cid references computest(cid) on delete cascade,   --报考信息编号
        nocontent varchar2(400)  --未通过原因描述
 )
  
  create sequence seq_noid start with 1001;
						
  
  insert into notThrowLog values(seq_noid.nextval,4016,'证件照不符合规范，请重新上传教务证件图片');
  insert into notThrowLog values(seq_noid.nextval,4017,'未缴费，放弃报名');					

	select * from notThrowLog where cid=4008;									
         
  	select cid, st.sname,en.epicture,st.ssex,st.sclass,en.enation,en.eidentif,en.ephone,te.tename,co.cstatus,no.nocontent from computest co 
      left join  enrollmsg en 
      on co.eid=en.eid
      left join students st
      on en.sid=st.sid
      left join testclas te
      on co.teid=te.teid 
      left join academy ac
      on st.sacademy=ac.aname
      left join notthrowlog no
      on co.cid=no.cid
      where ac.aid=5005 and cstatus='未通过'    
      order by  st.sclass
      
      
      
      
   delete    
    

	/*************已创建*******************/
=======
		}
		
		
		
		
		/*************已创建*******************/
>>>>>>> branch 'master' of git@github.com:soIlove/NCRE.git
		create table sysadmin(	--系统管理员
			syid int primary key,
			syname varchar2(12),--管理员姓名
			sypwd varchar2(16)--登录密码
		)
		insert into sysadmin values(1,'admin','a');
		
		create table academy(   --学院表
			aid int primary key ,--学院id
			aname varchar2(20),--学院名称
		)
		insert into  academy values(1,'计信学院','');
		create sequence seq_academy_aid start with 10001;
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
    se
		alter table academyadmin ADD CONSTRAINT FK_academyadmin_acacademyid foreign key(acacademyid) references academy(aid) on delete cascade;
		insert into academyadmin values(1000,'粟辉','1134725937@qq.com','961014','男','/picKu/8.jpg','院长',1,'18216062440','2017-03-21',default);
		insert into academyadmin values(1001,'刘婷玉','1436586658@qq.com','961014','女','/picKu/3.jpg','书记',1,'18216034297','2017-03-22',default);
		select * from academyadmin am inner join academy ac on am.acacademyid=ac.aid and am.acstatus='待审核' order by actime desc
		update academyadmin set acstatus = '待审核' where acid = 1000
<<<<<<< HEAD
			insert into academyadmin values(seq_acid.nextval,'刘婷玉','1436586658@qq.com','a','女','/picKu/3.jpg','书记',5001,'18216034297',sysdate,default);
		create table class(      --班级表
			cid int primary key, --班级id
			cname varchar2(20),--班级名称
			acacademyid int, --所属学院
			remain1 varchar2(30)
		)
		rename class to clazz;
		alter table clazz ADD CONSTRAINT FK_class_acacademyid foreign key(acacademyid) references academy(aid) on delete cascade;
		select * from clazz c inner join academy a on c.acacademyid=a.aid order by cid,aid;
		
		create sequence seq_cid start with 1;
		insert into clazz values(1,'网络1402',1,'');
		insert into clazz values(2,'网络1403',(select aid from academy),'');							

										
   
=======
		
		create table clazz(      --班级表
			cid int primary key, --班级id
			cname varchar2(20),--班级名称
			acacademyid int --所属学院
		)
		rename class to clazz;
		alter table clazz ADD CONSTRAINT FK_class_acacademyid foreign key(acacademyid) references academy(aid) on delete cascade;
		select * from clazz c inner join academy a on c.acacademyid=a.aid order by cid,aid;
		insert into clazz values(seq_clazz_cid.nextval,'计科1302',5005);
		insert into clazz values(3,'网络1401',(select aid from academy where aname='计算机与信息科学学院'),'');
		create sequence seq_clazz_cid start with 1;
		
		create table news(				--新闻通知表
			news_id int primary key,	--新闻id
			news_name varchar2(60),		--标题名称	
			news_text varchar2(1000),	--新闻正文(不得超过五百字)
			news_pic varchar2(100),		--新闻图片
			news_date date				--发布时间
		);
		insert into news values(2,'大学四级考试改革','自2017年6月份开始，大学英语四级考试全面改革，满分750分将缩为100分','/picKu/1.jpg',sysdate);
		create sequence seq_news_id start with 1;
		select * from news;
		alter table news add ;
		drop table news
		
		
		create table kaoroom(		--考场表
			krid int primary key,
			krclass varchar2(20),	--考场名称		第15考室
			krtotal varchar2(10),	--教室最大容量		40
			krlou varchar2(20), 	--考场所属楼层		2号楼（信息楼）
			kraddr varchar2(20)		--考场位置			612
		)
		insert into kaoroom values(seq_kaoroom_kaid.nextval,'第4考室','40','材化楼','417');
		select * from kaoroom;
		create sequence seq_kaoroom_kaid start with 1;
		
		
		
>>>>>>> branch 'master' of git@github.com:soIlove/NCRE.git
