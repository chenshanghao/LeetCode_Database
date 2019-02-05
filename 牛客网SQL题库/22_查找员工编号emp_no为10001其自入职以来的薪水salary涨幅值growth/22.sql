
-- 查找员工编号emp_no为10001其自入职以来的薪水salary涨幅值growth
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`)); 




-- My Solution
Select (Max(salary) - Min(salary)) as growth
From salaries
Where emp_no = 10001


-- Learning Solution

-- 本题严谨的思路如下：
-- 1、先分别找到emp_no=10001的员工的第一次工资记录与最后一次工资记录
-- 2、再将最后一次工资记录减去第一次工资记录得到入职以来salary的涨幅，最后用别名growth代替

SELECT ( 
(SELECT salary FROM salaries WHERE emp_no = 10001 ORDER BY to_date DESC LIMIT 1) -
(SELECT salary FROM salaries WHERE emp_no = 10001 ORDER BY to_date ASC LIMIT 1)
) AS growth