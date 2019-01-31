#由于输出顺序是按照emp_no递增来的，join时salaries表要放在前面，否则输出顺序不对
#由于两个表都有重复数据，所以两个表的to_date都要做限制


Select d.emp_no,s.salary,s.from_date,s.to_date,d.dept_no
From dept_manager as d inner join salaries as s on d.emp_no = s.emp_no
where s.to_date = '9999-01-01' and d.to_date='9999-01-01'
Order By d.emp_no;