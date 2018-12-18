# Write your MySQL query statement below
SELECT
    (SELECT DISTINCT Salary
     FROM Employee
     ORDER BY Salary DESC
     LIMIT 1 OFFSET 1) 
AS SecondHighestSalary;

# 语句1：select * from student limit 9,4
# 语句2：slect * from student limit 4 offset 9
# // 语句1和2均返回表student的第10、11、12、13行  
# //语句2中的4表示返回4行，9表示从表的第十行开始