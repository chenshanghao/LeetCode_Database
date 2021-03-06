-- 汇总各个部门当前员工的title类型的分配数目，结果给出部门编号dept_no、dept_name、其当前员工所有的title以及该类型title对应的数目count
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
CREATE TABLE IF NOT EXISTS `titles` (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);



-- My Solution

Select d.dept_no, d.dept_name, t.title, count(t.title) as count
From (dept_emp as d1 inner join departments as d2 on d1.dept_no = d2.dept_no) as d
    inner join titles as t on d.emp_no = t.emp_no
Where d1.to_date = '9999-01-01' and t.to_date = '9999-01-01'
Group By d.dept_no, t.title

-- Learning Solution

-- 本题的关键在于用 GROUP BY 同时对 de.dept_no 和 t.title 进行分组，具体思路如下：
-- 1、先用 INNER JOIN 连接 dept_emp 与 salaries，根据测试数据添加限定条件 de.to_date = '9999-01-01' AND t.to_date = '9999-01-01'，即当前员工的当前头衔
-- 2、再用 INNER JOIN 连接departments，限定条件为 de.dept_no = dp.dept_no，即部门编号相同
-- 3、最后用 GROUP BY 同时对 de.dept_no 和 t.title 进行分组，用 COUNT(t.title) 统计相同部门下相同头衔的员工个数

SELECT de.dept_no, dp.dept_name, t.title, COUNT(t.title) AS count
FROM titles AS t INNER JOIN dept_emp AS de 
ON t.emp_no = de.emp_no AND de.to_date = '9999-01-01' AND t.to_date = '9999-01-01'
INNER JOIN departments AS dp 
ON de.dept_no = dp.dept_no
GROUP BY de.dept_no, t.title