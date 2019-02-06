-- 获取员工其当前的薪水比其manager当前薪水还高的相关信息，当前表示to_date='9999-01-01',
-- 结果第一列给出员工的emp_no，
-- 第二列给出其manager的manager_no，
-- 第三列给出该员工当前的薪水emp_salary,
-- 第四列给该员工对应的manager当前的薪水manager_salary
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
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`)); 

-- My Solution
Select dpe.emp_no,dmt.manager_no,dpe.salary as emp_salary, dmt.manager_salary
From (dept_emp as d2 inner join salaries as s2 on d2.emp_no = s2.emp_no) as dpe
    left join 
            (Select d.dept_no, d.emp_no as manager_no, s.salary as manager_salary
            From dept_manager as d inner join salaries as s on d.emp_no = s.emp_no
            Where d.to_date='9999-01-01' and s.to_date='9999-01-01') as dmt
    on dpe.dept_no = dmt.dept_no
Where dpe.salary > dmt.manager_salary and s2.to_date='9999-01-01' and d2.to_date='9999-01-01'


-- Learning Solution
-- 本题主要思想是创建两张表（一张记录当前所有员工的工资，另一张只记录部门经理的工资）进行比较，具体思路如下：
-- 1、先用INNER JOIN连接salaries和demp_emp，建立当前所有员工的工资记录sem
-- 2、再用INNER JOIN连接salaries和demp_manager，建立当前所有员工的工资记录sdm
-- 3、最后用限制条件sem.dept_no = sdm.dept_no AND sem.salary > sdm.salary找出同一部门中工资比经理高的员工，并根据题意依次输出emp_no、manager_no、emp_salary、manager_salary

SELECT sem.emp_no AS emp_no, sdm.emp_no AS manager_no, sem.salary AS emp_salary, sdm.salary AS manager_salary
FROM (SELECT s.salary, s.emp_no, de.dept_no FROM salaries s INNER JOIN dept_emp de
ON s.emp_no = de.emp_no AND s.to_date = '9999-01-01' ) AS sem, 
(SELECT s.salary, s.emp_no, dm.dept_no FROM salaries s INNER JOIN dept_manager dm
ON s.emp_no = dm.emp_no AND s.to_date = '9999-01-01' ) AS sdm
WHERE sem.dept_no = sdm.dept_no AND sem.salary > sdm.salary