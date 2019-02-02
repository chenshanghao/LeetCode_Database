-- 获取所有非manager的员工emp_no
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



-- my solution
Select e.emp_no
From employees as e
where e.emp_no not in (Select emp_no from dept_manager)


-- employees 里员工的数据肯定比 dept_manager 的员工数据多，所以先将二者做左连接，然后在employees 的员工姓名，
-- 对应dept_manager没有与之匹配的就会显示为null，使得两表的行数一样，所以再进行 where 时，就选出了 employee 中的独有数据。

SELECT employees.emp_no FROM employees LEFT JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
WHERE dept_no IS NULL




