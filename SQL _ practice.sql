-- 创建数据库和表

CREATE DATABASE company DEFAULT CHARSET utf8;

CREATE TABLE employee (

id INT PRIMARY KEY AUTO_INCREMENT,

`name` VARCHAR(10) NOT NULL,

sex CHAR(2) NOT NULL,

age INT NOT NULL,`department`

salary DECIMAL(6,2) NOT NULL,

department_id INT NOT NULL 

);
CREATE TABLE department(
department_id INT PRIMARY KEY AUTO_INCREMENT,

`name` VARCHAR(10) NOT NULL,

department_lead_id INT NOT NULL
);

-- 1.1 按年龄升序显示员工

SELECT * FROM employee  ORDER BY  age ASC;

-- 1.2.1 按年龄升序的员工，显示第一行 ,即年龄最小的员工

SELECT  *  FROM  employee  WHERE age =(

 SELECT MIN(age) FROM employee
);

-- 1.2.2 即年龄等于最小年龄的员工

SELECT * FROM  employee  ORDER BY  age  ASC;
SELECT * FROM  employee  ORDER BY  age  ASC  LIMIT 3,3 ;
SELECT * FROM  employee  ORDER BY  age  ASC  LIMIT 0,2 ;

-- 1.3 显示从第3行开始的两个员工（limit 用来分页显示）

SELECT * FROM  employee  ORDER BY  age  ASC  LIMIT 3,2;

-- 1.4 年龄不为 20，30 的员工

SELECT * FROM  employee  WHERE  age != 20  AND age != 30 ;  
SELECT * FROM  employee  WHERE  age NOT IN (20,30);

-- 1.5 员工表增加入职日期字段，员工表增加是否离职字段

ALTER  TABLE  employee  ADD COLUMN  entry_date DATE; 
ALTER  TABLE  employee  ADD COLUMN  resignation  CHAR(6); 

-- 1.6.1 按入职日期统计员工数

SELECT  entry_date , COUNT(id) AS number  FROM employee GROUP BY  entry_date; 

-- 1.6.2 按入职月份统计员工数

SELECT  MONTH(entry_date), COUNT(id) AS number  FROM employee  GROUP BY MONTH(entry_date);

-- 1.6.3 按性别统计员工数

SELECT  sex ,COUNT(id) AS number  FROM employee  GROUP BY  sex;

-- 1.6.4 按年龄统计员工数

SELECT age , COUNT(id ) AS number  FROM employee GROUP BY age ;

-- 1.6.5 按年龄段([0,10),[10,20),[20,30)....)统计员工数

SELECT  age DIV 10 ,COUNT(id) AS number  FROM employee  GROUP BY  age DIV 10 ;
SELECT  age DIV 10 AS `年龄段` , COUNT(id) AS number  FROM employee GROUP BY `年龄段`;

-- 1.6.6 按工资段([0,1000),[1000,2000),[2000,3000).....)统计员工数

SELECT  salary DIV 1000 AS 工资段, COUNT(id) AS number  FROM  employee  GROUP BY 工资段;

-- 1.6.7 按男员工年龄统计员工数

SELECT  sex, COUNT(id) AS number FROM  employee  WHERE sex = "男"  GROUP BY  age ;

-- 1.6.8 按年龄段，部门号统计员工数

SELECT  age DIV 10, department_id, COUNT(id) AS number FROM  employee  GROUP BY  age DIV 10 ,department_id ;

