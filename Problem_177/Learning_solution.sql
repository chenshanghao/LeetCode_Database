CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M = N-1;
  RETURN (
    Select Distinct Salary 
    From Employee 
    Order By Salary Desc 
    Limit 1 Offset M
  );
END