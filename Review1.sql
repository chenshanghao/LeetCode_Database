
#1. select
SELECT * FROM Customers;

SELECT column1, column2, ...
FROM table_name;


#2. select distinct
# The SELECT DISTINCT statement is used to return only distinct (different) values.
SELECT DISTINCT column1, column2, ...
FROM table_name;

#3. where
SELECT column1, column2, ...
FROM table_name
WHERE condition;

SELECT * FROM Customers
WHERE Country='Mexico';

#Operator    Description
#   =            Equal
#   <>         Not equal. Note: In some versions of SQL this operator may be written as !=
#   >            Greater than
#   <            Less than
#   >=           Greater than or equal
#   <=           Less than or equal
#  BETWEEN       Between an inclusive range
#   LIKE         Search for a pattern
#    IN          To specify multiple possible values for a column

#4. AND OR and NOT
SELECT column1, column2,...
FROM table_name
WHERE condition1 AND condition2 AND condition3;

SELECT column1, column2,...
FROM table_name
WHERE condition1 OR condition2 OR condition3;

SELECT column1, column2,...
FROM table_name
WHERE NOT condition;

#5 Order BY
# The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

#6 Insert Into
INSERT INTO table_nmae(column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
#example
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

#7 NULL Values
#It is very important to understand that a NULL 
#value is different from a zero value or a field that contains spaces. 
#A field with a NULL value is one that has been left blank during record creation!
#It is not possible to test for NULL values with comparison operators, such as =, <, or <>.
SELECT column_names
FROM table_name
WHERE column_name IS NULL;

#8 Update
UPDATE table_name
SET column1=value1, column2=value2, ...
WHERE condition;
#example:
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

#9 DELETE
DELETE FROM table_name
WHERE condition;

DELETE FROM Customers
WHERE CustomerName='Alfreds Futterkiste'

#10 Select TOP(MYSQL)
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;
# example
SELECT * FROM Customers
LIMIT 3;

#11 Min and Max
SELECT Max(column_name)
FROM table_name
WHERE condition;
#exapmle
SELECT MAX(Price) AS LargestPrice
FROM Products;

#12 Like
#% - The percent sign represents zero, one, or multiple characters
#_ - The underscore represents a single character
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

#LIKE         Operator                        Description
#WHERE CustomerName LIKE 'a%'    Finds any values that starts with "a"
#WHERE CustomerName LIKE '%a'    Finds any values that ends with "a"
#WHERE CustomerName LIKE '%or%'  Finds any values that have "or" in any position
#WHERE CustomerName LIKE '_r%'   Finds any values that have "r" in the second position
#WHERE CustomerName LIKE 'a_%_%' Finds any values that starts with "a" and are at least 3 characters in length
#WHERE ContactName LIKE 'a%o'    Finds any values that starts with "a" and ends with "o"

#example
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';







































