# 数据库（database）保存有组织的数据的容器（通常是一个文件或一组文件）。
# 表（table）某种特定类型数据的结构化清单。
# 列（column）表中的一个字段。所有表都是由一个或多个列组成的。

# 主键（primary key）一列（或一组列），其值能够唯一标识表中每一行。
-- 任意两行都不具有相同的主键值；
-- 每一行都必须具有一个主键值（主键列不允许NULL值）；
-- 主键列中的值不允许修改或更新；
-- 主键值不能重用（如果某行从表中删除，它的主键不能赋给以后的新行）。



#1. select
SELECT * FROM Customers;

SELECT column1, column2, ...
FROM table_name;


#2. select distinct
# The SELECT DISTINCT statement is used to return only distinct (different) values.
SELECT DISTINCT column1, column2, ...
FROM table_name;

#3. where 可以增加多个过滤条件，每个条件间都要使用A ND关键字。
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

SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

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

# 常用的文本处理函数
-- LEFT()（或使用子字符串函数） 返回字符串左边的字符
-- LENGTH()（也使用DATALENGTH()或LEN()） 返回字符串的长度
-- LOWER()（Access使用LCASE()） 将字符串转换为小写
-- LTRIM() 去掉字符串左边的空格
-- RIGHT()（或使用子字符串函数） 返回字符串右边的字符
-- RTRIM() 去掉字符串右边的空格
-- SOUNDEX() 返回字符串的SOUNDEX值
-- UPPER()（Access使用UCASE()） 将字符串转换为大写

#11 Min and Max
SELECT Max(column_name)
FROM table_name
WHERE condition;
#exapmle
SELECT MAX(Price) AS LargestPrice
FROM Products;

-- 1）AVG()函数忽略列值为NULL的行。
-- 2）使用COUNT(*)对表中行的数目进行计数，不管表列中包含的是空值（NULL）还是非空值。
-- 3）使用COUNT(column)对特定列中具有值的行进行计数，忽略NULL值。
-- 4）MAX(), MIN()函数忽略列值为NULL的行
-- 4）SUM()函数忽略列值为NULL的行。

SELECT AVG(DISTINCT prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';


#12 Like wildcard（通配符）
# % - The percent sign represents zero, one, or multiple characters 通配符%看起来像是可以匹配任何东西，但有个例外，这就是NULL。
# _ - The underscore represents a single character
-- 正如所见，SQL的通配符很有用。但这种功能是有代价的，即通配符搜索一般比前面讨论的其他搜索要耗费更长的处理时间。这里给出一些使
-- 用通配符时要记住的技巧。
-- 不要过度使用通配符。如果其他操作符能达到相同的目的，应该使用其他操作符。
-- 在确实需要使用通配符时，也尽量不要把它们用在搜索模式的开始处。把通配符置于开始处，搜索起来是最慢的。
-- 仔细注意通配符的位置。如果放错地方，可能不会返回想要的数据。
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
# Not like 'a%'                  Finds any values that not start with the letter "a".
#example
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

# Using the [charlist] Wildcard
# The following SQL statement selects all customers with a City starting with "b", "s", or "p":
SELECT * FROM Customers
WHERE City LIKE '[bsp]%';

# The two following SQL statements select all customers with a City NOT starting with "b", "s", or "p":
SELECT * FROM Customers
WHERE City LIKE '[!bsp]%';


#13 
-- 在有很多合法选项时，IN操作符的语法更清楚，更直观。
-- 在与其他A ND和OR操作符组合使用IN时，求值顺序更容易管理。
-- IN操作符一般比一组OR操作符执行得更快（在上面这个合法选项很少的例子中，你看不出性能差异）。
-- IN的最大优点是可以包含其他SELECT语句，能够更动态地建立WHERE子句
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1,value2,...);

# In 与 = 转换
select * from Websites where name in ('Google','菜鸟教程');
select * from Websites where name = 'Google' or name = '菜鸟教程';

# Between (请注意，在不同的数据库中，BETWEEN 操作符会产生不同的结果！)
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

SELECT * FROM Websites
WHERE alexa NOT BETWEEN 1 AND 20;

SELECT * FROM Websites
WHERE name BETWEEN 'A' AND 'H';

SELECT * FROM access_log
WHERE date BETWEEN '2016-05-10' AND '2016-05-14';

# SQL别名
# Column
-- 在下面的情况下，使用别名很有用：
-- 在查询中涉及超过一个表
-- 在查询中使用了函数
-- 列名称很长或者可读性差
-- 需要把两个列或者多个列结合在一起
SELECT column_name AS alias_name
FROM table_name;

# Table
SELECT column_name(s)
FROM table_name AS alias_name;

# Join (INNER JOIN)

