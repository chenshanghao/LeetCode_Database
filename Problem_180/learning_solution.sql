# Write your MySQL query statement below
SELECT distinct(tb1.num) as ConsecutiveNums
FROM Logs as tb1, Logs as tb2, Logs as tb3
Where tb1.Id + 1 = tb2.Id And tb2.Id+1 = tb3.Id And tb1.Num = tb2.Num And tb2.Num=tb3.Num;
