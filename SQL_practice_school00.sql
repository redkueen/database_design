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

	
	
	
-- 方法4：

  SELECT sc.s_id FROM student_course sc 
    
    WHERE sc.c_id IN (SELECT c.id FROM course c WHERE c.t_id = 1)
    
    GROUP BY sc.s_id
    
    HAVING COUNT( sc.c_id) = (SELECT COUNT( sc1.c_id) FROM student_course sc1 WHERE sc1.s_id = sc.s_id);