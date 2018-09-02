-- 4.3 该学生学过的全部课程为1号学生学过的全部课程的其他学生id.



 -- 方法1：

 
 SELECT q.s_id FROM 

    (SELECT * 
	
		FROM student_course sc LEFT JOIN (SELECT c_id cid FROM student_course sc1 WHERE sc1.s_id  = 1)t ON t.cid = sc.c_id)q

    GROUP BY q.s_id

    HAVING COUNT( q.c_id) = COUNT( q.cid); 



	-- 方法2：

  SELECT sc.s_id, GROUP_CONCAT( sc.c_id) FROM student_course sc

    GROUP BY sc.s_id

    HAVING GROUP_CONCAT( sc.c_id) = (SELECT GROUP_CONCAT( sc1.c_id) FROM student_course sc1 WHERE sc1.s_id = 1);


	
	
	-- 方法3：

  SELECT sc.s_id FROM student_course sc
    
    WHERE sc.c_id IN (SELECT sc1.c_id FROM student_course sc1 WHERE sc1.s_id = 1) 

    GROUP BY sc.s_id

    HAVING COUNT( sc.c_id) = (SELECT COUNT( sc1.c_id) FROM student_course sc1 WHERE sc1.s_id = sc.s_id);

