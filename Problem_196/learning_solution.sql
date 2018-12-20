# Write your MySQL query statement below

# Solution 1
DELETE FROM Person 
WHERE Id NOT IN (
    SELECT MIN(p.Id) 
    FROM (SELECT * FROM Person) p
    Group by p.Email) ;
    
# Solution 2
DELETE p1
FROM Person p1, Person p2
WHERE p1.Email = p2.Email AND
p1.Id > p2.Id;


