-- 4.1 该学生学过的全部课程为 1号老师教授的全部课程 的学生id.

-- 方法1：（不可用，and exsits 语句存在瑕疵）

 SELECT s.id FROM student s 
  
    WHERE (select count(id)as number FROM student_course sc WHERE sc.s_id = s.id)
       
             = (SELECT COUNT(id)AS number FROM course c WHERE c.t_id = 1 )
     
    AND EXISTS

          (SELECT * FROM student_course sc 

                  WHERE sc.s_id = s.id  AND sc.c_id IN (SELECT c.id FROM course c WHERE c.t_id = 1));

-- 方法2：

  SELECT  sca.s_id FROM 
(
  SELECT  sc.*,ca.id ca_id  FROM 
  student_course sc LEFT JOIN (SELECT c.id FROM course c WHERE c.t_id=1)ca ON sc.c_id = ca.id
)sca 
    GROUP BY sca.s_id
    HAVING COUNT(sca.c_id) = COUNT(sca.ca_id);

-- 方法3：
  
  SELECT sc.s_id ,GROUP_CONCAT( sc.c_id)AS course_list FROM student_course sc 

    GROUP BY sc.s_id 

    HAVING course_list = (SELECT GROUP_CONCAT( c.id) FROM course c WHERE c.t_id = 1);

-- 4.2 该老师教过的全部课程 为1号学生学过的全部课程的老师id.

  -- 方法1：

  SELECT q.t_id FROM 

    (SELECT * FROM course c LEFT JOIN (SELECT c_id cid FROM student_course sc1 WHERE sc1.s_id  = 1)t ON t.cid = c.id)q

    GROUP BY q.t_id

    HAVING COUNT( q.id) = COUNT( q.cid);


  -- 方法2：

  SELECT c.t_id,GROUP_CONCAT( c.id) FROM course c

       GROUP BY c.t_id

       HAVING GROUP_CONCAT( c.id) = (SELECT GROUP_CONCAT( sc.c_id) FROM student_course sc WHERE sc.s_id = 1);
    
-- 4.3 该学生学过的全部课程为1号学生学过的全部课程的其他学生id.

 -- 方法1：

  SELECT q.s_id FROM 

    (SELECT * FROM student_course sc LEFT JOIN (SELECT c_id cid FROM student_course sc1 WHERE sc1.s_id  = 1)t ON t.cid = sc.c_id)q

    GROUP BY q.s_id

    HAVING COUNT( q.c_id) = COUNT( q.cid); 

 -- 方法2：

  SELECT sc.s_id, GROUP_CONCAT( sc.c_id) FROM student_course sc

      GROUP BY sc.s_id

      HAVING GROUP_CONCAT( sc.c_id) = (SELECT GROUP_CONCAT( sc1.c_id) FROM student_course sc1 WHERE sc1.s_id = 1);

-- 4.4 该学生学过的全部课程为全部课程的学生id.

  -- 方法1：

  SELECT q.s_id FROM 

      (SELECT sc.*, t.cid FROM student_course sc LEFT JOIN (SELECT id cid FROM course c )t ON sc.c_id = t.cid)q 

       GROUP BY q.s_id

       HAVING COUNT( q.c_id) = ( sELECT count(id)as cid FROM course c);

  -- 方法2：

  SELECT sc.s_id, GROUP_CONCAT( sc.c_id) FROM student_course sc

    GROUP BY sc.s_id
    
    HAVING GROUP_CONCAT( sc.c_id) = (SELECT GROUP_CONCAT( c.id) FROM course c);