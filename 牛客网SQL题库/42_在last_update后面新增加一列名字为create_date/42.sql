-- 存在actor表，包含如下列信息：
CREATE TABLE IF NOT EXISTS actor (
actor_id smallint(5) NOT NULL PRIMARY KEY,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
last_update timestamp NOT NULL DEFAULT (datetime('now','localtime')));
现在在last_update后面新增加一列名字为create_date, 类型为datetime, NOT NULL，默认值为'0000 00:00:00'



-- Learning Solution
-- 用 ALTER TABLE ... ADD ... 语句可以向已存在的表插入新字段，并且能够与创建表时一样，在字段名和数据类型后加入NOT NULL、DEFAULT等限定，可参考：

Alter Table actor 
Add Column create_date datetime Not Null Default '0000-00-00 00:00:00'