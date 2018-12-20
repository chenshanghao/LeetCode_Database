# Write your MySQL query statement below

Select Name as Customers
From Customers
WHERE Id NOT IN(
    Select Distinct CustomerId
    From Orders
)
