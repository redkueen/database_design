-- view 视图
CREATE VIEW v_student_count_per_course AS 
SELECT `name` ,student_number FROM 
        course JOIN (SELECT c_id , COUNT(id) AS student_number FROM  student_course  GROUP BY c_id)t
                  ON course.id = t.c_id ;
SELECT * FROM v_student_count_per_course t;
SELECT * FROM ( SELECT `name` ,student_number FROM 
        course JOIN (SELECT c_id , COUNT(id) AS student_number FROM  student_course  GROUP BY c_id)t
                  ON course.id = t.c_id  )t;
DELETE FROM v_student_count_per_course; -- 该视图为多表join,不能删除。 故报错误


  CREATE VIEW v_sc_s_c_t as
SELECT s.id AS s_id, s.name AS s_name, s.sex AS sex, s.age AS age,
  sc.id AS sc_id, sc.score AS score,
  c.id AS c_id, c.name AS c_name,
  t.id AS t_id, t.name AS t_name
  FROM 
  student_course sc JOIN student s ON s.id=sc.s_id
  JOIN course c ON c.id=sc.c_id
    JOIN teacher t ON t.id=c.t_id