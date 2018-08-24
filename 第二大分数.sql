
-- group_concat
SELECT s_id, COUNT(sc.id), AVG(score),MAX(score),MIN(score),GROUP_CONCAT(score),GROUP_CONCAT(c_id),GROUP_CONCAT(s_id) FROM student_course sc GROUP BY sc.s_id;

-- 第二大分数
SELECT *, SUBSTRING( no_max_score, 1, LOCATE(',',no_max_score)-1) AS secondary_score from
(
SELECT* ,SUBSTRING( score_list, LOCATE(',',score_list)+1) AS no_max_score FROM 
  (
  SELECT 
    s_id,  GROUP_CONCAT(DISTINCT score ORDER BY score desc) AS score_list 
  FROM student_course sc GROUP BY sc.s_id
  )t
)tt
;

