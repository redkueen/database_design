
-- 4.2 该老师教过的全部课程 为1号学生学过的全部课程的老师id.

  -- 方法1：

  SELECT q.t_id FROM 

    (SELECT * 
	      
		FROM course c LEFT JOIN (SELECT c_id cid FROM student_course sc1 WHERE sc1.s_id  = 1)t ON t.cid = c.id)q

    GROUP BY q.t_id

    HAVING COUNT( q.id) = COUNT( q.cid);


  -- 方法2：

  SELECT c.t_id,GROUP_CONCAT( c.id) FROM course c

    GROUP BY c.t_id

    HAVING GROUP_CONCAT( c.id) = (SELECT GROUP_CONCAT( sc.c_id) FROM student_course sc WHERE sc.s_id = 1);

-- 方法3：

  SELECT c.id FROM course c 
    
    WHERE c.id IN (SELECT sc.c_id FROM student_course sc WHERE sc.s_id = 1)

    GROUP BY c.t_id 
    
    HAVING COUNT( c.id) = (SELECT COUNT( sc.c_id) FROM student_course sc WHERE sc.c_id = c.id); 