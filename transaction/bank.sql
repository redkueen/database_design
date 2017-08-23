create database bank;
use bank;
create table user(id int auto_increment primary key,name varchar(34),password varchar(10),balance int);

insert user(name,password,balance)value('徐巧红','000000',100000);
insert user(name,password,balance)value('曹桂林','578960',200000);




start transaction;
update user set balance=balance-10000 where id =1;
select * from user;
rollback;

select * from user;

start transaction;
update user set balance=balance-10000 where id =1;
update user set balance=balance+10000 where id =2;
select * from user;
commit;

start transaction;
update user set balabce=balance+10000 where id =1;
update user set balance=balance-10000 where id =2;
rollback;
