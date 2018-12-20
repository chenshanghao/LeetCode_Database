# Write your MySQL query statement below
# Solution 1
update salary
set sex = Case when sex = 'f' then 'm'
               else 'f' end;

# Solution 2
update salary set sex = IF (sex = "m", "f", "m");
