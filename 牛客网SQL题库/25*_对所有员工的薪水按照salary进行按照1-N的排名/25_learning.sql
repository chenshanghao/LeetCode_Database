-- 题目描述
-- 对所有员工的当前(to_date='9999-01-01')薪水按照salary进行按照1-N的排名，相同salary并列且按照emp_no升序排列
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));



-- Learning Solution 1

SELECT s1.emp_no, s1.salary, COUNT(DISTINCT s2.salary) AS rank
FROM salaries AS s1, salaries AS s2
WHERE s1.to_date = '9999-01-01'  AND s2.to_date = '9999-01-01' AND s1.salary <= s2.salary
GROUP BY s1.emp_no
ORDER BY s1.salary DESC, s1.emp_no ASC

-- Learning Solution 2
-- 本题的主要思想是复用salaries表进行比较排名，具体思路如下：
-- 1、从两张相同的salaries表（分别为s1与s2）进行对比分析，先将两表限定条件设为to_date = '9999-01-01'，挑选出当前所有员工的薪水情况。
-- 2、本题的精髓在于 s1.salary <= s2.salary，意思是在输出s1.salary的情况下，有多少个s2.salary大于等于s1.salary，
-- 比如当s1.salary=94409时，有3个s2.salary（分别为94692,94409,94409）大于等于它，但由于94409重复，利用COUNT(DISTINCT s2.salary)去重可得工资为94409的rank等于2。其余排名以此类推。
-- 3、千万不要忘了GROUP BY s1.emp_no，否则输出的记录只有一条（可能是第一条或者最后一条，根据不同的数据库而定），因为用了合计函数COUNT()
-- 4、最后先以 s1.salary 逆序排列，再以 s1.emp_no 顺序排列输出结果

-- Learning Solution 2
-- 最后在支持ROW_NUMBER、RANK、DENSE_RANK等函数的SQL Server数据库中，有以下参考代码，可惜在本题的SQLite数据库中不支持。

SELECT emp_no, salaries, DENSE_RANK() OVER(ORDER BY salary DESC) AS rank
WHERE to_date = '9999-01-01' ORDER BY salary DESC, emp_no ASC
