create database esclass;
use esclass;

create table users(
	uid char(11) not null,
	uname varchar(60) not null,
	upwd varchar(30) not null,
	primary key(uid)
)engine=innodb default charset=utf8;

create table wallpapers(
	wid int not null AUTO_INCREMENT,
	wname varchar(32) not null,
	wlabel char(8) not null,
	author char(11) not null,
	stpath varchar(40) not null,
	primary key(wid)
)engine=innodb AUTO_INCREMENT=1 default charset=utf8;