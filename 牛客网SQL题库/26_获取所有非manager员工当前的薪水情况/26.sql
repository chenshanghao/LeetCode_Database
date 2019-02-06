-- 获取所有非manager员工当前的薪水情况，给出dept_no、emp_no以及salary ，当前表示to_date='9999-01-01'
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));



-- My Solution
Select d1.dept_no, d1.emp_no,s.salary
From dept_emp as d1 inner join salaries as s on s.emp_no = d1.emp_no
Where s.to_date ='9999-01-01' 
and d1.emp_no Not in (select emp_no From dept_manager Where to_date = '9999-01-01')


-- Learning Solution
-- Solution 1
SELECT de.dept_no, s.emp_no, s.salary 
FROM dept_emp AS de INNER JOIN salaries AS s ON s.emp_no = de.emp_no AND s.to_date = '9999-01-01'
WHERE de.emp_no NOT IN (SELECT emp_no FROM dept_manager WHERE to_date = '9999-01-01')

-- Solution 2
select de.dept_no,de.emp_no,(select salary from salaries where emp_no=de.emp_no and to_date='9999-01-01') as salary 
from dept_emp de left join dept_manager dm on de.emp_no=dm.emp_no  
where de.to_date='9999-01-01' and dm.emp_no is null;