# 针对上面的salaries表emp_no字段创建索引idx_emp_no

-- 针对salaries表emp_no字段创建索引idx_emp_no，查询emp_no为10005, 使用强制索引。
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
create index idx_emp_no on salaries(emp_no);


-- Learning Solution 1 
-- SQLite中，使用 INDEXED BY 语句进行强制索引查询，可参考：
Select *
From salaries INDEXED BY idx_emp_no
Where emp_no = 10005


-- My Solution
-- MySQL中，使用 FORCE INDEX 语句进行强制索引查询，可参考：
SELECT * FROM salaries FORCE INDEX idx_emp_no WHERE emp_no = 10005
