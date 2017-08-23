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
ALTER TABLE `order`ADD CONSTRAINT FOREIGN KEY fk_good_id (good_id) REFERENCES goods(good_id);
SELECT * FROM goods ORDER BY  price;
SELECT * FROM goods ORDER BY  price DESC;
SELECT * FROM goods ORDER BY  price ASC;


SELECT * FROM `order` WHERE user_id = 1 ORDER BY summation;

SELECT * FROM goods LIMIT 5;

SELECT * FROM goods LIMIT 2,4;

SELECT * FROM `order` WHERE user_id = 1 ORDER BY good_id ,summation;
SELECT * FROM `order`  ORDER BY good_id ,summation;
SELECT * FROM `order` ORDER BY good_id DESC,summation ASC;




SELECT user_id ,summation,COUNT(id)AS COUNT,MAX(summation)AS ms,AVG(summation)AS av FROM `order` WHERE good_id=4 GROUP BY user_id,summation;



SELECT user_id ,summation,COUNT(id)AS COUNT,MAX(summation)AS ms,AVG(summation)AS av FROM `order` GROUP BY user_id,summation;


SELECT user_id ,good_id,COUNT(id)AS COUNT,MAX(summation)AS ms,AVG(summation)AS av FROM `order` WHERE good_id=4 GROUP BY user_id,good_id;

SELECT user_id ,good_id,COUNT(id)AS COUNT,MAX(summation)AS ms,AVG(summation)AS av FROM `order` GROUP BY user_id,good_id;


CREATE TABLE `市` (                                                                                                                                           
`省名` VARCHAR(45) NOT NULL,                                                                                                                               
`市名` VARCHAR(45) NOT NULL,                                                                                                                               
PRIMARY KEY (`省名`,`市名`)                                                                                                                              
 );
 
 CREATE TABLE `市2` (  																		
id INT PRIMARY KEY,																
`省名` VARCHAR(45) NOT NULL,                                                                                                                               
`市名` VARCHAR(45) NOT NULL,                                                                                                                               
UNIQUE(`省名`,`市名`)                                                                                                                              
 ); 
 
  CREATE TABLE `市3` (  																		
id INT PRIMARY KEY,																
`省名` VARCHAR(45) NOT NULL,                                                                                                                               
`市名` VARCHAR(45) NOT NULL,                                                                                                                               
CONSTRAINT uq_省名_市名 UNIQUE(`省名`,`市名`)                                                                                                                              
 ); 