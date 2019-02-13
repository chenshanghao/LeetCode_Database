-- https://www.kancloud.cn/wizardforcel/w3school-sql/94010


-- 题目描述
-- 构造一个触发器audit_log，在向employees_test表中插入一条数据的时候，触发插入相关的数据到audit中。
CREATE TABLE employees_test(
ID INT PRIMARY KEY NOT NULL,
NAME TEXT NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR(50),
SALARY REAL
);
CREATE TABLE audit(
EMP_no INT NOT NULL,
NAME TEXT NOT NULL
);



-- My Solution
Create trigger audit_log After Insert On  employees_test
Begin
    Insert INTO audit(EMP_no, NAME) Values(new.ID, new.NAME);
End;


-- Learning Solution
-- 1、用 CREATE TRIGGER 语句构造触发器，用 BEFORE或AFTER 来指定在执行后面的SQL语句之前或之后来触发TRIGGER
-- 2、触发器执行的内容写出 BEGIN与END 之间
-- 3、可以使用 NEW与OLD 关键字访问触发后或触发前的employees_test表单记录

CREATE TRIGGER audit_log AFTER INSERT ON employees_test
BEGIN
    INSERT INTO audit VALUES (NEW.ID, NEW.NAME);
END;