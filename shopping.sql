SHOW CREATE TABLE `order`;
UPDATE  users SET `PASSWORD` ='xyz12345',jifen = '4356' WHERE user_id = 1;
INSERT users(NAME,PASSWORD,jifen)VALUE('曹桂林','cgl23416',23433);
INSERT goods(NAME,price)VALUE('鸡爪',20);
DELETE FROM goods WHERE good_id = 3;
INSERT `order`(user_id,good_id,summation)VALUE(1,2,10);
INSERT `order`(user_id,good_id,summation)VALUE(1,4,40);
INSERT `order`(user_id,good_id,summation)VALUE(2,2,10);
INSERT `order`(user_id,good_id,summation)VALUE(2,4,40);
SELECT * FROM users WHERE user_id = 1;
SELECT * FROM goods WHERE good_id = 2;
SELECT `name` FROM goods WHERE good_id=2;
SELECT `name` FROM goods WHERE good_id IN (SELECT good_id FROM `order` WHERE user_id =1);
SELECT goods.name FROM `order` JOIN goods ON order.good_id = goods.good_id WHERE user_id =2; 
SELECT goods.name FROM `order`,goods WHERE order.good_id = goods.good_id AND order.user_id = 1;

SELECT users.name,goods.name,goods.price FROM `order` JOIN goods ON order.good_id = goods.good_id 
JOIN users ON order.user_id = users.user_id WHERE order.user_id = 1;
SELECT MAX(price)AS mp,MIN(price)AS mip FROM goods;
SELECT user_id ,COUNT(id)AS COUNT,MAX(summation)AS ms,AVG(summation)AS av FROM `order` WHERE good_id=4 GROUP BY user_id;
SELECT user_id ,COUNT(id)AS COUNT,MAX(summation)AS ms,AVG(summation)AS av FROM `order` WHERE good_id=4 GROUP BY user_id HAVING av >25; 

