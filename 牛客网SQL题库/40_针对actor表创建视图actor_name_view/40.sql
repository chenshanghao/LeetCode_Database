-- 针对actor表创建视图actor_name_view


-- 题目描述
-- 针对actor表创建视图actor_name_view，只包含first_name以及last_name两列，并对这两列重新命名，first_name为first_name_v，last_name修改为last_name_v：
CREATE TABLE IF NOT EXISTS actor (
actor_id smallint(5) NOT NULL PRIMARY KEY,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
last_update timestamp NOT NULL DEFAULT (datetime('now','localtime')))


-- My Solution

Create View actor_name_view AS
Select first_name as first_name_v, last_name as last_name_v
From actor


-- Learning Solution

-- 本题可用以下两种方法求解，区别在于命名VIEW中字段名的方法差异。另外，本题OJ系统有Bug，由错误提示可以看到，VIEW中本应有字段first_name_v，而OJ系统误设为了fist_name_v。

-- 方法一：注意 CREATE VIEW ... AS ... 的 AS 是创建视图语法中的一部分，而后面的两个 AS 只是为字段创建别名
CREATE VIEW actor_name_view AS
SELECT first_name AS fist_name_v, last_name AS last_name_v
FROM actor 


-- 方法二：直接在视图名的后面用小括号创建视图中的字段名
CREATE VIEW actor_name_view (fist_name_v, last_name_v) AS
SELECT first_name, last_name FROM actor 