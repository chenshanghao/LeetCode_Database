-- 从titles表获取按照title进行分组，每组个数大于等于2，给出title以及对应的数目t。
-- 注意对于重复的emp_no进行忽略。
CREATE TABLE IF NOT EXISTS "titles" (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);




-- My Solution

Select T.title, Count(T.title) as t
From (Select Distinct(emp_no), title, from_date, to_date From titles) as T
Group By T.title
Having t>=2


-- Learning Solution
-- 1、先用GROUP BY title将表格以title分组，再用COUNT(DISTINCT emp_no)可以统计同一title值且不包含重复emp_no值的记录条数
-- 2、根据题意，输出每个title的个数为t，故用AS语句将COUNT(DISTINCT emp_no)的值转换为t
-- 3、由于WHERE后不可跟COUNT()函数，故用HAVING语句来限定t>=2的条件

SELECT title, COUNT(DISTINCT emp_no) AS t 
FROM titles
GROUP BY title 
HAVING t >= 2