-- 删除emp_no重复的记录，只保留最小的id对应的记录。

-- 题目描述
-- 删除emp_no重复的记录，只保留最小的id对应的记录。
CREATE TABLE IF NOT EXISTS titles_test (
id int(11) not null primary key,
emp_no int(11) NOT NULL,
title varchar(50) NOT NULL,
from_date date NOT NULL,
to_date date DEFAULT NULL);

insert into titles_test values ('1', '10001', 'Senior Engineer', '1986-06-26', '9999-01-01'),
('2', '10002', 'Staff', '1996-08-03', '9999-01-01'),
('3', '10003', 'Senior Engineer', '1995-12-03', '9999-01-01'),
('4', '10004', 'Senior Engineer', '1995-12-03', '9999-01-01'),
('5', '10001', 'Senior Engineer', '1986-06-26', '9999-01-01'),
('6', '10002', 'Staff', '1996-08-03', '9999-01-01'),
('7', '10003', 'Senior Engineer', '1995-12-03', '9999-01-01');


-- My Soltion
Delete From titles_test
Where id In (Select t1.id
             From titles_test as t1, titles_test as t2
             Where t1.emp_no == t2.emp_no and t1.id<t2.id)


-- Learning Soltion
-- 本题思路如下：先用 GROUP BY 和 MIN() 选出每个 emp_no 分组中最小的 id，然后用 DELETE FROM ... WHERE ... NOT IN ... 语句删除 “非每个分组最小id对应的所有记录”

DELETE FROM titles_test WHERE id NOT IN 
(SELECT MIN(id) FROM titles_test GROUP BY emp_no)