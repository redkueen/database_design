-- SQL 语句练习

-- 2.0 update(按行修改某个字段)语句的使用

UPDATE student_course sc SET sc.score = 59 WHERE sc.s_id = 5 ;

UPDATE student_course sc SET sc.score = 62 WHERE sc.id = 1 ;

UPDATE student_course sc SET sc.score = sc.id MOD 4 * 23 ;

UPDATE student_course sc SET sc.score = RAND()*100;

UPDATE student_course sc SET sc.score = RAND()*60 + 40;

UPDATE student_course sc SET sc.score = FLOOR(RAND()*60 + 40);

-- 2.1 每课程被选的学生数

SELECT `name` ,student_number FROM 
        course JOIN (SELECT c_id , COUNT(id) AS student_number FROM  student_course  GROUP BY c_id)t
                  ON course.id = t.c_id ;

-- 2.2 学生选的课程数

SELECT `name`, course_number FROM 
        student JOIN (SELECT s_id , COUNT(id) AS course_number FROM  student_course  GROUP BY s_id)t
                  ON student.id = t.s_id ;

-- 2.3 与1号学生至少有一门课相同的学生id

SELECT s_id FROM student_course WHERE c_id IN (SELECT c_id FROM student_course WHERE student_course.s_id = 1);
-- SELECT * FROM student_course sc WHERE sc.s_id IN ( SELECT sc1.s_keid FROM student_course sc1 WHERE sc1.s_id=1 );

-- 2.4 统计每门课程的平均成绩,按平均成绩升序排序,平均成绩相同时按课号降序排序

  SELECT sc.c_id,AVG(sc.score) AS average_score FROM student_course sc GROUP BY sc.c_id ORDER BY average_score ASC,sc.c_id DESC;

-- 2.5 学过1号课程且学过2号课程的学生id

  SELECT t1.s_id,t1.c_id,t2.c_id FROM 
    (SELECT sc.s_id,sc.c_id FROM student_course sc WHERE sc.c_id = 1)t1 JOIN (SELECT sc.s_id ,sc.c_id FROM student_course sc WHERE sc.c_id = 2)t2 ON t1.s_id = t2.s_id ;

-- 2.6 该学生平均分数大于60的学生id

  SELECT sc.s_id ,AVG(sc.score) AS average_score FROM student_course sc GROUP BY sc.s_id HAVING average_score > 60 ;

-- 2.7 统计男学生的选课数目,各课程总分数,各课程平均分数

-- 方法1：

  SELECT s.id, COUNT(sc.c_id) AS `选课数目`,SUM(sc.score) AS `总分数`,AVG(sc.score) AS average_score 
    FROM student s JOIN student_course sc ON s.id = sc.s_id WHERE s.sex = "男" GROUP BY s.id ;
 
 SELECT * FROM   student s JOIN student_course sc ON s.id = sc.s_id WHERE s.sex = "男";

-- 方法2:

  SELECT sc.s_id,COUNT(sc.c_id) AS `选课数目`,sum(sc.score) AS `总分数`,AVG(sc.score) AS average_score 
    FROM (SELECT * FROM student s WHERE s.sex = "男")t JOIN student_course sc ON t.id = sc.s_id GROUP BY t.id; 

-- 2.8 姓张同学个数

  SELECT COUNT(s.id) AS number FROM student s WHERE s.name LIKE"张%";

-- 2.9 按学生名字统计次数大于1的名字(即同名同姓学生)

  SELECT s.name,COUNT(s.id) AS number FROM student s GROUP BY s.name HAVING number = 1;

  SELECT s.name, COUNT(s.id) AS number FROM student s GROUP BY s.name HAVING number >= 2 ;

-- 2.10 新增一门课程名为音乐

  INSERT course (name, t_id) VALUES("音乐",null);

  INSERT course (name, t_id) VALUES("计算机",null);

-- 2.11 给所有女学生新增音乐课(id=8)的选课记录行,分数为null

  INSERT student_course (s_id,c_id,score) select id as s_id,8 as c_id, null as score from student where student. sex = "女";
  INSERT student_course (s_id,c_id,score) VALUES (1,2,30);
  INSERT INTO student_course (s_id,c_id,score) VALUES (1,2,30);
  INSERT student_course (s_id,c_id,score) VALUES (1,2,30),(1,3,80),(1,5,70);
  INSERT student_course SET  s_id =4, c_id = 3, score = 57;

-- 2.12 删除2号老师教授的课程的所有选课记录

  DELETE FROM student_course WHERE id IN (SELECT sc.id FROM student_course sc JOIN course c ON sc.c_id = c.id WHERE c.t_id = 2);

-- 2.13统计各课程最高分数,最低分数

  SELECT c.name,max_score,min_score FROM course c JOIN 
       (SELECT sc.c_id,MAX(sc.score)AS max_score, MIN(sc.score) AS min_score FROM student_course sc GROUP BY sc.c_id)t ON c.id = t.c_id;

-- 2.14 两门课以上不及格的学生id

  SELECT sc.s_id, COUNT(sc.id)AS number FROM student_course sc WHERE sc.score < 60 GROUP BY sc.s_id HAVING number >= 2;

-- 2.15 至少选了两门课的学生id 

  SELECT sc.s_id,COUNT(sc.id)AS number FROM student_course sc GROUP BY s_id HAVING number >= 2; 

-- 2.16 只选了一门课的学生id

  SELECT sc.s_id,COUNT(sc.id)AS number FROM student_course sc GROUP BY s_id HAVING number = 1 ; 

-- 2.17 该学生所有课程分数都小于60分的学生id

-- 方法1:

  SELECT t1.s_id FROM (SELECT sc.s_id,COUNT(sc.id)AS number FROM student_course sc GROUP BY sc.s_id )t1 
            JOIN (SELECT sc.s_id,COUNT(sc.id)AS number FROM student_course sc WHERE sc.score < 60 GROUP BY sc.s_id)t2 ON t1.s_id = t2.s_id
        WHERE t1.number = t2.number ;

-- 方法2:

  SELECT s.id FROM student s 
        WHERE (SELECT COUNT( sc.id) AS number FROM student_course sc WHERE sc.s_id = s.id)
                = (SELECT COUNT( sc.id) AS number FROM student_course sc WHERE sc.s_id = s.id AND sc.score <60);