
-- 1、由于测试数据中，salaries.emp_no 不唯一（因为号码为 emp_no 的员工会有多次涨薪的可能，所以在 salaries 中对应的记录不止一条），
-- employees.emp_no 唯一，即 salaries 的数据会多于 employees，因此需先找到 employees.emp_no 在 salaries 表中对应的记录salaries.emp_no，则有限制条件 e.emp_no = s.emp_no

-- 2、根据题意注意到 salaries.from_date 和 employees.hire_date 的值应该要相等，因此有限制条件 e.hire_date = s.from_date

-- 3、根据题意要按照 emp_no 值逆序排列，因此最后要加上 ORDER BY e.emp_no DESC

-- 4、为了代码良好的可读性，运用了 Alias 别名语句，将 employees 简化为 e，salaries 简化为s，即 employees AS e 与 salaries AS s，其中 AS 可以省略

********************************
--内连接是取左右两张表的交集形成一个新表，用FROM并列两张表后仍然还是两张表。
--如果还要对新表进行操作则要用内连接。从效率上看应该FROM并列查询比较快，因为不用形成新表。本题从效果上看两个方法没区别。
********************************

-- 方法一：利用 INNER JOIN 连接两张表
SELECT e.emp_no, s.salary FROM employees AS e INNER JOIN salaries AS s
ON e.emp_no = s.emp_no AND e.hire_date = s.from_date
ORDER BY e.emp_no DESC

-- 方法二：直接用逗号并列查询两张表
SELECT e.emp_no, s.salary FROM employees AS e, salaries AS s
WHERE e.emp_no = s.emp_no AND e.hire_date = s.from_date
ORDER BY e.emp_no DESC

 
