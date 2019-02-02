
-- 找出所有员工当前(to_date='9999-01-01')具体的薪水salary情况，对于相同的薪水只显示一次,并按照逆序显示

CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));


-- 我的做法

Select Distinct s1.salary
From (Select emp_no, Max(from_date),salary, to_date
                    From salaries Group By emp_no) as s1
Where s1.to_date = '9999-01-01'
Order by s1.salary Desc


-- 数据量非常巨大时候，比如1000万中有300W重复数据，这时候的distinct的效率略好于group by；
-- 对于相对重复量较小的数据量比如1000万中1万的重复量，用groupby的性能会远优于distnct。


-- 学习方法1 
select salary 
from salaries  
where to_date='9999-01-01' 
group by salary 
order by salary desc;


-- 学习方法2
SELECT DISTINCT salary 
FROM salaries 
WHERE to_date = '9999-01-01'
ORDER BY salary DESC
