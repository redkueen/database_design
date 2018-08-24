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