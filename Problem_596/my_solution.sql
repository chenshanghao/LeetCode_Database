# Write your MySQL query statement below
Select class 
From (Select class, count(class) as c
      From (Select Distinct * FROM courses) as T1
      Group BY class) as T2
Where T2.c >=5;