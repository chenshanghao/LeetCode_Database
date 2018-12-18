# Write your MySQL query statement below
Select P.FirstName, P.LastName, A.City, A.State
From  Person as P
Left Join Address as A
ON P.PersonId=A.PersonId

