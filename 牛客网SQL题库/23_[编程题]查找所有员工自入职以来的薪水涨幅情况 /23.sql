
-- 查找所有员工自入职以来的薪水涨幅情况，给出员工编号emp_no以及其对应的薪水涨幅growth，并按照growth进行升序
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

Select s_new.emp_no,(s_new.s_cur - s_old.s_beg) as growth
From
(Select s1.emp_no, s1.salary as s_cur
From employees as e1 left join salaries as s1 on e1.emp_no = s1.emp_no
Where s1.to_date = '9999-01-01') as s_new,

(Select s2.emp_no,s2.salary as s_beg
From employees as e2 left join salaries as s2 on e2.emp_no = s2.emp_no
Where s2.from_date = e2.hire_date) as s_old

Where s_new.emp_no = s_old.emp_no
order by growth;

-- Learning Solution
-- 本题思路是先分别用两次LEFT JOIN左连接employees与salaries，建立两张表，
-- 分别存放员工当前工资（sCurrent）与员工入职时的工资（sStart），
-- 再用INNER JOIN连接sCurrent与sStart，最后限定在同一员工下用当前工资减去入职工资。



-- 方法一：内层用LEFT JOIN，外层用INNER JOIN（内层也可以改用 INNER JOIN）

SELECT sCurrent.emp_no, (sCurrent.salary-sStart.salary) AS growth
FROM (SELECT s.emp_no, s.salary FROM employees e LEFT JOIN salaries s ON e.emp_no = s.emp_no WHERE s.to_date = '9999-01-01') AS sCurrent
INNER JOIN (SELECT s.emp_no, s.salary FROM employees e LEFT JOIN salaries s ON e.emp_no = s.emp_no WHERE s.from_date = e.hire_date) AS sStart
ON sCurrent.emp_no = sStart.emp_no
ORDER BY growth


-- 方法二：内外都层用FROM并列查询

SELECT sCurrent.emp_no, (sCurrent.salary-sStart.salary) AS growth
FROM (SELECT s.emp_no, s.salary FROM employees e, salaries s WHERE e.emp_no = s.emp_no AND s.to_date = '9999-01-01') AS sCurrent,
(SELECT s.emp_no, s.salary FROM employees e, salaries s WHERE e.emp_no = s.emp_no AND s.from_date = e.hire_date) AS sStart
WHERE sCurrent.emp_no = sStart.emp_no
ORDER BY growth

