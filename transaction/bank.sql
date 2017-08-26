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
commit;---提交 代表事务结束；  事务正常提交了，这是一种事务结束

start transaction;    ---开始 “事务”
update user set balabce=balance+10000 where id =1;
update user set balance=balance-10000 where id =2;
rollback;  --- “回滚 or 撤销”   ；  一般出现错误时候，事物回滚，这也是一种事务结束


start transaction;
update user set balabce=balance+10000 where id =1;
update user set balance=balance-10000 where id =2;
-- 如果 id为2的user的balance小于0:
rollback;  
-- 否则:
commit;


start transaction;
-- 如果 id为1的user的balance小于10000:
rollback;
-- 否则: {做减去 和 加上
update user set balabce=balance-10000 where id =1;
update user set balance=balance+10000 where id =2;
commit;
-- }

set autocommit = 'OFF';  -- 设置“自动提交”关闭
update user set balance = balance - 10000 where id = 1;
update user set balance = balance + 10000 where id = 2;
rollback;