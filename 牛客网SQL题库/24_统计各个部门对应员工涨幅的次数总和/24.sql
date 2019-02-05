-- 题目描述
-- 统计各个部门对应员工涨幅的次数总和，给出部门编码dept_no、部门名称dept_name以及次数sum
CREATE TABLE `departments` (
`dept_no` char(4) NOT NULL,
`dept_name` varchar(40) NOT NULL,
PRIMARY KEY (`dept_no`));
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));




-- My Solution

Select d3.dept_no, d3.dept_name, Count(s.salary) as sum
From (dept_emp as d1 inner join departments as d2 on d1.dept_no = d2.dept_no) as d3
inner Join salaries as s on d3.emp_no = s.emp_no
Group By d3.dept_no

-- Learning Solution

-- 本题关键是要将 每个部门分组，并分别统计工资记录总数，思路如下：
-- 1、用INNER JOIN连接dept_emp表和salaries表，并以dept_emp.no分组，统计每个部门所有员工工资的记录总数
-- 2、再将上表用INNER JOIN连接departments表，限制条件为两表的dept_no相等，找到dept_no与dept_name的对应关系，最后依次输出dept_no、dept_name、sum
SELECT de.dept_no, dp.dept_name, COUNT(s.salary) AS sum 
FROM (dept_emp AS de INNER JOIN salaries AS s ON de.emp_no = s.emp_no) 
INNER JOIN departments AS dp ON de.dept_no = dp.dept_no 
GROUP BY de.dept_no







