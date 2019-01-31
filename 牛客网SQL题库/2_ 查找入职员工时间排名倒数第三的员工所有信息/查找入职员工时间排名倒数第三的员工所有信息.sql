
-- 查找入职员工时间排名倒数第三的员工所有信息
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));



-- LIMIT m,n : 表示从第m+1条开始，取n条数据；
-- LIMIT n ： 表示从第0条开始，取n条数据，是limit(0,n)的缩写。
-- 本题limit 2,1 表示从第（2+1）条数据开始，取一条数据，即入职员工时间排名倒数第三的员工。

-- 注意可能会有重复的hire_date
select * 
from employees 
where hire_date=(select distinct hire_date from employees order by hire_date Desc Limit 2,1);