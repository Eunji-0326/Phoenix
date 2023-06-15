update mysql.user set password=password("P@ssw0rd") where user='root';
flush privileges;

create database WebTest default character set utf8;
use WebTest;

create table member(
no int not null auto_increment primary key,
u_id varchar(20) not null unique,
u_pass varchar(50) not null,
u_name varchar(20) not null,
nickname char(20),
age int,
email char(50) ,
reg_date datetime not null);

create table board(
strNumber int not null auto_increment primary key,
strName varchar(20) not null,
strPassword varchar(20) not null,
strEmail varchar(50),
strSubject varchar(100) not null,
strContent text not null,
htmlTag char(1) not null,
viewCount int not null default 0,
filename varchar(50),
filesize int,
writeDate datetime);

insert into member values('','tester','tester','테스터','테스트계정','','',now());
insert into member values('','admin','P@ssw0rd','관리자','관리자','','',now());
