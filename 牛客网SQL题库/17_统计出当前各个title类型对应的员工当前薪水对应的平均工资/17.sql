-- 统计出当前各个title类型对应的员工当前薪水对应的平均工资。结果给出title以及平均工资avg。
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
CREATE TABLE IF NOT EXISTS "titles" (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);



-- My solution
Select t.title, avg(s.salary) as avg
From titles as t inner join salaries as s on t.emp_no = s.emp_no
Where t.to_date = '9999-01-01' and s.to_date ='9999-01-01'
Group By t.title
Order by t.title



-- Learning Solution
select title,avg(salary) as avg 
from salaries,titles 
where salaries.emp_no = titles.emp_no and salaries.to_date='9999-01-01' and titles.to_date='9999-01-01'
group by title ;正确