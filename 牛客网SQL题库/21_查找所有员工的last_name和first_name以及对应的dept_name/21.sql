

查找所有员工的last_name和first_name以及对应的dept_name，也包括暂时没有分配部门的员工
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
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`)); 


-- My Solution

Select e.last_name, e.first_name, d.dept_name
From employees as e left join 
               (select * from dept_emp 
                inner join departments on dept_emp.dept_no = departments.dept_no) as d
                on e.emp_no = d.emp_no


-- Learning Solution

本题思路为运用两次LEFT JOIN连接嵌套
1、第一次LEFT JOIN连接employees表与dept_emp表，得到所有员工的last_name和first_name以及对应的dept_no，也包括暂时没有分配部门的员工
2、第二次LEFT JOIN连接上表与departments表，即连接dept_no与dept_name，得到所有员工的last_name和first_name以及对应的dept_name，也包括暂时没有分配部门的员工

SELECT em.last_name, em.first_name, dp.dept_name
FROM (employees AS em LEFT JOIN dept_emp AS de ON em.emp_no = de.emp_no)
LEFT JOIN departments AS dp ON de.dept_no = dp.dept_no