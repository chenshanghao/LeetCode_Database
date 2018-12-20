# Write your MySQL query statement below
SELECT A.Name AS Employee
FROM Employee AS a JOIN Employee AS b
     ON a.ManagerId = b.Id
Where a.Salary > b.Salary