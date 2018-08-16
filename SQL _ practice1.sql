-- SQL语句练习

-- 2.1 年龄大于平均年龄的员工

SELECT * FROM employee WHERE age > (SELECT AVG(age) AS 平均年龄 FROM employee);

-- 2.2 年龄小于平均年龄且工资大于平均工资的员工

SELECT * FROM employee WHERE age < (SELECT AVG(age) AS 平均年龄 FROM employee) AND salary > (SELECT AVG(salary) AS 平均工资 FROM employee);

-- 2.3 工资大于部门1的平均工资的员工

-- 方法1:
SELECT * FROM employee WHERE salary > (SELECT AVG(salary) AS 平均工资 FROM employee WHERE department_id = 1);

-- 方法2:
SELECT * FROM employee WHERE salary >( SELECT AVG(salary) AS 平均工资 FROM employee GROUP BY department_id  HAVING  department_id = 1);

-- 2.4 找出非领导的员工

-- 方法1:
SELECT * FROM employee JOIN department ON employee.department_id = department.department_id WHERE id != department_lead_id ;

-- 方法2:
SELECT * FROM employee WHERE id NOT IN(SELECT department_lead_id FROM department WHERE department_lead_id IS NOT NULL);

-- 方法3:
SELECT * FROM employee  WHERE  EXISTS(

      SELECT * FROM  department  WHERE employee.department_id = department.department_id  AND employee.id != department.department_lead_id
);

-- 2.5 找出领导

-- 方法1:
SELECT * FROM employee JOIN department ON employee.department_id = department.department_id  WHERE  id = department_lead_id;

-- 方法2:
SELECT * FROM employee WHERE id IN (SELECT department_lead_id FROM department WHERE department_lead_id IS NOT NULL);

-- 方法3:
SELECT * FROM employee WHERE EXISTS(

     SELECT * FROM department WHERE employee.department_id = department.department_id AND employee.id = department.department_lead_id
);

-- 2.6 找出男领导

-- 方法1:
SELECT * FROM employee JOIN department ON employee.department_id = department.department_id WHERE id = department_lead_id AND sex = "男";

-- 方法2:
SELECT * FROM employee WHERE sex ="男" AND id IN (SELECT department_lead_id FROM department WHERE department_lead_id IS NOT NULL  );

-- 方法3:
SELECT * FROM employee WHERE EXISTS(

      SELECT * FROM department
      
      WHERE employee.department_id = department.department_id AND employee.id = department.department_lead_id AND employee.sex="男"
);

-- 2.7高于本部门平均工资的员工