# Group BY
-- 在使用GROUP BY子句前，需要知道一些重要的规定。
-- 1. GROUP BY子句可以包含任意数目的列，因而可以对分组进行嵌套，更细致地进行数据分组。
-- 2. 如果在GROUP BY子句中嵌套了分组，数据将在最后指定的分组上进行汇总。换句话说，在建立分组时，指定的所有列都一起计算（所以
-- 3. 不能从个别的列取回数据）。
-- 4. GROUP BY子句中列出的每一列都必须是检索列或有效的表达式（但不能是聚集函数）。如果在SELECT中使用表达式，则必须在GROUP
-- 5. BY子句中指定相同的表达式。不能使用别名。
-- 6. 大多数SQL实现不允许GROUP BY列带有长度可变的数据类型（如文本或备注型字段）。
-- 7. 除聚集计算语句外，SELECT语句中的每一列都必须在GROUP BY子句中给出。
-- 8, 如果分组列中包含具有NULL值的行，则NULL将作为一个分组返回。如果列中有多行NULL值，它们将分为一组。
-- 9. GROUP BY子句必须出现在WHERE子句之后，ORDER BY子句之前。
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

# The following SQL statement lists the number of customers in each country, sorted high to low:
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

# Having 
-- 说明：HAVING和WHERE的差别
-- 这里有另一种理解方法，WHERE在数据分组前进行过滤，HA VING在数据分组后进行过滤。这是一个重要的区别，WHERE排除的行不包括
-- 在分组中。这可能会改变计算值，从而影响HA VING子句中基于这些值过滤掉的分组。
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

# SQL EXISTS Examples
SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);

# The following SQL statement returns TRUE and lists the suppliers with a product price equal to 22:
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE SupplierId = Suppliers.supplierId AND Price = 22);

# The SQL ANY and ALL Operators
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
(SELECT column_name FROM table_name WHERE condition);

SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
(SELECT column_name FROM table_name WHERE condition);


# SQL SELECT INTO Statement
# The SELECT INTO statement copies data from one table into a new table.
SELECT column1, column2, column3, ...
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
FROM Customers;

SELECT * INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany';

# SQL INSERT INTO SELECT Statement
# The INSERT INTO SELECT statement copies data from one table and inserts it into another table.
INSERT INTO table2
SELECT * FROM table1
WHERE condition;

# SQL CASE Statement
# The CASE statement goes through conditions and return a value when the first condition is met.
# If there is no ELSE part and no conditions are true, it returns NULL.
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

SELECT OrderID, Quantity,
CASE WHEN Quantity > 30 THEN "The quantity is greater than 30"
WHEN Quantity = 30 THEN "The quantity is 30"
ELSE "The quantity is under 30"
END FROM OrderDetails;

# SQL IFNULL(), ISNULL(), COALESCE(), and NVL() Functions
SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
FROM Products

# SQL Stored Procedures for SQL Server
CREATE PROCEDURE procedure_name
AS
sql_statement
GO;

# Example
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;

EXEC SelectAllCustomers City = "London", PostalCode = "WA1 1DP";

# SQL Comments
--Select all:
SELECT * FROM Customers;

# SQL CREATE DATABASE Statement
CREATE DATABASE databasename;

# The SQL DROP DATABASE Statement
DROP DATABASE databasename;

# SQL BACKUP DATABASE for SQL Server
BACKUP DATABASE databasename
TO DISK = 'filepath';

# The SQL CREATE TABLE Statement
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);

# SQL DROP TABLE Statement
DROP TABLE table_name;

# SQL ALTER TABLE Statement
ALTER TABLE table_name
ADD column_name datatype;

-----------------------------------------------------------------------------------------
# SQL Constraints
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);

-- NOT NULL - Ensures that a column cannot have a NULL value
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

-- UNIQUE - Ensures that all values in a column are different
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

-- PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

-- FOREIGN KEY - Uniquely identifies a row/record in another table
-- 1.主键是能确定一条记录的唯一标识。比如，一条记录包括身份证号码，姓名，年龄。身份证号码是唯一确认你这个人的，其他的都可能有重复，所以身份证号码是主键。
-- 外键用于与另一张表相关联。是能确认另一张表记录的字段，用于保持数据的一致性。比如，A表中的一个字段，是B表的主键，那它就可以是A表的外键。

-- CHECK - Ensures that all values in a column satisfies a specific condition
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

-- DEFAULT - Sets a default value for a column when no value is specified

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

-- INDEX - Used to create and retrieve data from the database very quickly
CREATE INDEX idx_lastname
ON Persons (LastName);

-- SQL AUTO INCREMENT Field -- Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.
CREATE TABLE Persons (
    ID int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);
-----------------------------------------------------------------------------------------

## SQL Dates
-- MySQL comes with the following data types for storing a date or a date/time value in the database:
-- DATE - format YYYY-MM-DD
-- DATETIME - format: YYYY-MM-DD HH:MI:SS
-- TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
-- YEAR - format YYYY or YY

# SQL Views
# In SQL, a view is a virtual table based on the result-set of an SQL statement.
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

# SQL Injection
-- https://baike.baidu.com/item/SQL%E6%B3%A8%E5%85%A5
-- SQL injection is a code injection technique that might destroy your database.
-- SQL injection is one of the most common web hacking techniques.
-- SQL injection is the placement of malicious code in SQL statements, via web page input.

# sql hosting
-- If you want your web site to be able to store and retrieve data from a database, your web server should have access to a database-system that uses the SQL language.
-- If your web server is hosted by an Internet Service Provider (ISP), you will have to look for SQL hosting plans.
-- The most common SQL hosting databases are MS SQL Server, Oracle, MySQL, and MS Access.











































