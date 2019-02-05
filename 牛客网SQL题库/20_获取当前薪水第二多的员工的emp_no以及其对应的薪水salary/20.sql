

-- 获取当前（to_date='9999-01-01'）薪水第二多的员工的emp_no以及其对应的薪水salary
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`)); 




-- My Solution

Select emp_no,salary
From salaries
where to_date='9999-01-01'
Order By salary Desc
Limit 1 offset 1

-- Learning Solution
-- (1) 首先这样可以解决多个人工资相同的问题；
-- (2) 另外，筛选出第二多的工资时要注意distinct salary，否则不能选出第二多的工资。

select emp_no, salary from salaries
where to_date = '9999-01-01' and salary = (select distinct salary from salaries order by salary desc limit 1,1)
