-- 4.4 该学生学过的全部课程为全部课程的学生id.

  
  
  -- 方法1：

  SELECT q.s_id FROM 

      (SELECT sc.*, t.cid 
	  
		FROM student_course sc LEFT JOIN (SELECT id cid FROM course c )t ON sc.c_id = t.cid)q 

    GROUP BY q.s_id

    HAVING COUNT( q.c_id) = ( sELECT count(id)as cid FROM course c);

  
  
  -- 方法2：

  SELECT sc.s_id, GROUP_CONCAT( sc.c_id) FROM student_course sc

    GROUP BY sc.s_id
    
    HAVING GROUP_CONCAT( sc.c_id) = (SELECT GROUP_CONCAT( c.id) FROM course c);


	
	-- 方法3：

  SELECT sc.s_id FROM student_course sc

    WHERE sc.c_id IN (SELECT c.id FROM course c )

    GROUP BY sc.s_id

    HAVING COUNT( sc.c_id) = (SELECT COUNT(c.id) FROM course c );