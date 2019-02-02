-- 获取所有员工当前的manager，如果当前的manager是自己的话结果不显示，当前表示to_date='9999-01-01'。
-- 结果第一列给出当前员工的emp_no,第二列给出其manager对应的manager_no。

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


-- My Solution
Select d1.emp_no, d2.emp_no as manager_no
From dept_emp as d1 inner join dept_manager as d2 on d1.dept_no = d2.dept_no
where d1.emp_no <> d2.emp_no and d2.to_date='9999-01-01'