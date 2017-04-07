-------------blog项目 --------

-------------------------------------
create sequence seq_usid start with 10001;

-----用户表
create table b_user(
       usid int primary key,               --用户id
       uemail varchar2(50) not null unique, --用户账号(邮箱登录)
       upassword varchar2(50) not null,   --用户密码
       uname varchar2(30),         		  --用户（昵称）    
       usex varchar2(4)  default '男' check (usex in('男','女')),     --用户性别
       ubirthday varchar2(20),            --用户出生日期
       uaddress varchar2(30),             --用户所在地
       upic varchar2(100),                --用户头像
       uphone varchar2(20),               --用户联系方式
       uprofession varchar2(20),          --用户的职业背景
       upersondesc varchar2(200)        --用户个人描述
);
insert into b_user(usid,uemail,upassword) values(seq_usid.nextval,'1506173890@qq.com','a');
update  b_user set upassword = '6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2';

select count(1) total ,ceil(count(1)/10) totalPage ,10 currPage,20pageSize from b_user
select * from (select n.*,rownum rn from (select * from b_user )n
where 10*10>=rownum) t where rn>(10-1)*10


--插入155条用户数据
insert into b_user
select seq_usid.nextval, 
dbms_random.string('x', 4)||'@qq.com','a',
dbms_random.string('l',dbms_random.value(5, 20)),
decode(ceil(dbms_random.value(0, 2)), 1, '男', '女'),
to_char(add_months(sysdate, dbms_random.value(12*18, 12*50) * -1), 'yyyy-MM-dd'),
decode(ceil(dbms_random.value(0, 6)), 1, '湖南', 2, '湖北', 3, '广东', 4, '广西', 5, '北京', '上海'),'',
'180'||ceil(dbms_random.value(10000000,99999999)) ,
decode(ceil(dbms_random.value(0, 6)), 1, '程序员', 2, '测试员', 3, '分析员', 4, '设计员', 5, '翻译员', '管理员'),'' from dual connect by level <= 150;

update b_user set uemail=replace(uemail,'qq.com','@qq.com');

insert into b_user(usid,uemail,upassword) values(seq_usid.nextval,'1506173890@qq.com','a');
update  b_user set upassword = '6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2';

update b_user set uname = '星空浪漫' , ubirthday = '1999-11-1' , uphone = '10086' ,uprofession = '软件编程师' ,upersondesc = '我是非常叼炸天的，别小看我哦！' where usid = 10007;
update b_user set uaddress = '湖南省-衡阳市-珠晖区' where usid = 10007;
insert into b_user(usid,uemail,upassword) values(seq_usid.nextval,'123@qq.com','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2');

select * from b_user;


create sequence seq_adid start with 1001;
-----管理员表
create table b_admin(
       adid int primary key,              --管理员id 
       adname varchar2(20) not null unique,      --管理员名称
       adpassword varchar2(20) default 'a'   --管理员密码
);

 truncate table B_ADMIN;--删除表数据
 alter table b_admin add (admail varchar2(50) not null unique);--添加管理员邮箱（忘记密码登录）

--插入管理员数据
insert into B_ADMIN values(seq_adid.nextval,'admin','a','2576096522@qq.com');
select * from B_ADMIN;

-----文章所属类型（原创，转载，翻译） 1 2 3 
create table b_type(
       tid int primary key,
       tname varchar2(20)
);
create sequence seq_tid start with 4;
--插入文章类型
insert into b_type
select 1 , '原创' from dual union
select 2 , '转载' from dual union
select 3 , '翻译' from dual;


-----文章标签分类表
create table b_tag(
       tagid int primary key,       --标签id
      tagname varchar2(10) not null        --标签名称
);

--创建序列
create  sequence seq_tagid start with 1;

select  * from b_tag;

insert into b_tag values(seq_tagid.nextval,'spring_mvc');
insert into b_tag values(seq_tagid.nextval,'java');
select count(1) from b_tag where tagname='java'

create sequence seq_aid start with 1;
-----文章内容表
create table b_article(
       aid int primary key,               --文章id
       atitle varchar2(20) not null,      --文章标题
       tid int references b_type(tid),   --文章所属类型（原创，转载，翻译） 1 2 3 
       tagid int references b_tag(tagid),    --文章标签
       usid int references b_user(usid),     --文章作者
       atime varchar2(30),                --文章创作时间
       acontent varchar2(800),            --文章文本内容
       apic varchar2(200),                --文章图片  
       aviewnum varchar2(10)            --文章浏览量
);
insert into b_article values(seq_aid.nextval,'java编程',1,1,10001,
to_char(sysdate,'yyyy-MM-dd hh:mm:ss'),'java是面向对象的一种编程，由属性和方法组成。Java对c的有点是不适用指针，实现跨区域','',0);

updata b_article set apic = "";

insert into b_article(aid,atitle,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'java的基本介绍',10002,
			'2017-4-1','30','常常是彼此交换名片，然后郑重或是出于礼貌用手机记下对方的电话号'); 
insert into b_article(aid,atitle,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'oracle的基本介绍',10002,
			'2017-4-1','50','oracle数据库'); 
insert into b_article(aid,atitle,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'spring的基本介绍',10002,
			'2017-4-1','60','spring:一个开源的框架；  包含：IOC(控制反转)/DI（依赖注入） 和 面向切面编程'); 
insert into b_article(aid,atitle,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'aop的作用',10003,
			'2017-4-1','40','主要有两点：1.解决代码的混乱问题2.代码的分散问题'); 
insert into b_article(aid,atitle,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'事务的特性',10003,
			'2017-4-1','40','1. 原子性 2. 一致性 3. 隔离性  4. 持久性'); 
select * from b_article;


-----评论表
create sequence seq_cid start with 1;
create table b_comment(
       cid int primary key,               --评论id
       caid int references b_article(aid),--评论文章id
       usid int references b_user(usid),     --评论者id
       ccontent varchar2(800),            --评论内容
       ctime varchar2(20)              --评论时间
);

select * from B_ARTICLE;

create sequence seq_drid start with 1;
-----草稿箱
create table b_drafets(
       drid int primary key,      --草稿箱id  
       usid int references b_user(usid),     --文章作者      
       drtitle varchar2(20),      --文章的标题         
       drtype varchar2(20),       --文章所属类型（原创，转载，翻译）
       drtag varchar2(20),        --文章标签
       drtime varchar2(30),       --文章创作时间
       drcontent varchar2(800),   --文章文本内容
       drpic varchar2(200)        --文章图片  
      
);
select * from B_ADMIN;--管理员
select * from B_COMMENT;--评论
select  * from b_article;--文章
select * from B_TAG;--标签
select * from B_TYPE;--类型
select  * from B_USER;--用户
select  * from b_drafets;--草稿


drop table b_admin;
drop table b_article;
drop table b_type;   
drop table b_tag;
drop table b_comment;
drop table b_DRAFETS;
drop table b_user;

drop sequence seq_usid;
drop sequence seq_adid;
drop sequence seq_aid;
drop sequence seq_cid;
drop sequence seq_drid;
drop sequence seq_tid;
drop sequence seq_tagid;

SELECT count(1) from b_user;