-- 对first_name创建唯一索引uniq_idx_firstname

-- 题目描述
-- 针对如下表actor结构创建索引：
CREATE TABLE IF NOT EXISTS actor (
actor_id smallint(5) NOT NULL PRIMARY KEY,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
last_update timestamp NOT NULL DEFAULT (datetime('now','localtime')))


-- 对first_name创建唯一索引uniq_idx_firstname，对last_name创建普通索引idx_lastname

-- Learning Solution
CREATE Unique INDEX uniq_idx_firstname ON actor(first_name);
CREATE INDEX idx_lastname ON actor(last_name)

-- 根据题意，本题要用两条语句完成，先用 CREATE UNIQUE INDEX ... ON ... 对first_name创建唯一索引值，再用 CREATE INDEX ... ON ... 对last_name创建普通索引值
//创建唯一索引
CREATE UNIQUE INDEX uniq_idx_firstname on actor(first_name);
//创建普通索引
CREATE INDEX idx_lastname on actor(last_name);