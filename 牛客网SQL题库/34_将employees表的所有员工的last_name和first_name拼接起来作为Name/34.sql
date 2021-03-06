-- 将employees表的所有员工的last_name和first_name拼接起来作为Name

-- 将employees表的所有员工的last_name和first_name拼接起来作为Name，中间以一个空格区分
CREATE TABLE `employees` ( `emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));



-- My Solution (Only works on Mysql)
Select concat(last_name, ' ', first_name) as Name
From employees


-- Learning Solution
-- 不同数据库连接字符串的方法不完全相同，MySQL、SQL Server、Oracle等数据库支持CONCAT方法，而本题所用的SQLite数据库只支持用连接符号"||"来连接字符串
SELECT last_name||" "||first_name AS Name 
FROM employees